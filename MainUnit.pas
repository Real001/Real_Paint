unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus, Vcl.ComCtrls,
  Vcl.ExtDlgs, frxDesgnCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ImgList,
  VCLTee.TeeFilters, frxDock, Clipbrd, JPEG, PNGImage, System.ImageList;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    MainMenu: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    NewImage: TMenuItem;
    OpenImage: TMenuItem;
    SaveImage: TMenuItem;
    SaveAsImage: TMenuItem;
    Cancel: TMenuItem;
    Return: TMenuItem;
    N11: TMenuItem;
    CutOut: TMenuItem;
    Copy: TMenuItem;
    Embend: TMenuItem;
    N15: TMenuItem;
    OpenPictureDialog: TOpenPictureDialog;
    ColorDialog1: TColorDialog;
    Clear: TMenuItem;
    WidthComboBox: TComboBox;
    ColorComboBox: TComboBox;
    InstrumComboBox: TComboBox;
    ClearSelect: TMenuItem;
    ShadAlloc: TMenuItem;
    SelectAll: TMenuItem;
    N20: TMenuItem;
    Resize: TMenuItem;
    N22: TMenuItem;
    Rotate: TMenuItem;
    N23: TMenuItem;
    FontText: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    PrintImage: TMenuItem;
    CloseImage: TMenuItem;
    ExitProgram: TMenuItem;
    Edit1: TEdit;
    FontDialog: TFontDialog;
    StatusB: TMenuItem;
    Line: TMenuItem;
    History: TMenuItem;
    SavePictureDialog1: TSavePictureDialog;
    N34: TMenuItem;
    FullScreen: TMenuItem;
    N36: TMenuItem;
    Frost: TMenuItem;
    ConsolPixel: TMenuItem;
    Waves: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    Sepia: TMenuItem;
    Black_White: TMenuItem;
    Negative: TMenuItem;
    Contrast: TMenuItem;
    IntColor: TMenuItem;
    N47: TMenuItem;
    JulFractal: TMenuItem;
    N49: TMenuItem;
    Label1: TLabel;
    LabelText: TLabel;
    SprayImageList: TImageList;
    SprayComboBox: TComboBoxEx;
    FillComboBox: TComboBoxEx;
    FillImageList: TImageList;
    StatusBar1: TStatusBar;
    ScrollBox1: TScrollBox;
    PaintBox: TPaintBox;
    PanelColorD: TPanel;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    PanelColorO: TPanel;
    N9: TMenuItem;
    procedure NewImageClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OpenImageClick(Sender: TObject);
    procedure PaintBoxMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBoxMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PaintBoxMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBoxPaint(Sender: TObject);
    procedure PanelColorOClick(Sender: TObject);
    procedure PanelColorDClick(Sender: TObject);
    procedure ColorComboBoxChange(Sender: TObject);
    procedure ClearClick(Sender: TObject);
    procedure InstrumComboBoxChange(Sender: TObject);
    procedure ExitProgramClick(Sender: TObject);
    procedure FontTextClick(Sender: TObject);
    procedure HistoryClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SaveImageClick(Sender: TObject);
    procedure SaveAsImageClick(Sender: TObject);
    procedure FullScreenClick(Sender: TObject);
    procedure WavesClick(Sender: TObject);
    procedure FillFegure();
    procedure ResizeClick(Sender: TObject);
    procedure RotateClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ShadAllocClick(Sender: TObject);
    procedure ClearSelectClick(Sender: TObject);
    procedure SelectAllClick(Sender: TObject);
    procedure JulFractalClick(Sender: TObject);
    procedure CutOutClick(Sender: TObject);
    procedure CopyClick(Sender: TObject);
    procedure EmbendClick(Sender: TObject);
    procedure FrostClick(Sender: TObject);
    procedure CancelClick(Sender: TObject);
    procedure SepiaClick(Sender: TObject);
    procedure Black_WhiteClick(Sender: TObject);
    procedure NegativeClick(Sender: TObject);
    procedure ConsolPixelClick(Sender: TObject);
    procedure ContrastClick(Sender: TObject);
    procedure IntColorClick(Sender: TObject);
    procedure N49Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure StatusBClick(Sender: TObject);
    procedure N9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Log(Text:string);
    procedure ReturnSaveImage;
    procedure ReturnImage;//��������� ������ ��������
  end;

var
  MainForm: TMainForm;
  img,buffer,Undo:TBitmap;//��������� ���������� ��� ���������
  w,h:integer;//������ � ����� �����������
  rasmer:boolean;//����� �� ������� �����������
  pen_p, kist, lin, linpr, brush_b, rasp, rect_r, rrect, ellipse_e,
  vydel, text_t, pipet, last,trian:boolean;//����������� ���������
  drag:boolean;//�������� ������� ������ ������ ����
  x0,y0:integer;//����������
  clo,cld:TColor;//����
  namefile:string;
  SelRect:TRect;//� ��� ���������� ������������ ���������� ����������� ��������������
  DlgRes:integer;//���������� �������� �� �������� �����

implementation

{$R *.dfm}

Uses
  NewImageUnit, HistoryUnit, FullScreenUnit, FrostUnit, PixelUnit, ContrastUnit,
  IntensityColorUnit, AddNoiseUnit, GradientUnit, AboutUnit, ColorShadeUnit, GausUnit;

procedure TMainForm.Log(Text: string);
begin
  HistoryForm.ListBox1.Items.Add(Text);
end;

procedure Wave(Bitmap: TBitmap; Frequency, Length: integer; //�����
Hor:boolean; BackColor: TColor);
  function Min(A, B: integer):integer;
  begin
    if A<B then
      Result:=A
    else
      Result:=B;
  end;
  function Max(A, B: integer):integer;
  begin
    if A>B then
      Result:=A
    else
      Result:=B;
  end;
const Rad=Pi/180;
type TRGB=record
  R, G, B: Byte;
end;
pRGB=^TRGB;
var
  x, y, f: integer;
  Dest, Src: pRGB;
  bmp: TBitmap;
