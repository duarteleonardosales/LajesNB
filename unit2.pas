unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    btnsair: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnsairClick(Sender: TObject);
    procedure GroupBox1Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }


procedure TForm2.btnsairClick(Sender: TObject);
begin
  Close;
end;

procedure TForm2.GroupBox1Click(Sender: TObject);
begin

end;

procedure TForm2.Label1Click(Sender: TObject);
begin

end;

end.

