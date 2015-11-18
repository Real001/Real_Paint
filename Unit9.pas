unit Unit9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TForm9 = class(TForm)
    Label1: TLabel;
    TrackBar: TTrackBar;
    ButtonOK: TButton;
    ButtonCancel: TButton;
    Edit: TEdit;
    UpDown: TUpDown;
    procedure TrackBarChange(Sender: TObject);
    procedure EditChange(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

{$R *.dfm}

Uses MainUnit;

procedure AddNoize(Bitmap:TBitmap; Amount:integer; Mono:boolean);
function BLimit(B:integer):byte;
begin
  if B<0 then
    Result:=0
  else if B>255 then
    Result:=255
  else Result:=B;
end;
type TRGB=record
  B,G,R:byte;
end;
  PRGB=^TRGB;
var
  x,y,i,a:integer;
  Dest:pRGB;
begin
  Bitmap.PixelFormat:=pf24bit;
  Randomize;
  i:=Amount shr 1;
  if mono then
    for y:=0 to Bitmap.Height-1 do begin
      Dest:=Bitmap.ScanLine[y];
        for x:=0 to Bitmap.Width-1 do begin
          a:=random(Amount)-i;
          with Dest^ do begin
            r:=BLimit(r+a);
            g:=BLimit(g+a);
            b:=BLimit(b+a);
          end;
        Inc(Dest);
        end;
  end else
    for y:=0 to Bitmap.Height-1 do begin
      Dest:=Bitmap.ScanLine[y];
      for x:=0 to Bitmap.Width-1 do begin
        with Dest^ do begin
          r:=BLimit(r+random(Amount)-i);
          g:=BLimit(g+random(Amount)-i);
          b:=BLimit(b+random(Amount)-i);
        end;
      Inc(Dest);
      end;
    end;
end;

procedure TForm9.ButtonCancelClick(Sender: TObject);
begin
  buffer.Assign(img);
  MainForm.PaintBox.Visible:=false;
  MainForm.PaintBox.Visible:=true;
  Form9.Close;
end;

procedure TForm9.ButtonOKClick(Sender: TObject);
begin
  AddNoize(buffer,StrToInt(Edit.Text),false);
  img.Assign(buffer);
  Form9.Close;
end;

procedure TForm9.EditChange(Sender: TObject);
begin
  buffer.Assign(img);
  TrackBar.Position:=StrToInt(Edit.Text);
  AddNoize(buffer,StrToInt(Edit.Text),false);
  MainForm.PaintBox.Visible:=false;
  MainForm.PaintBox.Visible:=true;
end;

procedure TForm9.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  buffer.Assign(img);
  MainForm.PaintBox.Visible:=false;
  MainForm.PaintBox.Visible:=true;
end;

procedure TForm9.FormCreate(Sender: TObject);
begin
  TrackBar.Position:=0;
end;

procedure TForm9.TrackBarChange(Sender: TObject);
begin
  Edit.Text:=IntToStr(TrackBar.Position);
end;

end.
