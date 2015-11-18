unit Unit12;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, ShellApi,
  Vcl.ExtCtrls;

type
  TForm12 = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ButtonClose: TButton;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure Label5Click(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12: TForm12;

implementation

{$R *.dfm}

procedure TForm12.ButtonCloseClick(Sender: TObject);
begin
  Form12.Close;
end;

procedure TForm12.Label5Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open',
  'c:\windows\notepad.exe', 'license.txt', nil,
  SW_SHOWNORMAL);
end;

end.
