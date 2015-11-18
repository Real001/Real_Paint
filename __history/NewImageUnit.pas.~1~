unit NewImageUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, VCLTee.TeCanvas;

type
  TNewImageForm = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewImageForm: TNewImageForm;
  a,b:integer; c:real;

implementation

{$R *.dfm}

Uses MainUnit, Unit3;

procedure TNewImageForm.Button1Click(Sender: TObject); //создание изображения
begin
  MainForm.PaintBox.Width:=StrToInt(Edit1.Text);
  MainForm.PaintBox.Height:=StrToInt(Edit2.Text);
  img.Width:=StrToInt(Edit1.Text);
  img.Height:=StrToInt(Edit2.Text);
  buffer.Width:=StrToInt(Edit1.Text);
  buffer.Height:=StrToInt(Edit2.Text);
  MainForm.StatusBar1.Panels[0].Text:=Format('%d x %d',[MainForm.PaintBox.Width,
  MainForm.PaintBox.Height]);
  MainForm.PaintBox.Visible:=true;
  if rasmer then begin
    img.Canvas.Brush.Color:=clWhite;
    img.Canvas.FillRect(Rect(0,0,MainForm.PaintBox.Width,MainForm.PaintBox.Height));
    buffer.Canvas.FillRect(Rect(0,0,MainForm.PaintBox.Width,MainForm.PaintBox.Height));
    MainForm.PaintBox.Canvas.FillRect(Rect(0,0,MainForm.PaintBox.Width,MainForm.PaintBox.Height));
    Form3.ListBox1.Clear;
    MainForm.Caption:='Новое изображение - Real Paint v3.0';
    MainForm.Log('Новое изображение');
  end else
    MainForm.Log('Изменен размер изображения');
  w:=img.Width;
  h:=img.Height;
  NewImageForm.Close;
end;

procedure TNewImageForm.Button2Click(Sender: TObject);
begin
  NewImageForm.Close;
end;

procedure TNewImageForm.Edit1Change(Sender: TObject);
begin
  try
    a:=StrToInt(Edit1.Text);
    b:=StrToInt(Edit2.Text);
  except
    on EConvertError do
      ShowMessage('Введите целые числа');
  end;
  c:=a*b/1024;
  if c>1024 then begin
    c:=c/1024;
    Label4.Caption:='Мб';
  end else begin
    c:=c;
    Label4.Caption:='Кб';
  end;
  Edit3.Text:=FloatToStr(c);
end;

procedure TNewImageForm.Edit2Change(Sender: TObject);
begin
  try
    a:=StrToInt(Edit1.Text);
    b:=StrToInt(Edit2.Text);
  except
    on EConvertError do
      ShowMessage('Введите целые числа');
  end;
  c:=a*b/1024;
  if c>1024 then begin
    c:=c/1024;
    Label4.Caption:='Мб';
  end else begin
    c:=c;
    Label4.Caption:='Кб';
  end;
  Edit3.Text:=FloatToStr(c);
end;

procedure TNewImageForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then Button1.Click;
  if key=#27 then Button2.Click;
end;

end.
