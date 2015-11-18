unit HistoryUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  THistoryForm = class(TForm)
    ListBox1: TListBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HistoryForm: THistoryForm;

implementation

{$R *.dfm}

Uses MainUnit;

procedure THistoryForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MainForm.History.Checked:=false;
end;

end.
