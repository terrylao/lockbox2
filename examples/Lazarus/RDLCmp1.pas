unit RDLCmp1;

interface

uses
  LCLIntf, LCLType,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  SysUtils,
  Classes,
  LbClass;

type
  TForm1 = class(TForm)
    btnEncrypt: TButton;
    btnDecrypt: TButton;
    Label4: TLabel;
    cbxCipherMode: TComboBox;
    mmoPlainText1: TMemo;
    Label5: TLabel;
    mmoCipherText: TMemo;
    Label7: TLabel;
    mmoPlainText2: TMemo;
    Label6: TLabel;
    Label1: TLabel;
    edtPassphrase: TEdit;
    LbRijndael1: TLbRijndael;
    Label2: TLabel;
    cbxKeySize: TComboBox;
    procedure btnEncryptClick(Sender: TObject);
    procedure btnDecryptClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbxCipherModeChange(Sender: TObject);
    procedure cbxKeySizeChange(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

uses
  LbUtils;

procedure TForm1.FormCreate(Sender: TObject);
begin
  cbxCipherMode.ItemIndex := Integer(LbRijndael1.CipherMode);
  cbxKeySize.ItemIndex := Integer(LbRijndael1.KeySize);
end;

procedure TForm1.btnEncryptClick(Sender: TObject);
begin
  LbRijndael1.GenerateKey(StringToUTF8(edtPassphrase.Text));
  mmoCipherText.Text := UTF8ToString(LbRijndael1.EncryptString(StringToUTF8(mmoPlainText1.Text)));
  mmoPlainText2.Clear;
end;

procedure TForm1.btnDecryptClick(Sender: TObject);
begin
  LbRijndael1.GenerateKey(StringToUTF8(edtPassphrase.Text));
  mmoPlainText2.Text := UTF8ToString(LbRijndael1.DecryptString(StringToUTF8(mmoCipherText.Text)));
end;

procedure TForm1.cbxCipherModeChange(Sender: TObject);
begin
  LbRijndael1.CipherMode := TLbCipherMode(cbxCipherMode.ItemIndex);
end;

procedure TForm1.cbxKeySizeChange(Sender: TObject);
begin
  LbRijndael1.KeySize := TLbKeySizeRDL(cbxKeySize.ItemIndex);
end;

end.