begin
  Bitmap.PixelFormat:=pf24bit;
  bmp:=TBitmap.Create;
  try
    bmp.Assign(Bitmap);
    Bitmap.Canvas.Brush.Color:=BackColor;
    Bitmap.Canvas.FillRect(Rect(0, 0, Bitmap.Width, Bitmap.Height));
    for y := 0 to bmp.Height-1 do 
	begin
      Src:=bmp.ScanLine[y];
      for x := 0 to bmp.Width do 
	  begin
        if Hor then 
		begin
          f:=Min(Max(Round(sin(x*Rad*Length)*Frequency)+y, 0),
          Bitmap.Height-1);
          Dest:=Bitmap.ScanLine[f];
          Inc(Dest,x);
        end else 
		begin
          f:=Min(Max(Round(sin(y*Rad*Length)*Frequency)+x,0),
          Bitmap.Width-1);
          Dest:=Bitmap.ScanLine[y];
          Inc(Dest,f);
        end;
        Dest^:=Src^;
        Inc(Src);
      end;
    end;
  finally
    bmp.Free;
  end;
end;

procedure FlipBitmapV(Bitmap:TBitmap);//������� �����������
var x,y:integer;
  ScrRect,DstRect:TRect;
begin
  x:=img.Width;
  y:=img.Height;
  ScrRect:=Rect(-1,-1,x,y);
  DstRect:=Rect(-1,y,x,-1);
  img.Canvas.CopyRect(DstRect,img.Canvas,ScrRect);
end;

function fractal_julia(x0,y0:real):dword; //������� �����
var a,b,x,y,x1,y1,xy:real;
  r:real; k:integer;
begin
  r:=0;
  a:=-0.37;
  b:=-0.37;
  x:=x0; y:=y0;
  k:=100;
  while (k>0) and (r<4) do 
  begin
    x1:=sqr(x);
    y1:=sqr(y);
    xy:=x*y;
    x:=x1-y1-a;
    y:=2*xy-b;
    r:=x1+y1;
    dec(k);
  end;
  k:=round((k/100)*255);
  result:=RGB(k,k,k);
end;

Procedure Trigon(Canvas: TCanvas; Const X, Y, R: Integer); //�����������
const Grad=Pi/180;
var P: array[0..3] of TPoint;
  pc, npc, BGColor: TColor;
  ps: TPenStyle;
  alpha, pw: LongWord;
  i,j: Byte;
begin
  alpha:=30;
  if (Canvas.Brush.Style<>bsClear) then 
  begin
    pc:=Canvas.Pen.Color;
    ps:=Canvas.Pen.Style;
    pw:=Canvas.Pen.Width;
      Randomize;
      repeat
        BGColor:=RGB(Random(256), Random(256), Random(256));
        npc:=RGB(Random(256), Random(256), Random(256));
      until ((BGColor<>npc) and (npc<>pc));
      Canvas.Pen.Style:=psClear;
      Canvas.Pen.Color:=BGColor;
      for j:=0 to R-1 do 
	  begin
        for i:=0 to 3 do 
		begin
          P[i].X:=X+Round((j+1) * Cos(Alpha * Grad));
          P[i].Y:=Y+Round((j+1) * Sin(Alpha * Grad));
          alpha:=alpha+120;
          end;
        if (j<R-1) then Canvas.Pen.Width:=2
        else Canvas.Pen.Width:=1;
          Canvas.Polyline(P);

        end;
      with Canvas do 
	  begin
        Pen.Style:=psSolid;
        Pen.Width:=1;
        Pen.Color:=npc;
        Polyline(P);
        FloodFill(X, Y, npc, fsBorder);
        Brush.Style:=img.Canvas.Brush.Style;
        Pen.Width:=pw;
        Pen.Style:=ps;
        Pen.Color:=pc;
        if (ps=psClear) then 
		begin
          Pen.Style:=psSolid;
          Pen.Color:=Brush.Color;
        end;
        Polyline(P);
      end;
    end
  else begin
    for i:=0 to 3 do 
	begin
      P[i].X:=X+Round(R * Cos(Alpha * Grad));
      P[i].Y:=Y+Round(R * Sin(Alpha * Grad));
      alpha:=alpha+120;
    end;
    Canvas.Polyline(P);
  end;
end;

procedure SepiaBitmap(Bitmap:TBitmap;depth:integer); //�����
type 
  TRGBTripleArray=array[0..32767] of TRGBTriple;
  PRGBTripleArray=^TRGBTripleArray;
var 
  i,j,rr,gg:integer;
  line:PRGBTripleArray;
  gray:byte;
begin
  Bitmap.PixelFormat:=pf24bit;
  for i:=0 to bitmap.Height-1 do 
  begin
    line:=PRGBTripleArray(bitmap.Scanline[i]);
    for j:=0 to bitmap.Width-1 do 
	begin
      gray:=(line[j].rgbtRed+line[j].rgbtGreen+line[j].rgbtBlue) div 3;
      rr:=gray+(depth*2);
      gg:=gray+depth;
      if rr>255 then
        rr:=255;
      if gg>255 then
        gg:=255;
      line[j].rgbtRed:=rr;
      line[j].rgbtGreen:=gg;
      line[j].rgbtBlue:=gray;
    end;
  end;
end;

procedure TMainForm.ReturnSaveImage; //��������� ���������� ����������� ��� ������ ��������
begin
  //Undo.Width:=PaintBox.Width;
  //Undo.Height:=PaintBox.Height;
  //Undo.Canvas.CopyRect(Rect(0,0,img.Width,
  //img.Height),img.Canvas,Rect(0,0,img.Width,img.Height));
end;

procedure TMainForm.ReturnImage;//������ ��������
begin
  img.Width:=Undo.Width;
  img.Height:=Undo.Height;
  img.Canvas.CopyRect(Rect(0,0,img.Width,img.Height),
  Undo.Canvas,Rect(0,0,Undo.Width,Undo.Height));
end;


