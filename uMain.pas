unit uMain;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Generics.Collections,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ComCtrls;

type
  TForm4 = class(TForm)
    btnSearch: TButton;
    eZip: TEdit;
    lbZip1: TLabel;
    lbAddr11: TLabel;
    eAddr1: TEdit;
    lbAddr12: TLabel;
    eAddr2: TEdit;
    lbAddr21: TLabel;
    lbAddr22: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    lbInfo: TLabel;
    Edit3: TEdit;
    lbZip2: TLabel;
    procedure btnSearchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
  public
  end;

var
  Form4: TForm4;

implementation

uses
  FBC.ZipFinder,
  FBC.ZipFinder.Popup;

{$R *.dfm}

procedure TForm4.btnSearchClick(Sender: TObject);
var
  LAddress: string;
  LZipCode: string;
begin
  if TZipFinderPopup.Execute(LZipCode, LAddress) then
  begin
    eZip.Text := LZipCode;
    eAddr1.Text := LAddress;
  end;
end;

procedure TForm4.Edit1KeyPress(Sender: TObject; var Key: Char);
var
  LAddress: string;
  LZipCode: string;
begin
  if Key = #13 then
  begin
    Key := #0;
    if TZipFinderPopup.Execute(Edit1.Text, LZipCode, LAddress) then
    begin
      Edit3.Text := LZipCode;
      Edit1.Text := LAddress;
      Edit2.SetFocus;
    end;
  end;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  // 검색 API를 위한 초기화작업

  TZipFindAPI.APIKey := 'e71909a92478f7fd01721714369173';
  TZipFindAPI.MaxCount := 2000;     // 최대검색건수
end;

end.
