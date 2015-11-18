unit ContrastUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TContrastForm = class(TForm)
    EditContrast: TEdit;
    UpDownContrast: TUpDown;
    ButtonOK: TButton;
    ButtonCancel: TButton;
    Label1: TLabel;
    EditBright: TEdit;
    TrackBarBright: TTrackBar;
    UpDownBright: TUpDown;
    TrackBarContrast: TTrackBar;
    Label2: TLabel;
    procedure EditContrastChange(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
    procedure TrackBarContrastChange(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TrackBarBrightChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EditBrightChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ContrastForm: TContrastForm;

implementation

{$R *.dfm}

Uses MainUnit;

type
  TRGBTripleArray = array[0..32768] of TRGBTriple;

procedure Contrast(Bitmap: TBitmap; Value: Integer; Local: Boolean);
  function BLimit(B: Integer): Byte;
  begin
    if B < 0 then
      Result := 0
    else if B > 255 then
      Result := 255
    else
      Result := B;
  end;
var
  Dest: pRGBTriple;
  x, y, mr, mg, mb,
  W, H, tr, tg, tb: Integer;
  vd: Double;
begin
  if Value = 0 then Exit;
  W := Bitmap.Width - 1;
  H := Bitmap.Height - 1;
  if Local then begin
    mR := 128;
    mG := 128;
    mB := 128;
  end else begin
    tr := 0;
    tg := 0;
    tb := 0;
    for y := 0 to H do begin
      Dest := Bitmap.ScanLine[y];
      for x := 0 to W do begin
        with Dest^ do begin
          Inc(tb, rgbtBlue);
          Inc(tg, rgbtGreen);
          Inc(tr, rgbtRed);
        end;
        Inc(Dest);
      end;
    end;
    mB := Trunc(tb / (W * H));
    mG := Trunc(tg / (W * H));
    mR := Trunc(tr / (W * H));
  end;
  if Value > 0 then
    vd := 1 + (Value / 10)
  else
    vd := 1 - (Sqrt(-Value) / 10);
  for y := 0 to H do begin
    Dest := Bitmap.ScanLine[y];
    for x := 0 to W do begin
      with Dest^ do begin
        rgbtBlue := BLimit(mB + Trunc((rgbtBlue - mB) * vd));
        rgbtGreen := BLimit(mG + Trunc((rgbtGreen - mG) * vd));
        rgbtRed := BLimit(mR + Trunc((rgbtRed - mR) * vd));
      end;
      Inc(Dest);
    end;
  end;
end;

procedure bright(const Bitmap:TBitmap; const factor:Double); //изменение €ркости
var
  i,j:integer;
  r,g,b:integer;
  Reihe: ^TRGBTriple;
begin
  for i:=0 to Bitmap.Height-1 do begin
    Reihe:=Bitmap.ScanLine[i];
    for j:=0 to Bitmap.Width-1 do begin
      r:=Round(Reihe^.rgbtRed*factor);
      g:=Round(Reihe^.rgbtGreen*factor);
      b:=Round(Reihe^.rgbtBlue*factor);
      if r>255 then r:=255;
      if g>255 then g:=255;
      if b>255 then b:=255;
      Reihe^.rgbtRed:=r;
      Reihe^.rgbtGreen:=g;
      Reihe^.rgbtBlue:=b;
      Inc(Reihe);
    end;
  end;
  bitmap.Assign(Bitmap);
end;

procedure TContrastForm.ButtonCancelClick(Sender: TObject);
begin
  buffer.Assign(img);
  ContrastForm.Close;
end;

procedure TContrastForm.ButtonOKClick(Sender: TObject);
begin
  img.Assign(buffer);
  ContrastForm.Close;
end;

procedure TContrastForm.EditBrightChange(Sender: TObject);
begin
  buffer.Assign(img);
  TrackBarBright.Position:=StrToInt(EditBright.Text);
  Bright(buffer,TrackBarBright.Position);
  MainForm.PaintBox.Visible:=false;
  MainForm.PaintBox.Visible:=true;
end;

procedure TContrastForm.EditContrastChange(Sender: TObject);
begin
  buffer.Assign(img);
  TrackBarContrast.Position:=StrToInt(EditContrast.Text);
  Contrast(buffer,TrackBarContrast.Position, false);
  MainForm.PaintBox.Visible:=false;
  MainForm.PaintBox.Visible:=true;
end;

procedure TContrastForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  buffer.Assign(img);
end;

procedure TContrastForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then ButtonOK.Click;
  if key=#27 then ButtonCancel.Click;
end;

procedure TContrastForm.TrackBarBrightChange(Sender: TObject);
begin
  EditBright.Text:=IntToStr(TrackBarBright.Position);
end;

procedure TContrastForm.TrackBarContrastChange(Sender: TObject);
begin
  EditContrast.Text:=IntToStr(TrackBarContrast.Position);
end;

end.