procedure TMainForm.ClearSelectClick(Sender: TObject);
begin
  img.Canvas.Brush.Color:=clWhite;
  Img.Canvas.FillRect(SelRect);
  buffer.Assign(img);
end;

procedure TMainForm.ColorComboBoxChange(Sender: TObject);
begin
 { if ColorComboBox.Text='��������' then begin
    PanelColor.Color:=clo;
    Log('������ ����� �� ��������')
  end else begin
    PanelColor.Color:=cld;
    Log('������ ����� �� ��������������');
  end; }
end;

procedure TMainForm.ConsolPixelClick(Sender: TObject);
begin
  PixelForm.TrackBar.Position:=1;
  PixelForm.ShowModal;
end;

procedure TMainForm.ContrastClick(Sender: TObject);
begin
  ContrastForm.TrackBarContrast.Position:=0;
  ContrastForm.TrackBarBright.Position:=0;
  ContrastForm.ShowModal;
end;

procedure TMainForm.CopyClick(Sender: TObject);
begin
  Clipboard.Assign(img);
  buffer.Assign(img);
end;

procedure TMainForm.CutOutClick(Sender: TObject);
var ARect:TRect;
begin
  CopyClick(sender);
  with buffer.Canvas do 
  begin
    CopyMode:=cmWhiteness;
    ARect:=SelRect;
    CopyRect(ARect,buffer.Canvas,ARect);
    CopyMode:=cmSrcCopy;
  end;
  img.Assign(buffer);
  Log('�������� ����� �����������');
end;

