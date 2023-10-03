unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, IniFiles;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  TempIni : TIniFile;
begin
  TempIni := TIniFile.Create('Config.ini');
  TempIni.WriteString('CONFIGURACAO', 'NOME', Edit1.Text);
  TempIni.WriteString('CONFIGURACAO', 'NOME1', Edit2.Text);
  TempIni.WriteBool('CONFIGURACAO', 'SIMNAO', CheckBox1.Checked);
  TempIni.Free;
end;

procedure TForm1.FormShow(Sender: TObject);
var
  TempIni : TIniFile;
begin
  TempIni           := TIniFile.Create('Config.ini');
  Edit1.Text        := TempIni.ReadString('CONFIGURACAO', 'NOME', '');
  Edit2.Text        := TempIni.ReadString('CONFIGURACAO', 'NOME1','');
  CheckBox1.Checked := TempIni.ReadBool('CONFIGURACAO', 'SIMNAO', False);
  TempIni.Free;
end;

end.

