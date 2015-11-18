unit Unit6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TForm6 = class(TForm)
    Label1: TLabel;
    Edit: TEdit;
    TrackBar: TTrackBar;
    UpDown: TUpDown;
    Button1: TButton;
    Button2: TButton;
    procedure TrackBarChange(Sender: TObject);
    procedure EditChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

Uses MainUnit;

procedure PixelsEffect(Bitmap:TBitmap; Hor,Ver:Word);
  function Min(A,B:integer):integer;
  begin
    if A<B then Result:=A
    else Result:=B;
  end;
type TRGB=record
  B,G,R:byte;
end;
  pRGB=^TRGB;
var i,j,x,y,xd,yd,rr,gg,bb,h,hx,hy:integer;
  Dest:pRGB;
begin
  Bitmap.PixelFormat:=pf24bit;
  if (Hor=1) and (Ver=1) then Exit;
  xd:=(Bitmap.Width-1) div Hor;
  yd:=(Bitmap.Height-1) div Ver;
  for i:=0 to xd do
    for j:=0 to yd do begin
      h:=0;
      rr:=0;
      gg:=0;
      bb:=0;
      hx:=Min(Hor*(i+1),Bitmap.Width-1);
      hy:=Min(Ver*(j+1),Bitmap.Height-1);
      for y:=j*Ver to hy do begin
        Dest:=Bitmap.ScanLine[y];
        Inc(Dest,i*Hor);
        for x:=i*Hor to hx do begin
          Inc(rr,Dest^.R);
          Inc(gg,Dest^.G);
          Inc(bb,Dest^.B);
          Inc(h);
          Inc(Dest);
      end;
    end;
    Bitmap.Canvas.Brush.Color := RGB(rr div h, gg div h, bb div h);
    Bitmap.Canvas.FillRect(Rect(i * Hor, j * Ver, hx + 1, hy + 1));
  end;
end;

procedure TForm6.Button1Click(Sender: TObject);
begin
  img.Assign(buffer);
  MainForm.Log('����������� ������: ���������� ��������');
  Form6.Close;
end;

procedure TForm6.Button2Click(Sender: TObject);
begin
  buffer.Assign(img);
  MainForm.PaintBox.Visible:=false;
  MainForm.PaintBox.Visible:=true;
  Form6.Close;
end;

procedure TForm6.EditChange(Sender: TObject);
begin
  buffer.Assign(img);
  TrackBar.Position:=StrToInt(Edit.Text);
  PixelsEffect(buffer,TrackBar.Position,TrackBar.Position);
  MainForm.PaintBox.Visible:=false;
  MainForm.PaintBox.Visible:=true;
end;

procedure TForm6.TrackBarChange(Sender: TObject);
begin
  Edit.Text:=IntToStr(TrackBar.Position);
end;

end.