procedure TMainForm.InstrumComboBoxChange(Sender: TObject);
begin
  if InstrumComboBox.Text='��������' then 
  begin
    pen_p:=true;
    kist:=false;
    lin:=false;
    linpr:=false;
    brush_b:=false;
    rasp:=false;
    rect_r:=false;
    rrect:=false;
    ellipse_e:=false;
    vydel:=false;
    text_t:=false;
    pipet:=false;
    last:=false;
    trian:=false;
    WidthComboBox.Visible:=false;
    Edit1.Visible:=false;
    LabelText.Visible:=false;
    FillComboBox.Visible:=false;
    SprayComboBox.Visible:=false;
    ColorComboBox.Visible:=false;
    Log('������ ��������');
  end;
  if InstrumComboBox.Text='�����' then 
  begin
    kist:=true;
    pen_p:=false;
    lin:=false;
    linpr:=false;
    brush_b:=false;
    rasp:=false;
    rect_r:=false;
    rrect:=false;
    ellipse_e:=false;
    vydel:=false;
    text_t:=false;
    pipet:=false;
    last:=false;
    trian:=false;
    WidthComboBox.Visible:=true;
    FillComboBox.Visible:=false;
    Edit1.Visible:=false;
    LabelText.Caption:='������';
    LabelText.Visible:=true;
    SprayComboBox.Visible:=false;
    Log('������� �����');
  end;
  if InstrumComboBox.Text='������ �����' then 
  begin
    lin:=true;
    pen_p:=false;
    kist:=false;
    linpr:=false;
    brush_b:=false;
    rasp:=false;
    rect_r:=false;
    rrect:=false;
    ellipse_e:=false;
    vydel:=false;
    text_t:=false;
    pipet:=false;
    last:=false;
    trian:=false;
    WidthComboBox.Visible:=true;
    LabelText.Caption:='������';
    LabelText.Visible:=true;
    FillComboBox.Visible:=false;
    SprayComboBox.Visible:=false;
    Edit1.Visible:=false;
    ColorComboBox.Visible:=false;
    Log('������� ������ �����');
  end;
  if InstrumComboBox.Text='������������ �����' then 
  begin
    linpr:=true;
    pen_p:=false;
    kist:=false;
    lin:=false;
    brush_b:=false;
    rasp:=false;
    rect_r:=false;
    rrect:=false;
    ellipse_e:=false;
    vydel:=false;
    text_t:=false;
    pipet:=false;
    last:=false;
    trian:=false;
    WidthComboBox.Visible:=true;
    LabelText.Caption:='������';
    LabelText.Visible:=true;
    FillComboBox.Visible:=false;
    SprayComboBox.Visible:=false;
    Edit1.Visible:=false;
    ColorComboBox.Visible:=false;
    Log('������� ������������ �����');
  end;
  if InstrumComboBox.Text='�����������' then 
  begin
    rasp:=true;
    pen_p:=false;
    kist:=false;
    lin:=false;
    linpr:=false;
    brush_b:=false;
    rect_r:=false;
    rrect:=false;
    ellipse_e:=false;
    vydel:=false;
    text_t:=false;
    pipet:=false;
    last:=false;
    trian:=false;
    WidthComboBox.Visible:=false;
    LabelText.Caption:='�����������';
    LabelText.Visible:=true;
    FillComboBox.Visible:=false;
    SprayComboBox.Visible:=true;
    Edit1.Visible:=false;
    ColorComboBox.Visible:=false;
    Log('������ �����������');
  end;
  if InstrumComboBox.Text='�������' then 
  begin
    brush_b:=true;
    pen_p:=false;
    kist:=false;
    lin:=false;
    linpr:=false;
    rasp:=false;
    rect_r:=false;
    rrect:=false;
    ellipse_e:=false;
    vydel:=false;
    text_t:=false;
    pipet:=false;
    last:=false;
    trian:=false;
    WidthComboBox.Visible:=false;
    LabelText.Caption:='�������';
    LabelText.Visible:=true;
    FillComboBox.Left:=199;
    FillComboBox.Visible:=true;
    Edit1.Visible:=false;
    SprayComboBox.Visible:=false;
    ColorComboBox.Visible:=false;
    Log('������� �������');
  end;
  if InstrumComboBox.Text='�������������' then 
  begin
    rect_r:=true;
    pen_p:=false;
    kist:=false;
    lin:=false;
    linpr:=false;
    rasp:=false;
    brush_b:=false;
    rrect:=false;
    ellipse_e:=false;
    vydel:=false;
    text_t:=false;
    pipet:=false;
    last:=false;
    trian:=false;
    WidthComboBox.Visible:=true;
    LabelText.Caption:='������'+'         '+'�������';
    LabelText.Visible:=true;
    FillComboBox.Left:=262;
    FillComboBox.Visible:=true;
    Edit1.Visible:=false;
    SprayComboBox.Visible:=false;
    ColorComboBox.Visible:=false;
    Log('������ �������������');
  end;
  if InstrumComboBox.Text='������������� � ������������ ������' then 
  begin
    rrect:=true;
    pen_p:=false;
    kist:=false;
    lin:=false;
    linpr:=false;
    rasp:=false;
    brush_b:=false;
    rect_r:=false;
    ellipse_e:=false;
    vydel:=false;
    text_t:=false;
    pipet:=false;
    last:=false;
    trian:=false;
    WidthComboBox.Visible:=true;
    LabelText.Caption:='������'+'         '+'�������';
    LabelText.Visible:=true;
    FillComboBox.Left:=262;
    FillComboBox.Visible:=true;
    SprayComboBox.Visible:=false;
    Edit1.Visible:=false;
    ColorComboBox.Visible:=false;
    Log('������ ������������� � ������������ ������ ');
  end;
  if InstrumComboBox.Text='������' then 
  begin
    ellipse_e:=true;
    pen_p:=false;
    kist:=false;
    lin:=false;
    linpr:=false;
    rasp:=false;
    brush_b:=false;
    rect_r:=false;
    rrect:=false;
    vydel:=false;
    text_t:=false;
    pipet:=false;
    last:=false;
    trian:=false;
    WidthComboBox.Visible:=true;
    LabelText.Caption:='������'+'         '+'�������';
    LabelText.Visible:=true;
    FillComboBox.Left:=262;
    FillComboBox.Visible:=true;
    SprayComboBox.Visible:=false;
    Edit1.Visible:=false;
    ColorComboBox.Visible:=false;
  end;
  if InstrumComboBox.Text='�����' then 
  begin
    text_t:=true;
    pen_p:=false;
    kist:=false;
    lin:=false;
    linpr:=false;
    brush_b:=false;
    rasp:=false;
    rect_r:=false;
    rrect:=false;
    ellipse_e:=false;
    vydel:=false;
    pipet:=false;
    last:=false;
    trian:=false;
    WidthComboBox.Visible:=false;
    LabelText.Caption:='�����';
    FillComboBox.Visible:=false;
    SprayComboBox.Visible:=false;
    LabelText.Visible:=true;
    Edit1.Visible:=true;
    ColorComboBox.Visible:=false;
    Log('������ ���� ������');
  end;
  if InstrumComboBox.Text='�������' then 
  begin
    pipet:=true;
    pen_p:=false;
    kist:=false;
    lin:=false;
    linpr:=false;
    brush_b:=false;
    rasp:=false;
    rect_r:=false;
    rrect:=false;
    ellipse_e:=false;
    vydel:=false;
    text_t:=false;
    last:=false;
    trian:=false;
    WidthComboBox.Visible:=false;
    FillComboBox.Visible:=false;
    SprayComboBox.Visible:=false;
    LabelText.Caption:='����� �����';
    LabelText.Visible:=true;
    Edit1.Visible:=false;
    ColorComboBox.Visible:=true;
    Log('������� �������');
  end;
  if InstrumComboBox.Text='������' then 
  begin
    last:=true;
    pen_p:=false;
    kist:=false;
    lin:=false;
    linpr:=false;
    brush_b:=false;
    rasp:=false;
    rect_r:=false;
    rrect:=false;
    ellipse_e:=false;
    vydel:=false;
    text_t:=false;
    pipet:=false;
    trian:=false;
    WidthComboBox.Visible:=true;
    LabelText.Caption:='������';
    FillComboBox.Visible:=false;
    SprayComboBox.Visible:=false;
    LabelText.Visible:=true;
    Edit1.Visible:=false;
    ColorComboBox.Visible:=false;
    Log('������ ������');
  end;
  if InstrumComboBox.Text='���������' then 
  begin
    vydel:=true;
    pen_p:=false;
    kist:=false;
    lin:=false;
    linpr:=false;
    brush_b:=false;
    rasp:=false;
    rect_r:=false;
    rrect:=false;
    ellipse_e:=false;
    text_t:=false;
    pipet:=false;
    last:=false;
    trian:=false;
    WidthComboBox.Visible:=false;
    FillComboBox.Visible:=false;
    SprayComboBox.Visible:=false;
    LabelText.Visible:=false;
    Edit1.Visible:=false;
    ColorComboBox.Visible:=false;
    Log('������� ���������');
  end;
  if InstrumComboBox.Text='�����������' then 
  begin
    ellipse_e:=false;
    pen_p:=false;
    kist:=false;
    lin:=false;
    linpr:=false;
    rasp:=false;
    brush_b:=false;
    rect_r:=false;
    rrect:=false;
    vydel:=false;
    text_t:=false;
    pipet:=false;
    last:=false;
    trian:=true;
    WidthComboBox.Visible:=true;
    LabelText.Caption:='������'+'         '+'�������';
    LabelText.Visible:=true;
    FillComboBox.Left:=262;
    FillComboBox.Visible:=true;
    SprayComboBox.Visible:=false;
    Edit1.Visible:=false;
    ColorComboBox.Visible:=false;
  end;
end;

procedure TMainForm.IntColorClick(Sender: TObject);
begin
  IntensityColorForm.Image1.Picture.Bitmap:=buffer;
  IntensityColorForm.Image2.Picture.Bitmap:=buffer;
  IntensityColorForm.ShowModal();
end;

procedure TMainForm.JulFractalClick(Sender: TObject);
var 
  x_min,y_min,x_max,y_max,hx,hy,x,y:real;
  i,j,n:integer;
