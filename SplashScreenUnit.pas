unit SplashScreenUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Imaging.pngimage;

type
  TSplashScreenForm = class(TForm)
    Image: TImage;
    ProgressBar: TProgressBar;
    Timer: TTimer;
    procedure TimerTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SplashScreenForm: TSplashScreenForm;

implementation

{$R *.dfm}

procedure TSplashScreenForm.TimerTimer(Sender: TObject);
begin
  ProgressBar.Position:=ProgressBar.Position+15;
  if ProgressBar.Position=ProgressBAr.Max then
    Timer.Enabled:=false;
end;

end.
