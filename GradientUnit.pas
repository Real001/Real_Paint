unit GradientUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  VCLTee.TeCanvas, Vcl.ComCtrls;

type
  TGradientForm = class(TForm)
    Label1: TLabel;
    EditRStart: TEdit;
    EditGStart: TEdit;
    EditBStart: TEdit;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    UpDown3: TUpDown;
    ButtonColorStart: TButtonColor;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ButtonColorFinish: TButtonColor;
    EditRFinish: TEdit;
    EditGFinish: TEdit;
    EditBFinish: TEdit;
    UpDown4: TUpDown;
    UpDown5: TUpDown;
    UpDown6: TUpDown;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    RadioGroupType: TRadioGroup;
    Button1: TButton;
    ButtonOK: TButton;
    ButtonCancel: TButton;
    procedure ButtonColorStartClick(Sender: TObject);
    procedure ButtonColorFinishClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GradientForm: TGradientForm;

implementation

{$R *.dfm}

Uses MainUnit;

procedure TGradientForm.Button1Click(Sender: TObject);
var
  i:integer;
  RStep, GStep, BStep:real;
begin
  case RadioGroupType.ItemIndex of
    //���������������
    0:begin
      //������ �������� ���� ������ �������� ������������
      RStep:=(StrToInt(EditRFinish.Text)-StrToInt(EditRStart.Text))/img.Width;
      GStep:=(StrToInt(EditGFinish.Text)-StrToInt(EditGStart.Text))/img.Width;
      BStep:=(StrToInt(EditBFinish.Text)-StrToInt(EditBStart.Text))/img.Width;
      //���� ������������ ���������
      for i:=0 to img.Width do begin
        buffer.Canvas.Pen.Color:=RGB(StrToInt(EditRStart.Text)+Round(RStep*i),
        StrToInt(EditGStart.Text)+Round(GStep*i), StrToInt(EditbStart.Text)+
        Round(BStep*i));
        buffer.Canvas.MoveTo(i,0);
        buffer.Canvas.LineTo(i,img.Height);
      end;
    end;
    //������������
    1:begin
      RStep:=(StrToInt(EditRFinish.Text)-StrToInt(EditRStart.Text))/img.Width;
      GStep:=(StrToInt(EditGFinish.Text)-StrToInt(EditGStart.Text))/img.Width;
      BStep:=(StrToInt(EditBFinish.Text)-StrToInt(EditBStart.Text))/img.Width;
      for i:=0 to img.Height do  begin
        buffer.Canvas.Pen.Color:=RGB(StrToInt(EditRStart.Text)+Round(RStep*i),
        StrToInt(EditGStart.Text)+Round(GStep*i), StrToInt(EditBStart.Text)+
        Round(BStep*i));
        buffer.Canvas.MoveTo(0,i);
        buffer.Canvas.LineTo(img.Width,i);
      end;
    end;
    //������������
    2:begin
      RStep:=(StrToInt(EditRFinish.Text)-StrToInt(EditRstart.Text))/img.Width;
      GStep:=(StrToInt(EditGFinish.Text)-StrToInt(EditGStart.Text))/img.Width;
      BStep:=(StrToInt(EditBFinish.Text)-StrToInt(EditBStart.Text))/img.Width;
      for i:=0 to img.Height do begin
        buffer.Canvas.Pen.Color:=RGB(StrToInt(EditRStart.Text)+Round(RStep*i),
        StrToInt(EditGStart.Text)+Round(GStep*i), StrToInt(EditBStart.Text)+
        Round(BStep*i));
        buffer.Canvas.MoveTo(-1,i);
        buffer.Canvas.LineTo(i,-1);
        buffer.Canvas.MoveTo(img.Width,img.Height-i);
        buffer.Canvas.LineTo(img.Height-i,img.Width);
      end;
    end;
  end;
  MainForm.PaintBox.Visible:=false;
  MainForm.PaintBox.Visible:=true;
end;

procedure TGradientForm.ButtonCancelClick(Sender: TObject);
begin
  buffer.Assign(img);
  GradientForm.Close;
end;

procedure TGradientForm.ButtonColorFinishClick(Sender: TObject);
begin
  //���������� �������� �����
    EditRFinish.Text:=IntToStr(ButtonColorFinish.SymbolColor mod 256);
  //���������� �������� �����
    EditGFinish.Text:=IntToStr((ButtonColorFinish.SymbolColor and $FF00) shr 8);
  //���������� ������ �����
    EditBFinish.Text:=IntToStr((ButtonColorFinish.SymbolColor and $FF0000) shr 16);
 // ButtonColorFinish.SymbolColor:=RGB(StrToInt(EditRFinish),StrToInt(EditGFinish),StrToInt(EditBFinish));
end;

procedure TGradientForm.ButtonColorStartClick(Sender: TObject);
begin
  //���������� �������� �����
    EditRStart.Text:=IntToStr(ButtonColorStart.SymbolColor mod 256);
  //���������� �������� �����
    EditGStart.Text:=IntToStr((ButtonColorStart.SymbolColor and $FF00) shr 8);
  //���������� ������ �����
    EditBStart.Text:=IntToStr((ButtonColorStart.SymbolColor and $FF0000) shr 16);

end;

procedure TGradientForm.ButtonOKClick(Sender: TObject);
begin
  img.Assign(buffer);
  GradientForm.Close;
end;

procedure TGradientForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  buffer.Assign(img);
end;

end.