begin
  Clear.Click;
  x_min:=-1.5; x_max:=2;
  y_min:=-1.5; y_max:=1.5;
  n:=500;
  y:=y_min;
  hx:=(x_max-x_min)/n;
  hy:=(y_max-y_min)/n;
  for j:=0 to n do 
  begin
    x:=x_min;
    for i:=0 to n do 
	begin
      img.Canvas.Pixels[i,j]:=fractal_julia(x,y);
      x:=x+hx;
    end;
    y:=y+hy;
  end;
  buffer.Assign(img);
  Log('��������� ������� �����');
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DeleteFile('history.dat');//�������� ����� �������
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if HistoryForm.ListBox1.Items.Count<>0 then
  begin
    case MessageDlg('��������� �����������?',mtWarning,mbYesNoCancel,0) of
      mrYes:begin
        SaveAsImage.Click;
        DlgRes:=1;
      end;
      mrCancel:CanClose:=false;
    end;
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  img:=TBitmap.Create;
  buffer:=TBitmap.Create;
  img.Width:=PaintBox.Width;
  img.Width:=PaintBox.Height;
  buffer.Width:=PaintBox.Width;
  buffer.Height:=PaintBox.Height;
  StatusBar1.Panels[0].Text:=Format('%d x %d',[PaintBox.Width,PaintBox.Height]);
  w:=img.Width;
  h:=img.Height;
  img.Canvas.Brush.Style:=bsClear;
  drag:=false;
  pen_p:=true;
  clo:=clBlack;
  cld:=clWhite;
  WidthComboBox.Visible:=false;
  name:='';
  DlgRes:=0;
end;

procedure TMainForm.FrostClick(Sender: TObject);
begin
  FrostForm.TrackBarH.Position:=0;
  FrostForm.TrackBarV.Position:=0;
  ReturnSaveImage;
  FrostForm.ShowModal;
end;

procedure TMainForm.N49Click(Sender: TObject);
begin
  AddNoiseForm.TrackBar.Position:=0;
  AddNoiseForm.ShowModal;
end;

procedure TMainForm.N6Click(Sender: TObject);
begin
  AboutForm.ShowModal;
end;

procedure TMainForm.N7Click(Sender: TObject);
begin
  GradientForm.ShowModal();
end;

procedure TMainForm.N8Click(Sender: TObject);
begin
  ColorShadeForm.TrackBarR.Position:=0;
  ColorShadeForm.TrackBarG.Position:=0;
  ColorShadeForm.TrackBarB.Position:=0;
  ColorShadeForm.ShowModal;
end;

procedure TMainForm.N9Click(Sender: TObject);
begin
  GausForm.TrackBar.Position:=2;
  GausForm.ShowModal;
end;

procedure TMainForm.NegativeClick(Sender: TObject);
var 
  Line:pByteArray;
  i,j:integer;
begin
  for i:=0 to img.Height-1 do 
  begin
    Line:=img.ScanLine[i];
    for j:=0 to img.Width*3-1 do
      Line^[j]:=255-Line^[j];
  end;
  buffer.Assign(img);
end;

procedure TMainForm.CancelClick(Sender: TObject);
begin
  ReturnImage;
  buffer.Assign(img);
  PaintBox.Canvas.CopyRect(bounds(0,0,img.Width,img.Height),buffer.Canvas,
    bounds(0,0,img.Width,img.Height));
  PaintBox.Visible:=false;
  PaintBox.Visible:=true;
end;

procedure TMainForm.ClearClick(Sender: TObject); //������� �����������
var
  ochis:TRect;//������������� �������
begin
  //���������� ��� �������������
  ochis.Left:=0;
  ochis.Top:=0;
  ochis.Right:=img.Width;
  ochis.Bottom:=img.Height;
  //�������
  img.Canvas.Brush.Style:=bsSolid;
  img.Canvas.Brush.Color:=clWhite;
  img.Canvas.FillRect(ochis);
  buffer.Canvas.FillRect(ochis);
  PaintBox.Canvas.FillRect(ochis);
  Log('������� �����������')
end;

procedure TMainForm.RotateClick(Sender: TObject);//������� �����������
begin
  FlipBitmapV(img);
  PaintBox.Visible:=false;
  PaintBox.Visible:=true;
  Buffer.Assign(img);
end;

procedure TMainForm.ResizeClick(Sender: TObject);//��������� ������� �����������
begin
  rasmer:=false;
  NewImageForm.Caption:='��������� ������� �����������';
  NewImageForm.ShowModal();
end;

procedure TMainForm.FontTextClick(Sender: TObject);
begin
  if FontDialog.Execute then
    img.Canvas.Font:=FontDialog.Font;
end;

procedure TMainForm.EmbendClick(Sender: TObject);
var Bitmap:TBitmap;
begin
  if Clipboard.HasFormat(CF_BitMap) then
  begin
    Bitmap:=TBitmap.Create;
    try
      Bitmap.Assign(Clipboard);
      img.Canvas.Draw(x0,y0,Bitmap);
    finally
      Bitmap.Free;
    end;
  end;
  buffer.Assign(img);
  Log('����������� ���������');
end;

procedure TMainForm.ExitProgramClick(Sender: TObject);
begin
  MainForm.Close;
end;

procedure TMainForm.HistoryClick(Sender: TObject); //�������
var str: TFileStream;
begin
  if History.Checked=true then
  begin
    str:=TFileStream.Create('history.dat',fmCreate);//�������� ���� ��� ������
    str.WriteComponent(HistoryForm.ListBox1);
    HistoryForm.Close;
    str.Free;
    History.Checked:=false;
  end else
  begin
    if FileExists('history.dat') then
    begin
      HistoryForm.Show;
      str:=TFileStream.Create('history.dat',fmOpenRead);
      str.ReadComponent(HistoryForm.ListBox1);
      str.Free;
      History.Checked:=true;
    end else
    begin
      HistoryForm.Show;
      History.Checked:=true;
    end;
  end;
end;

