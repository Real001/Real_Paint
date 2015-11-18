﻿{*******************************************************}
{                                                       }
{                  Модуль Гауссово размытие             }
{                     Copyright (c) 2015                }
{                                                       }
{                                                       }
{                 Раработчик: Ророт Евгений             }
{                     Создан: 20.10.2015                }
{                  Модифицирован: 20.10.2015            }
{                                                       }
{*******************************************************}


unit GausUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TGausForm = class(TForm)
    Label1: TLabel;
    TrackBar: TTrackBar;
    Edit: TEdit;
    UpDown: TUpDown;
    ButtonOK: TButton;
    ButtonCancel: TButton;
    procedure TrackBarChange(Sender: TObject);
    procedure EditChange(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
    procedure ButtonOKKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GausForm: TGausForm;
  image:TBitmap;

implementation

{$R *.dfm}

Uses MainUnit;

type

  PRGBTriple = ^TRGBTriple;
  TRGBTriple = packed record
    b: byte; //легче для использования чем типа rgbtBlue...
    g: byte;
    r: byte;
  end;

  PRow = ^TRow;
  TRow = array[0..1000000] of TRGBTriple;

  PPRows = ^TPRows;
  TPRows = array[0..1000000] of PRow;

const
  MaxKernelSize = 100;

type

  TKernelSize = 1..MaxKernelSize;

  TKernel = record
    Size: TKernelSize;
    Weights: array[-MaxKernelSize..MaxKernelSize] of single;
  end;
  //идея заключается в том, что при использовании TKernel мы игнорируем
  //Weights (вес), за исключением Weights в диапазоне -Size..Size.

procedure MakeGaussianKernel(var K: TKernel; radius: double;

  MaxData, DataGranularity: double);
//Делаем K (гауссово зерно) со среднеквадратичным отклонением = radius.
//Для текущего приложения мы устанавливаем переменные MaxData = 255,
//DataGranularity = 1. Теперь в процедуре установим значение
//K.Size так, что при использовании K мы будем игнорировать Weights (вес)
//с наименее возможными значениями. (Малый размер нам на пользу,
//поскольку время выполнения напрямую зависит от
//значения K.Size.)
var
  j: integer;
  temp, delta: double;
  KernelSize: TKernelSize;
begin

  for j := Low(K.Weights) to High(K.Weights) do
  begin
    temp := j / radius;
    K.Weights[j] := exp(-temp * temp / 2);
  end;

  //делаем так, чтобы sum(Weights) = 1:

  temp := 0;
  for j := Low(K.Weights) to High(K.Weights) do
    temp := temp + K.Weights[j];
  for j := Low(K.Weights) to High(K.Weights) do
    K.Weights[j] := K.Weights[j] / temp;

  //теперь отбрасываем (или делаем отметку "игнорировать"
  //для переменной Size) данные, имеющие относительно небольшое значение -
  //это важно, в противном случае смазавание происходим с малым радиусом и
  //той области, которая "захватывается" большим радиусом...

  KernelSize := MaxKernelSize;
  delta := DataGranularity / (2 * MaxData);
  temp := 0;
  while (temp < delta) and (KernelSize > 1) do
  begin
    temp := temp + 2 * K.Weights[KernelSize];
    dec(KernelSize);
  end;

  K.Size := KernelSize;

  //теперь для корректности возвращаемого результата проводим ту же
  //операцию с K.Size, так, чтобы сумма всех данных была равна единице:

  temp := 0;
  for j := -K.Size to K.Size do
    temp := temp + K.Weights[j];
  for j := -K.Size to K.Size do
    K.Weights[j] := K.Weights[j] / temp;

end;

function TrimInt(Lower, Upper, theInteger: integer): integer;
begin

  if (theInteger <= Upper) and (theInteger >= Lower) then
    result := theInteger
  else if theInteger > Upper then
    result := Upper
  else
    result := Lower;
end;

function TrimReal(Lower, Upper: integer; x: double): integer;
begin

  if (x < upper) and (x >= lower) then
    result := trunc(x)
  else if x > Upper then
    result := Upper
  else
    result := Lower;
end;

procedure BlurRow(var theRow: array of TRGBTriple; K: TKernel; P: PRow);
var
  j, n, LocalRow: integer;
  tr, tg, tb: double; //tempRed и др.

  w: double;
begin

  for j := 0 to High(theRow) do

  begin
    tb := 0;
    tg := 0;
    tr := 0;
    for n := -K.Size to K.Size do
    begin
      w := K.Weights[n];

      //TrimInt задает отступ от края строки...

      with theRow[TrimInt(0, High(theRow), j - n)] do
      begin
        tb := tb + w * b;
        tg := tg + w * g;
        tr := tr + w * r;
      end;
    end;
    with P[j] do
    begin
      b := TrimReal(0, 255, tb);
      g := TrimReal(0, 255, tg);
      r := TrimReal(0, 255, tr);
    end;
  end;

  Move(P[0], theRow[0], (High(theRow) + 1) * Sizeof(TRGBTriple));
end;

procedure GBlur(theBitmap: TBitmap; radius: double);
var
  Row, Col: integer;
  theRows: PPRows;
  K: TKernel;
  ACol: PRow;
  P: PRow;
begin
  if (theBitmap.HandleType <> bmDIB) or (theBitmap.PixelFormat <> pf24Bit) then

    raise
      exception.Create('GBlur может работать только с 24-битными изображениями');

  MakeGaussianKernel(K, radius, 255, 1);
  GetMem(theRows, theBitmap.Height * SizeOf(PRow));
  GetMem(ACol, theBitmap.Height * SizeOf(TRGBTriple));

  //запись позиции данных изображения:
  for Row := 0 to theBitmap.Height - 1 do

    theRows[Row] := theBitmap.Scanline[Row];

  //размываем каждую строчку:
  P := AllocMem(theBitmap.Width * SizeOf(TRGBTriple));
  for Row := 0 to theBitmap.Height - 1 do

    BlurRow(Slice(theRows[Row]^, theBitmap.Width), K, P);

  //теперь размываем каждую колонку
  ReAllocMem(P, theBitmap.Height * SizeOf(TRGBTriple));
  for Col := 0 to theBitmap.Width - 1 do
  begin
    //- считываем первую колонку в TRow:

    for Row := 0 to theBitmap.Height - 1 do
      ACol[Row] := theRows[Row][Col];

    BlurRow(Slice(ACol^, theBitmap.Height), K, P);

    //теперь помещаем обработанный столбец на свое место в данные изображения:

    for Row := 0 to theBitmap.Height - 1 do
      theRows[Row][Col] := ACol[Row];
  end;

  FreeMem(theRows);
  FreeMem(ACol);
  ReAllocMem(P, 0);
end;


procedure TGausForm.ButtonCancelClick(Sender: TObject);
begin
  buffer.Assign(img);
  GausForm.Close;
end;

procedure TGausForm.ButtonOKClick(Sender: TObject);
begin
  img.Assign(buffer);
  GausForm.Close;
end;

procedure TGausForm.ButtonOKKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    ButtonOK.Click;
  if key=#27 then
    ButtonCancel.Click;
end;

procedure TGausForm.EditChange(Sender: TObject);
begin
  buffer.Assign(img);
  TrackBar.Position:=StrToInt(Edit.Text);
  GBlur(buffer, TrackBar.Position);
  MainForm.PaintBox.Visible:=false;
  MainForm.PaintBox.Visible:=true;
end;

procedure TGausForm.TrackBarChange(Sender: TObject);
begin
  Edit.Text:=IntToStr(TrackBar.Position);
end;

end.
