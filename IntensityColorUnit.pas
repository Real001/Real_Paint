unit IntensityColorUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TIntensityColorForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    TrackBarRed: TTrackBar;
    TrackBarGreen: TTrackBar;
    TrackBarBlue: TTrackBar;
    Label7: TLabel;
    Label8: TLabel;
    Image1: TImage;
    Image2: TImage;
    ButtonOK: TButton;
    ButtonCancel: TButton;
    procedure ButtonOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IntensityColor;
    procedure TrackBarRedChange(Sender: TObject);
    procedure TrackBarGreenChange(Sender: TObject);
    procedure TrackBarBlueChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  IntensityColorForm: TIntensityColorForm;

const MaxPixelCount=32768;

type pRGBArray  =  ^TRGBArray;
    TRGBArray  =  ARRAY[0..MaxPixelCount-1] OF TRGBTriple;

function Min(a, b:integer):integer;
function Max(a, b:integer):integer;

implementation

{$R *.dfm}

Uses MainUnit;

function Min(a, b: integer): integer;
begin
  if a < b then result := a
  else result := b;
end;

function Max(a, b: integer): integer;
begin
  if a > b then result := a
  else result := b;
end;

procedure TIntensityColorForm.IntensityColor;
var
  i,j,Red,Blue,Green:integer;
  Orig,Dest:pRGBArray;
begin
  Red:=TrackBarRed.Position;
  Green := TrackBarGreen.Position;
  Blue := TrackBarBlue.Position;

  if Red <= 0 then Label4.Caption := IntToStr(Red)
  else Label4.Caption := Format('+%d', [Red]);
  if Green <= 0 then Label5.Caption := IntToStr(Green)
  else Label5.Caption := Format('+%d', [Green]);
  if Blue <= 0 then Label6.Caption := IntToStr(Blue)
  else Label6.Caption := Format('+%d', [Blue]);

    // ��� ������� ������� � ������
  for i := 0 to Image1.Picture.Height - 1 do
  begin
    Orig := Image1.Picture.Bitmap.ScanLine[i];
    Dest := Image2.Picture.Bitmap.ScanLine[i];

      // ��� ������� ������� � �������
    for j := 0 to Image1.Picture.Width - 1 do
    begin
        // add brightness value to pixel's RGB values
      if Red > 0 then
        Dest[j].rgbtRed := Min(255, Orig[j].rgbtRed + Red)
      else
        Dest[j].rgbtRed := Max(0, Orig[j].rgbtRed + Red);

      if Green > 0 then
        Dest[j].rgbtGreen := Min(255, Orig[j].rgbtGreen + Green)
      else
        Dest[j].rgbtGreen := Max(0, Orig[j].rgbtGreen + Green);

      if Blue > 0 then
        Dest[j].rgbtBlue := Min(255, Orig[j].rgbtBlue + Blue)
      else
        Dest[j].rgbtBlue := Max(0, Orig[j].rgbtBlue + Blue);
    end;
  end;

Image2.Repaint;
end;


procedure TIntensityColorForm.TrackBarBlueChange(Sender: TObject);
begin
  IntensityColor;
end;

procedure TIntensityColorForm.TrackBarGreenChange(Sender: TObject);
begin
  IntensityColor;
end;

procedure TIntensityColorForm.TrackBarRedChange(Sender: TObject);
begin
  IntensityColor;
end;

procedure TIntensityColorForm.ButtonOKClick(Sender: TObject);
begin
  img:=Image2.Picture.Bitmap;
  buffer.Assign(img);
  IntensityColorForm.Close;
end;

procedure TIntensityColorForm.FormCreate(Sender: TObject);
begin
  Image1.Picture.Bitmap.PixelFormat:=pf24bit;
  Image2.Picture.Bitmap.PixelFormat:=pf24bit;
  TrackBarRed.Position:=0;
  TrackBarGreen.Position:=0;
  TrackBarBlue.Position:=0;
end;

end.