procedure TMainForm.FullScreenClick(Sender: TObject); //����������� �� ���� �����
begin
  FullScreenForm.Show;
  FullScreenForm.FormStyle:=fsStayOnTop;
  FullScreenForm.Width:=Screen.Width; //������� ������
  FullScreenForm.Height :=Screen.Height;
  FullScreenForm.Image1.Picture.Bitmap:=img;
  FullScreenForm.Image1.Height:=img.Height;//������� �����������
  FullScreenForm.Image1.Width:=img.Width;
  if img.Height>Screen.Height then 
  begin
    FullScreenForm.ScrollBox1.Height:=img.Height;
    FullScreenForm.ScrollBox1.Width:=img.Width;
    FullScreenForm.ScrollBox1.Left := (FullScreenForm.ClientWidth -
    FullScreenForm.ScrollBox1.Width)  div 2; //������������ �� ������
    FullScreenForm.ScrollBox1.Top := (FullScreenForm.ClientHeight -
    FullScreenForm.ScrollBox1.Height - (FullScreenForm.ScrollBox1.Height div 3)) div 2;
  end else 
  begin
    FullScreenForm.ScrollBox1.Height:=Screen.Height;
    FullScreenForm.ScrollBox1.Width:=Screen.Width;
  end;
  FullScreenForm.Image1.Left := (FullScreenForm.ClientWidth - FullScreenForm.Image1.Width)  div 2; //������������ �� ������
  FullScreenForm.Image1.Top := (FullScreenForm.ClientHeight - FullScreenForm.Image1.Height
  - (FullScreenForm.Image1.Height div 3)) div 2;
end;

procedure TMainForm.WavesClick(Sender: TObject);//����� ������� ����
begin
  Wave(img,img.Width div 50, img.Width div 40, true, clWhite);
  Buffer.Assign(img);
end;

procedure TMainForm.Black_WhiteClick(Sender: TObject);
begin
  SepiaBitmap(img,0);
  SepiaBitmap(buffer,0);
  PaintBox.Visible:=false;
  PaintBox.Visible:=true;
end;

procedure TMainForm.NewImageClick(Sender: TObject);
begin
  rasmer:=true;
  //rm2:=TForm2.Create(Application);
  NewImageForm.Caption:='�������� ������ �����������';
  NewImageForm.ShowModal();
end;

procedure TMainForm.OpenImageClick(Sender: TObject);//�������� �����������
var
  ext:string;
  jpg:TJPEGImage;
  png:TPNGImage;
begin
  if OpenPictureDialog.Execute then 
  begin
    ext:=ExtractFileExt(OpenPictureDialog.FileName);
    if ext='.bmp' then 
	begin
      try
        img.LoadFromFile(OpenPictureDialog.FileName);
        buffer.LoadFromFile(OpenPictureDialog.FileName);
        PaintBox.Width:=img.Width;
        PaintBox.Height:=img.Height;
        PaintBox.Canvas.CopyRect(bounds(0,0,img.Width,img.Height),buffer.Canvas,
        bounds(0,0,img.Width,img.Height));
        StatusBar1.Panels[0].Text:=Format('%d x %d',[PaintBox.Width,PaintBox.Height]);
        w:=img.Width;
        h:=img.Height;
      finally

      end;
    end;
    if ((ext='.jpg') 
	  or (ext='.jpeg') 
	  or (ext='.jpe') 
	  or (ext='.jfif')) then 
	begin
      try
        jpg:=TJPEGImage.Create;
        jpg.LoadFromFile(OpenPictureDialog.FileName);
        img.Assign(jpg);
        img.Width:=jpg.Width;
        img.Height:=jpg.Height;
        buffer.Width:=jpg.Width;
        buffer.Height:=jpg.Height;
        buffer.Assign(img);
        PaintBox.Width:=img.Width;
        PaintBox.Height:=img.Height;
      finally
        jpg.Free;
      end;
    end;
    if ext='.png' then 
	begin
      png:=TPNGImage.Create;
      try
        png.LoadFromFile(OpenPictureDialog.FileName);
        img.Assign(png);
        buffer.Assign(png);
        PaintBox.Width:=img.Width;
        PaintBox.Height:=img.Height;
      finally
        png.Free;
      end;
    end;
    namefile:=OpenPictureDialog.FileName;
    NewImageForm.Caption:=ExtractFileName(OpenPictureDialog.FileName)+' - Real Paint v3.0 beta';
  end;
  Log('������� �����������')
end;

procedure TMainForm.SaveImageClick(Sender: TObject);
begin
  if namefile='' then
    SaveAsImage.Click
  else
    buffer.SaveToFile(namefile);
end;

procedure TMainForm.SelectAllClick(Sender: TObject);
begin
      SelRect:=Rect(0,0,img.Width,img.Height);
      PaintBox.Canvas.Pen.Style:=psDashDot;
      PaintBox.Canvas.Pen.Mode:=pmNot;
      PaintBox.Canvas.Brush.Style:=bsClear;
      Log('�������� �� �����������');
end;

procedure TMainForm.SepiaClick(Sender: TObject);//�����
begin
  SepiaBitmap(img,30);
  SepiaBitmap(buffer,30);
  PaintBox.Visible:=false;
  PaintBox.Visible:=true;
end;

procedure TMainForm.ShadAllocClick(Sender: TObject);
begin
  img.Canvas.Brush.Color:=cld;
  Img.Canvas.FillRect(SelRect);
  buffer.Assign(img);
end;

procedure TMainForm.StatusBClick(Sender: TObject);
begin
  if StatusB.Checked then 
  begin
    StatusBar1.Visible:=false;
    StatusB.Checked:=false;
  end else
  if StatusB.Checked=false then 
  begin
    StatusBar1.Visible:=true;
    StatusB.Checked:=true;
  end;
end;

procedure TMainForm.SaveAsImageClick(Sender: TObject);//���������� ����������� ���
var
  ext:integer;
  JPEG:TJPEGImage;
  png:TPNGImage;
