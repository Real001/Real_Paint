unit FullScreenUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TFullScreenForm = class(TForm)
    ScrollBox1: TScrollBox;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FullScreenForm: TFullScreenForm;

implementation

{$R *.dfm}

procedure TFullScreenForm.FormCreate(Sender: TObject);
begin
  FullScreenForm.KeyPreview:=true; //реакция на клавиши
end;

procedure TFullScreenForm.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then FullScreenForm.Close;
end;

end.
