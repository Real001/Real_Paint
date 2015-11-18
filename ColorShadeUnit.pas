unit ColorShadeUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TColorShadeForm = class(TForm)
    Label1: TLabel;
    EditR: TEdit;
    EditG: TEdit;
    EditB: TEdit;
    UpDownR: TUpDown;
    UpDownG: TUpDown;
    UpDownB: TUpDown;
    TrackBarR: TTrackBar;
    TrackBarG: TTrackBar;
    TrackBarB: TTrackBar;
    ButtonOk: TButton;
    ButtonCancel: TButton;
    Label2: TLabel;
    Label3: TLabel;
    procedure EditRChange(Sender: TObject);
    procedure EditGChange(Sender: TObject);
    procedure EditBChange(Sender: TObject);
    procedure TrackBarRChange(Sender: TObject);
    procedure TrackBarGChange(Sender: TObject);
    procedure TrackBarBChange(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ColorShadeForm: TColorShadeForm;

implementation

{$R *.dfm}

Uses MainUnit;

procedure ModColor(Bitmap:TBitmap; Color:TColor); //замена всех цветов на отенки одного
function GetR(const Color:TColor):Byte; //извлечение красного
begin
  Result:=Lo(Color mod 256);
end;
function GetG(const Color:TColor):Byte; //извлечение зеленого
begin
  Result:=Lo((Color and $FF00) shr 8);
end;
function GetB(const Color:TColor):Byte; //извлечение синего
begin
  Result:=Lo((Color and $FF0000) shr 16);
end;
function BLimit(B:integer):Byte;
begin
  if B<0 then
    Result:=0
  else if B>255 then
    Result:=255
  else
    Result:=B;
end;
type
  TRGB=record
    R,G,B:byte;
  end;
  pRGB=^TRGB;
var
  r1,g1,b1:byte;
  x,y:integer;
  Dest:pRGB;
  A:Double;
begin
  Bitmap.PixelFormat:=pf24bit;
  r1:=Round(255/100*GetR(Color));
  g1:=Round(255/100*GetG(Color));
  b1:=Round(255/100*GetB(Color));
  for y:=0 to Bitmap.Height-1 do begin
    Dest:=Bitmap.ScanLine[y];
    for x:=0 to Bitmap.Width-1 do begin
      with Dest^ do begin
        A:=(r+g+b)/300;
        with Dest^ do begin
          R:=BLimit(Round(r1*A));
          G:=BLimit(Round(g1*A));
          B:=BLimit(Round(b1*A));
        end;
      end;
      Inc(Dest);
    end;
  end;
end;

procedure TColorShadeForm.ButtonCancelClick(Sender: TObject);
begin
  buffer.Assign(img);
  ColorShadeForm.Close;
  MainForm.PaintBox.Visible:=false;
  MainForm.PaintBox.Visible:=true;
end;

procedure TColorShadeForm.ButtonOkClick(Sender: TObject);
begin
  img.Assign(buffer);
  ColorShadeForm.Close;
end;

procedure TColorShadeForm.EditBChange(Sender: TObject);
begin

  buffer.Assign(img);
  TrackBarB.Position:=StrToInt(EditB.Text);
  ModColor(buffer,RGB(TrackBarB.Position,TrackBarG.Position,TrackBarR.Position));
  MainForm.PaintBox.Visible:=false;
  MainForm.PaintBox.Visible:=true;
end;

procedure TColorShadeForm.EditGChange(Sender: TObject);
begin
  buffer.Assign(img);
  TrackBarG.Position:=StrToInt(EditG.Text);
  ModColor(buffer,RGB(TrackBarB.Position,TrackBarG.Position,TrackBarR.Position));
  MainForm.PaintBox.Visible:=false;
  MainForm.PaintBox.Visible:=true;
end;

procedure TColorShadeForm.EditRChange(Sender: TObject);
begin
  buffer.Assign(img);
  TrackBarR.Position:=StrToInt(EditR.Text);
  ModColor(buffer,RGB(TrackBarB.Position,TrackBarG.Position,TrackBarR.Position));
  MainForm.PaintBox.Visible:=false;
  MainForm.PaintBox.Visible:=true;
end;

procedure TColorShadeForm.TrackBarRChange(Sender: TObject);
begin
  EditR.Text:=IntToStr(TrackBarR.Position);
end;

procedure TColorShadeForm.TrackBarBChange(Sender: TObject);
begin
  EditB.Text:=IntToStr(TrackBarB.Position);
end;

procedure TColorShadeForm.TrackBarGChange(Sender: TObject);
begin
  EditG.Text:=IntToStr(TrackBarG.Position);
end;



end.