begin
  if SavePictureDialog1.Execute then 
  begin
    ext:=SavePictureDialog1.FilterIndex;
    case ext of
      1: begin
        try
          JPEG:=TJPEGImage.Create;
          JPEG.Assign(buffer);
          JPEG.CompressionQuality:=90;//�������� �����������
          JPEG.SaveToFile(SavePictureDialog1.FileName+'.jpg');
        finally
          JPEG.Free;
        end;
      end;
      2: begin
        img.SaveToFile(SavePictureDialog1.FileName+'.bmp');
      end;
      3: begin
        try
          png:=TPNGImage.Create;
          png.Assign(buffer);
          png.SaveToFile(SavePictureDialog1.FileName+'.png');
        finally
          png.Free;
        end;
      end;
    end;
  end;
  namefile:=SavePictureDialog1.FileName;
  MainForm.Caption:=ExtractFileName(SavePictureDialog1.FileName)+' - Real Paint v3.0 beta';
end;

procedure TMainForm.PaintBoxMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  bm:TBitmap;
  color:TColor;
  trianMass:array [0..3] of TPoint;
begin
  if Button=mbLeft then
  begin
    img.Assign(buffer);
    x0:=x; y0:=y;
    color:=clo;
    //��������
    if pen_p then
    begin
      img.Canvas.Pen.Color:=color;
      img.Canvas.MoveTo(x,y);
      Log('���������� ����������');
    end;
    //�����
    if kist then
    begin
      drag:=true;
      img.Canvas.Pen.Color:=color;
      img.Canvas.MoveTo(x,y);
      Log('���������� ������')
    end;
    if lin then
    begin
       Log('����������� ������ �����');
    end;
    if brush_b then begin
      if (FillComboBox.ItemIndex=1) then
      begin
        img.Canvas.Brush.Style:=bsSolid;
        img.Canvas.Brush.Color:=clo;
      end;
      if (FillComboBox.ItemIndex=2) then
      begin
        img.Canvas.Brush.Style:=bsHorizontal;
        img.Canvas.Brush.Color:=clo;
      end;
      if (FillComboBox.ItemIndex=3) then
      begin
        img.Canvas.Brush.Style:=bsVertical;
        img.Canvas.Brush.Color:=clo;
      end;
      if (FillComboBox.ItemIndex=4) then
      begin
        img.Canvas.Brush.Style:=bsCross;
        img.Canvas.Brush.Color:=clo;
      end;
      if (FillComboBox.ItemIndex=5) then
      begin
        img.Canvas.Brush.Style:=bsDiagCross;
        img.Canvas.Brush.Color:=clo;
      end;
      if (FillComboBox.ItemIndex=6) then
      begin
        img.Canvas.Brush.Style:=bsFDiagonal;
        img.Canvas.Brush.Color:=clo;
      end;
      img.Canvas.FloodFill(x,y,img.Canvas.Pixels[x,y],fssurface);
    end;
    if rasp then
    begin
      Log('���������� ������������');
    end;
    if rect_r then
    begin
      Log('��������� �������������');
    end;
    if rrect then
    begin
      Log('��������� �������������');
    end;
    if text_t then
    begin
      img.Canvas.Brush.Style:=bsClear;
      img.Canvas.TextOut(x0,y0,Edit1.Text);
      Log('�������� �����');
    end;
    if pipet then
    begin
      if ColorComboBox.Text='��������' then
      begin
        clo:=buffer.Canvas.Pixels[x,y];
        PanelColorO.Color:=clo;
        Log('������������� �������');
      end;
      if ColorComboBox.Text='��������������' then
      begin
        cld:=buffer.Canvas.Pixels[x,y];
        PanelColorD.Color:=cld;
        Log('������������� �������');
      end;
    end;
    if last then
    begin
      img.Canvas.Pen.Color:=clWhite;
      img.Canvas.MoveTo(x,y);
      Log('����� ����������� ������');
    end;
    if vydel then
    begin
      SelRect:=Rect(x,y,x,y);
      PaintBox.Canvas.Pen.Style:=psDashDot;
      PaintBox.Canvas.Pen.Mode:=pmNot;
      PaintBox.Canvas.Brush.Style:=bsClear;
      Log('�������� ����� �����������');
    end;
    if trian then
    begin
      if (FillComboBox.ItemIndex=1) then
      begin
        img.Canvas.Brush.Style:=bsSolid;
        img.Canvas.Brush.Color:=clo;
      end;
      if (FillComboBox.ItemIndex=2) then
      begin
        img.Canvas.Brush.Style:=bsHorizontal;
        img.Canvas.Brush.Color:=clo;
      end;
      if (FillComboBox.ItemIndex=3) then
      begin
        img.Canvas.Brush.Style:=bsVertical;
        img.Canvas.Brush.Color:=clo;
      end;
      if (FillComboBox.ItemIndex=4) then
      begin
        img.Canvas.Brush.Style:=bsCross;
        img.Canvas.Brush.Color:=clo;
      end;
      if (FillComboBox.ItemIndex=5) then
      begin
        img.Canvas.Brush.Style:=bsDiagCross;
        img.Canvas.Brush.Color:=clo;
      end;
      if (FillComboBox.ItemIndex=6) then
      begin
        img.Canvas.Brush.Style:=bsFDiagonal;
        img.Canvas.Brush.Color:=clo;
      end;
      if vydel then
      begin
        PaintBox.Canvas.Rectangle(SelRect);
        SelRect.BottomRight:=Point(x,y);
        PaintBox.Canvas.Pen.Style:=psSolid;
        PaintBox.Canvas.Pen.Mode:=pmCopy;
        PaintBox.Canvas.Rectangle(SelRect);
        PaintBox.Canvas.Brush.Style:=bsSolid;
      end;
      img.Canvas.FloodFill(x,y,img.Canvas.Pixels[x,y],fssurface);
    end;
  end;
  //ReturnSaveImage;
end;

