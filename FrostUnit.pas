unit FrostUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TFrostForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    EditH: TEdit;
    TrackBarH: TTrackBar;
    TrackBarV: TTrackBar;
    UpDownH: TUpDown;
    UpDownV: TUpDown;
    EditV: TEdit;
    OKButton: TButton;
    CancelButton: TButton;
    procedure TrackBarHChange(Sender: TObject);
    procedure TrackBarVChange(Sender: TObject);
    procedure EditHChange(Sender: TObject);
    procedure EditVChange(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrostForm: TFrostForm;
  UndoImage:TBitmap;

implementation

{$R *.dfm}

Uses MainUnit;

procedure Disorder(Bitmap:TBitmap; H,V:integer; BColor:TColor);
  function RandomInRadius(Num,Radius:integer):integer;
  begin
    if Random(2)=0 then
      Result:=Num+Random(Radius)
    else
      Result:=Num-random(Radius);
  end;
  type TRGB=record
    R,G,B:byte;
  end;
  pRGB=^TRGB;
  var x,y,ww,hh,xr,yr:integer;
    Dest1,Dest2,Src1,Src2:PRGB;
    bmp:TBitmap;
  begin
    Randomize;
    Bitmap.PixelFormat:=pf24bit;
    bmp:=TBitmap.Create;
    try
      bmp.Assign(Bitmap);
      ww:=Bitmap.Width-1;
      hh:=Bitmap.Height-1;
      Bitmap.Canvas.Brush.Color:=BColor;
      Bitmap.Canvas.FillRect(Rect(0,0,ww+1,hh+1));
      for y:=0 to hh do begin
        for x:=0 to ww do begin
          xr:=RandomInRadius(x,H);
          yr:=RandominRadius(y,V);
          if (xr>=0) and (xr<ww) and (yr>=0) and (yr<hh) then begin
            Src1:=bmp.ScanLine[y];
            Src2:=bmp.ScanLine[yr];
            Dest1:=Bitmap.ScanLine[y];
            Dest2:=Bitmap.ScanLine[yr];
            Inc(Src1,x);
            Inc(Src2,xr);
            Inc(Dest1,x);
            Inc(Dest2,xr);
            Dest1^:=Src2^;
            Dest2^:=Src1^;
          end;
        end;
      end;
    finally
    bmp.Free;
  end;
end;

procedure TFrostForm.CancelButtonClick(Sender: TObject);
begin
  buffer.Assign(img);
  MainForm.PaintBox.Canvas.CopyRect(bounds(0,0,img.Width,img.Height),buffer.Canvas,
    bounds(0,0,img.Width,img.Height));
  MainForm.PaintBox.Visible:=false;
  MainForm.PaintBox.Visible:=true;
  FrostForm.Close;
end;

procedure TFrostForm.EditHChange(Sender: TObject);
begin
  TrackBarH.Position:=StrToInt(EditH.Text);
  TrackBarH.Position:=StrToInt(EditH.Text);
  Disorder(buffer,TrackBarH.Position,TrackBarV.Position,clWhite);
  MainForm.PaintBox.Visible:=false;
  MainForm.PaintBox.Visible:=true;
end;

procedure TFrostForm.EditVChange(Sender: TObject);
begin
  TrackBarH.Position:=StrToInt(EditH.Text);
  Disorder(buffer,TrackBarH.Position,TrackBarV.Position,clWhite);
  MainForm.PaintBox.Visible:=false;
  MainForm.PaintBox.Visible:=true;
end;

procedure TFrostForm.OKButtonClick(Sender: TObject);
begin
  img.Assign(buffer);
  MainForm.Log('����������� ������: ����');
  FrostForm.Close;
end;

procedure TFrostForm.TrackBarHChange(Sender: TObject);
begin
  EditH.Text:=IntToStr(TrackBarH.Position);
end;

procedure TFrostForm.TrackBarVChange(Sender: TObject);
begin
  EditV.Text:=IntToStr(TrackBarV.Position);
end;

end.