procedure TMainForm.FillFegure;//��������� ������ ���� �������
begin
  if (FillComboBox.ItemIndex=0) then
  begin
    img.Canvas.Brush.Style:=bsClear;
  end;
  if (FillComboBox.ItemIndex=1) then
  begin
    img.Canvas.Brush.Style:=bsSolid;
    img.Canvas.Brush.Color:=cld;
  end;
  if (FillComboBox.ItemIndex=2) then
  begin
    img.Canvas.Brush.Style:=bsHorizontal;
    img.Canvas.Brush.Color:=cld;
  end;
  if (FillComboBox.ItemIndex=3) then
  begin
    img.Canvas.Brush.Style:=bsVertical;
    img.Canvas.Brush.Color:=cld;
  end;
  if (FillComboBox.ItemIndex=4) then
  begin
    img.Canvas.Brush.Style:=bsCross;
    img.Canvas.Brush.Color:=cld;
  end;
  if (FillComboBox.ItemIndex=5) then
  begin
    img.Canvas.Brush.Style:=bsDiagCross;
    img.Canvas.Brush.Color:=cld;
  end;
  if (FillComboBox.ItemIndex=6) then
  begin
    img.Canvas.Brush.Style:=bsFDiagonal;
    img.Canvas.Brush.Color:=cld;
  end;
end;
procedure TMainForm.PaintBoxMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
const
  n=256;
var
  i,tr:integer;
begin
  if ssLeft in shift then 
  begin
    img.Assign(buffer);
     //��������
    if pen_p then
    begin
      img.Canvas.Pen.Width:=1;
      img.Canvas.LineTo(x,y);
      buffer.Assign(img);
    end;
    //�����
    if kist then
    begin
      img.Canvas.Pen.Width:=StrToInt(WidthComboBox.Text);
      img.Canvas.LineTo(x,y);
      buffer.Assign(img);
    end;
    //������ �����
    if lin then
    begin
      img.Canvas.Pen.Color:=clo;
      img.Canvas.Pen.Width:=StrToInt(WidthComboBox.Text);
      img.Canvas.LineTo(x0,y0);
      img.Canvas.Pen.Color:=clo;
      img.Canvas.LineTo(x0,y0);
      img.Canvas.LineTo(x,y);
    end;
    //������������ �����
    if linpr then
    begin
      buffer.Canvas.Pen.Width:=StrToInt(WidthComboBox.Text);
      randomize();
      for i:=0 to n do
        buffer.Canvas.Pen.Color:=RGB(random(256),random(256),random(256));
        buffer.Canvas.LineTo(random(img.Width),random(img.Height));
      Log('����������� ������������ �����');
    end;
    //�����������
    if rasp then
    begin
      if (SprayComboBox.ItemIndex=0) then
      begin
        tr:=20;
      end;
      if (SprayComboBox.ItemIndex=1) then
      begin
        tr:=40;
      end;
      if (SprayComboBox.ItemIndex=2) then
      begin
        tr:=60;
      end;
      if (SprayComboBox.ItemIndex=3) then
      begin
        tr:=80;
      end;
      if (SprayComboBox.ItemIndex=4) then
      begin
        tr:=100;
      end;
      randomize();
      for i:=0 to tr do
        buffer.Canvas.Pixels[x+random(tr), y+random(tr)]:=clo;
    end;
    if rect_r then
    begin
      FillFegure();
      img.Canvas.Pen.Width:=StrToInt(WidthComboBox.Text);
      img.Canvas.Pen.Color:=clo;
      img.Canvas.Rectangle(x0,y0,x,y);
    end;
    if rrect then
    begin
      FillFegure();
      img.Canvas.Pen.Width:=StrToInt(WidthComboBox.Text);
      img.Canvas.Pen.Color:=clo;
      img.Canvas.RoundRect(x0,y0,x,y,50,50);
    end;
    if ellipse_e then
    begin
      FillFegure();
      img.Canvas.Pen.Width:=StrToInt(WidthComboBox.Text);
      img.Canvas.Pen.Color:=clo;
      img.Canvas.Ellipse(x0,y0,x,y);
    end;
    if vydel then
    begin
      PaintBox.Canvas.Rectangle(SelRect);
      SelRect.BottomRight:=Point(x,y);
      PaintBox.Canvas.Rectangle(SelRect);
    end;
    if last then
    begin
      img.Canvas.Pen.Width:=StrToInt(WidthCombobox.Text);
      img.Canvas.LineTo(x,y);
      buffer.Assign(img);
    end;
    if trian then
    begin
      img.Canvas.Pen.Color:=clo;
      img.Canvas.Pen.Width:=StrToInt(WidthCombobox.Text);
      Trigon(img.Canvas,x,y0,y);
    end;
  end;
  //ReturnSaveImage;
  StatusBar1.Panels[1].Text:=Format('%d x %d',[x,y]);
  PaintBox.Canvas.CopyRect(bounds(0,0,img.Width,img.Height),img.Canvas,
  bounds(0,0,img.Width,img.Height));
end;

procedure TMainForm.PaintBoxMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  drag:=false;
  if Button = mbLeft then 
  begin
    if vydel then 
	begin
     { PaintBox.Canvas.Rectangle(SelRect);
      SelRect.BottomRight:=Point(x,y);
      PaintBox.Canvas.Pen.Style:=psSolid;
      PaintBox.Canvas.Pen.Mode:=pmCopy;
      PaintBox.Canvas.Rectangle(SelRect);
      PaintBox.Canvas.Brush.Style:=bsSolid; }
    end;
  end;
  buffer.Assign(img);
end;

procedure TMainForm.PaintBoxPaint(Sender: TObject);
begin
  PaintBox.Canvas.CopyRect(bounds(0,0,img.Width,img.Height),buffer.Canvas,
  bounds(0,0,img.Width,img.Height));//��������� �����������
end;

procedure TMainForm.PanelColorOClick(Sender: TObject);//����� �����
begin
    if ColorDialog1.Execute then 
	begin
      clo:=ColorDialog1.Color;
      PanelColorO.Color:=clo;
    end;
end;

procedure TMainForm.PanelColorDClick(Sender: TObject);//����� �����
begin
  if ColorDialog1.Execute then
  begin
    cld:=ColorDialog1.Color;
    PanelColorD.Color:=cld;
  end;
end;

end.
