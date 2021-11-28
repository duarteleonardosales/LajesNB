unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Spin, Arrow, ComCtrls, unit2, unit3;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnsobre: TButton;
    btninfo: TButton;
    btncalcular: TButton;
    btnlimpar: TButton;
    edtfsk: TComboBox;
    edtbf: TEdit;
    edtdx: TEdit;
    edtdy: TEdit;
    edtaci: TEdit;
    edtrevest: TEdit;
    edtcoef: TEdit;
    edtpp: TEdit;
    edtlx: TEdit;
    edtly: TEdit;
    edthf: TEdit;
    edtbw: TEdit;
    edtfck: TFloatSpinEdit;
    Image1: TImage;
    lblresultadox2: TLabel;
    lblresultadoy1: TLabel;
    lblresultadoy2: TLabel;
    lblfck: TLabel;
    lblbw: TLabel;
    lblbf: TLabel;
    lbldx: TLabel;
    lbldy: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    lblfsk: TLabel;
    lblresultadox1: TLabel;
    lblaci: TLabel;
    lblpp: TLabel;
    lblrevest: TLabel;
    lblcoef: TLabel;
    lblly: TLabel;
    lbllx: TLabel;
    lblhf: TLabel;
    procedure btncalcularClick(Sender: TObject);
    procedure btninfoClick(Sender: TObject);
    procedure btnlimparClick(Sender: TObject);
    procedure btnsobreClick(Sender: TObject);
    procedure edtaciKeyPress(Sender: TObject; var Key: char);
    procedure edtbfKeyPress(Sender: TObject; var Key: char);
    procedure edtbwKeyPress(Sender: TObject; var Key: char);
    procedure edtcoefKeyPress(Sender: TObject; var Key: char);
    procedure edtdxKeyPress(Sender: TObject; var Key: char);
    procedure edtdyKeyPress(Sender: TObject; var Key: char);
    procedure edtfckKeyPress(Sender: TObject; var Key: char);
    procedure edthfKeyPress(Sender: TObject; var Key: char);
    procedure edtlxKeyPress(Sender: TObject; var Key: char);
    procedure edtlyKeyPress(Sender: TObject; var Key: char);
    procedure edtppKeyPress(Sender: TObject; var Key: char);
    procedure edtrevestKeyPress(Sender: TObject; var Key: char);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  lmbd, lx, ly, p, pp, aci, revest, coef, mkx, mky, mdx, mdy, mix, miy, hf, bf, bw, dx, dy, kmd, kx, kz, fck, fcd, fsk, fsd, delta, x1, x2, x, aspx, aspy, maba, malma, asaba, asalma, hahn: real;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btncalcularClick(Sender: TObject);
begin

  {CALCULO DOS MOMENTOS ATUANTES}

  {Dimensões da laje e fator de HAHN}

  lx:=StrToFloat(edtlx.Text);
  ly:=StrToFloat(edtly.Text);
  lmbd:=ly/lx;
  hahn:=(1)/(1-(5/6)*((lmbd*lmbd)/(1+lmbd*lmbd*lmbd*lmbd)));

  {Carregamento atuante}

  pp:=StrToFloat(edtpp.Text);
  aci:=StrToFloat(edtaci.Text);
  revest:=StrToFloat(edtrevest.Text);
  coef:=StrToFloat(edtcoef.Text);
  p:=pp+aci+revest;

  {Propriedades das nervuras}

  hf:=StrToFloat(edthf.Text)/100;
  bf:=StrToFloat(edtbf.Text)/100;
  bw:=StrToFloat(edtbw.Text)/100;
  dx:=StrToFloat(edtdx.Text)/100;
  dy:=StrToFloat(edtdy.Text)/100;

  {Cálculo do momento, conforme a relação dos lados}

   if (lmbd=1) then
   begin
   mix:=4.41;
   miy:=4.41;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;

   if (lmbd>1) and (lmbd<1.05) then
   begin
   mix:=7.8*lmbd-3.39;
   miy:=0.80*lmbd+3.61;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;

   if (lmbd=1.05) then
   begin
   mix:=4.80;
   miy:=4.45;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;

   if (lmbd>1.05) and (lmbd<1.1) then
   begin
   mix:=7.60*lmbd-3.18;
   miy:=0.80*lmbd+3.61;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;

   if (lmbd=1.10) then
   begin
   mix:=5.18;
   miy:=4.49;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;

   if (lmbd>1.10) and (lmbd<1.15) then
   begin
   mix:=7.60*lmbd-3.18;
   miy:=4.49;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;

   if (lmbd=1.15) then
   begin
   mix:=5.56;
   miy:=4.49;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;

   if (lmbd>1.15) and (lmbd<1.20) then
   begin
   mix:=6.80*lmbd-2.26;
   miy:=-0.20*lmbd+4.72;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;

   if (lmbd=1.20) then
   begin
   mix:=5.90;
   miy:=4.48;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;

   if (lmbd>1.20) and (lmbd<1.25) then
   begin
   mix:=7.40*lmbd-2.98;
   miy:=-0.60*lmbd+5.20;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;

   if (lmbd=1.25) then
   begin
   mix:=6.27;
   miy:=4.45;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;

   if (lmbd>1.25) and (lmbd<1.30) then
   begin
   mix:=6.60*lmbd-1.98;
   miy:=-0.60*lmbd+5.20;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;

   if (lmbd=1.30) then
   begin
   mix:=6.60;
   miy:=4.42;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;

   if (lmbd>1.30) and (lmbd<1.35) then
   begin
   mix:=6.60*lmbd-1.98;
   miy:=-1*lmbd+5.72;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;

   if (lmbd=1.35) then
   begin
   mix:=6.93;
   miy:=4.37;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;

   if (lmbd>1.35) and (lmbd<1.40) then
   begin
   mix:=6.40*lmbd-1.71;
   miy:=-0.80*lmbd+5.45;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;

   if (lmbd=1.40) then
   begin
   mix:=7.25;
   miy:=4.33;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;

   if (lmbd>1.40) and (lmbd<1.45) then
   begin
   mix:=6*lmbd-1.15;
   miy:=-0.60*lmbd+5.17;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;

   if (lmbd=1.45) then
   begin
   mix:=7.55;
   miy:=4.30;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;

   if (lmbd>1.45) and (lmbd<1.50) then
   begin
   mix:=6.20*lmbd-1.44;
   miy:=-1*lmbd+5.75;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;

   if (lmbd=1.50) then
   begin
   mix:=7.86;
   miy:=4.25;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;

   if (lmbd>1.50) and (lmbd<1.55) then
   begin
   mix:=5.20*lmbd+0.06;
   miy:=-1*lmbd+5.75;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;


   if (lmbd=1.55) then
   begin
   mix:=8.12;
   miy:=4.20;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;

   if (lmbd>1.55) and (lmbd<1.60) then
   begin
   mix:=4.4*lmbd+1.30;
   miy:=-21.2*lmbd+37.06;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;

   if (lmbd=1.60) then
   begin
   mix:=8.34;
   miy:=3.14;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;

   if (lmbd>1.60) and (lmbd<1.65) then
   begin
   mix:=5.60*lmbd-0.62;
   miy:=18.60*lmbd-26.62;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;

   if (lmbd=1.65) then
   begin
   mix:=8.62;
   miy:=4.07;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;

   if (lmbd>1.65) and (lmbd<1.70) then
   begin
   mix:=4.80*lmbd+0.70;
   miy:=-1.40*lmbd+6.38;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;

   if (lmbd=1.70) then
   begin
   mix:=8.86;
   miy:=4.00;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;

   if (lmbd>1.70) and (lmbd<1.75) then
   begin
   mix:=4*lmbd+2.06;
   miy:=-0.80*lmbd+5.36;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;

   if (lmbd=1.75) then
   begin
   mix:=9.06;
   miy:=3.96;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;

   if (lmbd>1.75) and (lmbd<1.80) then
   begin
   mix:=4.20*lmbd+1.71;
   miy:=-1*lmbd+5.71;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;

   if (lmbd=1.80) then
   begin
   mix:=9.27;
   miy:=3.91;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;

   if (lmbd>1.80) and (lmbd<1.85) then
   begin
   mix:=3.60*lmbd+2.79;
   miy:=-1.60*lmbd+6.79;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;

   if (lmbd=1.85) then
   begin
   mix:=9.45;
   miy:=3.83;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;

   if (lmbd>1.85) and (lmbd<1.90) then
   begin
   mix:=3.60*lmbd+2.79;
   miy:=-1.60*lmbd+6.79;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;

   if (lmbd=1.90) then
   begin
   mix:=9.63;
   miy:=3.75;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;

   if (lmbd>1.90) and (lmbd<1.95) then
   begin
   mix:=2.80*lmbd+4.31;
   miy:=-0.80*lmbd+5.27;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;

   if (lmbd=1.95) then
   begin
   mix:=9.77;
   miy:=3.71;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;

   if (lmbd>1.95) and (lmbd<2.00)  then
   begin
   mix:=4.60*lmbd+0.80;
   miy:=-1.40*lmbd+6.44;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;

   if (lmbd=2.00)  then
   begin
   mix:=10.00;
   miy:=3.64;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;

   if (lmbd>2.00)  then
   begin
   mix:=12.57;
   miy:=3.77;
   mkx:=((mix*p*lx*lx)/100)*bf*hahn;
   mky:=((miy*p*lx*lx)/100)*bf*hahn;
   mdx:=mkx*coef;
   mdy:=mky*coef;
   end;

   if (lmbd<1) then
   begin
   ShowMessage('O valor de lx deve ser menor que o de ly!');
   edtlx.Text:='';
   edtly.Text:='';
   Exit;
   end;

   {CÁLCULO NA DIREÇÃO X}

   {SUPONDO SEÇÃO RETANGULAR}

   fck:=(edtfck.Value);
   fcd:=(fck*1000)/1.4;

   fsk:=StrToFloat(edtfsk.Text);
   fsd:=fsk/1.15;

   kmd:=(mdx)/(bf*dx*dx*fcd);

   delta:=(0.68*0.68)-4*(0.272)*(kmd);

   if (delta<0) then
   begin
   ShowMessage('Diminua o carregamento ou altere a seção!');
   Exit;
   end;

   x1:=(0.68+sqrt(delta))/(2*0.272);
   x2:=(0.68-sqrt(delta))/(2*0.272);

   if ((x1=0) or (x1>0)) and ((x1<1) or (x1=1))
   then kx:=x1;

   if ((x2=0) or (x2>0)) and ((x2<1) or (x2=1))
   then kx:=x2;

   x:=kx*dx;

   if ((x<hf) or (x=hf)) then
   begin

   kz:=1-0.4*kx;

   if (kz<0.82) then
   begin
   ShowMessage('De acordo com o item 14.6.4.3 da NBR 6118:2014, foi ultrapassado o limite que garante a ductilidade do elemento! Altere sua seção!');
   Exit;
   end;

   if (kz>0.82) or (kz=0.82)
   then aspx:=(mdx)/(kz*dx*fsd);
   lblresultadox1.Caption:=('O momento fletor de cálculo (Mdx) é igual a: '+FloatToStrf(mdx, ffFixed, 0, 2)+' kN∙m/nervura');
   lblresultadox2.Caption:=('A seção de aço (As) necessária é igual a: '+FloatToStrf(aspx, ffFixed, 0, 2)+' cm²/nervura');

   end;

   if (x>hf) then
   begin

   {ABAS}

   maba:=0.85*fcd*hf*(bf-bw)*(dx-0.5*hf);
   kmd:=(maba)/((bf-bw)*dx*dx*fcd);
   delta:=(0.68*0.68)-4*(0.272)*(kmd);

   if (delta<0) then
   begin
   ShowMessage('Diminua o carregamento ou altere a seção!');
   Exit;
   end;

   x1:=(0.68+sqrt(delta))/(2*0.272);
   x2:=(0.68-sqrt(delta))/(2*0.272);

   if ((x1=0) or (x1>0)) and ((x1<1) or (x1=1))
   then kx:=x1;

   if ((x2=0) or (x2>0)) and ((x2<1) or (x2=1))
   then kx:=x2;

   kz:=1-0.4*kx;


   if (kz<0.82) then
   begin
   ShowMessage('De acordo com o item 14.6.4.3 da NBR 6118:2014, foi ultrapassado o limite que garante a ductilidade do elemento! Altere sua seção!');
   Exit;
   end;

   if (kz>0.82) or (kz=0.82)
   then asaba:=(maba)/(kz*dx*fsd);

   {ALMA}

   malma:=mdx-maba;
   kmd:=(malma)/(bw*dx*dx*fcd);
   delta:=(0.68*0.68)-4*(0.272)*(kmd);

   if (delta<0) then
   begin
   ShowMessage('Diminua o carregamento ou altere a seção!');
   Exit;
   end;

   x1:=(0.68+sqrt(delta))/(2*0.272);
   x2:=(0.68-sqrt(delta))/(2*0.272);

   if ((x1=0) or (x1>0)) and ((x1<1) or (x1=1))
   then kx:=x1;

   if ((x2=0) or (x2>0)) and ((x2<1) or (x2=1))
   then kx:=x2;

   kz:=1-0.4*kx;

   if (kz<0.82) then
   begin
   ShowMessage('De acordo com o item 14.6.4.3 da NBR 6118:2014, foi ultrapassado o limite que garante a ductilidade do elemento! Altere sua seção!');
   Exit;
   end;

   if (kz>0.82) or (kz=0.82)
   then asalma:=(malma)/(kz*dx*fsd);

   aspx:=asaba+asalma;
   lblresultadox1.Caption:=('O momento fletor de cálculo (Mdx) é igual a: '+FloatToStrf(mdx, ffFixed, 0, 2)+' kN∙m/nervura');
   lblresultadox2.Caption:=('A seção de aço (As) necessária é igual a: '+FloatToStrf(aspx, ffFixed, 0, 2)+' cm²/nervura');

   end;

   {CÁLCULOS NA DIREÇÃO Y}

   {SUPONDO SEÇÃO RETANGULAR}

   fck:=(edtfck.Value);
   fcd:=(fck*1000)/1.4;

   fsk:=StrToFloat(edtfsk.Text);
   fsd:=fsk/1.15;

   kmd:=(mdy)/(bf*dy*dy*fcd);

   delta:=(0.68*0.68)-4*(0.272)*(kmd);

   if (delta<0) then
   begin
   ShowMessage('Diminua o carregamento ou altere a seção!');
   Exit;
   end;

   x1:=(0.68+sqrt(delta))/(2*0.272);
   x2:=(0.68-sqrt(delta))/(2*0.272);

   if ((x1=0) or (x1>0)) and ((x1<1) or (x1=1))
   then kx:=x1;

   if ((x2=0) or (x2>0)) and ((x2<1) or (x2=1))
   then kx:=x2;

   x:=kx*dy;

   if ((x<hf) or (x=hf)) then
   begin

   kz:=1-0.4*kx;

   if (kz<0.82) then
   begin
   ShowMessage('De acordo com o item 14.6.4.3 da NBR 6118:2014, foi ultrapassado o limite que garante a ductilidade do elemento! Altere sua seção!');
   Exit;
   end;

   if (kz>0.82) or (kz=0.82)
   then aspy:=(mdy)/(kz*dy*fsd);

   lblresultadoy1.Caption:=('O momento fletor de cálculo (Mdy) é igual a: '+FloatToStrf(mdy, ffFixed, 0, 2)+' kN∙m/nervura');
   lblresultadoy2.Caption:=('A seção de aço (As) necessária é igual a: '+FloatToStrf(aspy, ffFixed, 0, 2)+' cm²/nervura');

   end;

   if (x>hf) then
   begin

   {ABAS}

   maba:=0.85*fcd*hf*(bf-bw)*(dy-0.5*hf);
   kmd:=(maba)/((bf-bw)*dy*dy*fcd);
   delta:=(0.68*0.68)-4*(0.272)*(kmd);

   if (delta<0) then
   begin
   ShowMessage('Diminua o carregamento ou altere a seção!');
   Exit;
   end;

   x1:=(0.68+sqrt(delta))/(2*0.272);
   x2:=(0.68-sqrt(delta))/(2*0.272);

   if ((x1=0) or (x1>0)) and ((x1<1) or (x1=1))
   then kx:=x1;

   if ((x2=0) or (x2>0)) and ((x2<1) or (x2=1))
   then kx:=x2;

   kz:=1-0.4*kx;


   if (kz<0.82) then
   begin
   ShowMessage('De acordo com o item 14.6.4.3 da NBR 6118:2014, foi ultrapassado o limite que garante a ductilidade do elemento! Altere sua seção!');
   Exit;
   end;

   if (kz>0.82) or (kz=0.82)
   then asaba:=(maba)/(kz*dy*fsd);

   {ALMA}

   malma:=mdy-maba;
   kmd:=(malma)/(bw*dy*dy*fcd);
   delta:=(0.68*0.68)-4*(0.272)*(kmd);

   if (delta<0) then
   begin
   ShowMessage('Diminua o carregamento ou altere a seção!');
   Exit;
   end;

   x1:=(0.68+sqrt(delta))/(2*0.272);
   x2:=(0.68-sqrt(delta))/(2*0.272);

   if ((x1=0) or (x1>0)) and ((x1<1) or (x1=1))
   then kx:=x1;

   if ((x2=0) or (x2>0)) and ((x2<1) or (x2=1))
   then kx:=x2;

   kz:=1-0.4*kx;

   if (kz<0.82) then
   begin
   ShowMessage('De acordo com o item 14.6.4.3 da NBR 6118:2014, foi ultrapassado o limite que garante a ductilidade do elemento! Altere sua seção!');
   Exit;
   end;

   if (kz>0.82) or (kz=0.82)
   then asalma:=(malma)/(kz*dy*fsd);

   aspy:=asaba+asalma;
   lblresultadoy1.Caption:=('O momento fletor de cálculo (Mdy) é igual a: '+FloatToStrf(mdy, ffFixed, 0, 2)+' kN∙m/nervura');
   lblresultadoy2.Caption:=('A seção de aço (As) necessária é igual a: '+FloatToStrf(aspy, ffFixed, 0, 2)+' cm²/nervura');

   end;

















end;

procedure TForm1.btninfoClick(Sender: TObject);
begin
  Form3.ShowModal;
end;

procedure TForm1.btnlimparClick(Sender: TObject);
begin
  edtfck.Value:=20;
  edtpp.Text:='';
  edtaci.Text:='';
  edtrevest.Text:='';
  edtcoef.Text:='';
  edtlx.Text:='';
  edtly.Text:='';
  edthf.Text:='';
  edtbf.Text:='';
  edtbw.Text:='';
  edtdx.Text:='';
  edtdy.Text:='';
  lblresultadox1.Caption:='';
  lblresultadox2.Caption:='';
  lblresultadoy1.Caption:='';
  lblresultadoy2.Caption:='';


end;

procedure TForm1.btnsobreClick(Sender: TObject);
begin
  Form2.ShowModal;
end;

procedure TForm1.edtaciKeyPress(Sender: TObject; var Key: char);
begin
  if not (key in ['0'..'9', #8, #13, #32, #46]) then
  key := #0;
end;

procedure TForm1.edtbfKeyPress(Sender: TObject; var Key: char);
begin
  if not (key in ['0'..'9', #8, #13, #32, #46]) then
  key := #0;
end;

procedure TForm1.edtbwKeyPress(Sender: TObject; var Key: char);
begin
  if not (key in ['0'..'9', #8, #13, #32, #46]) then
  key := #0;
end;

procedure TForm1.edtcoefKeyPress(Sender: TObject; var Key: char);
begin
  if not (key in['0'..'9', #8, #13, #32, #46]) then
  key := #0;
end;

procedure TForm1.edtdxKeyPress(Sender: TObject; var Key: char);
begin
  if not (key in ['0'..'9', #8, #13, #32, #46]) then
  key := #0;
end;

procedure TForm1.edtdyKeyPress(Sender: TObject; var Key: char);
begin
  if not (key in ['0'..'9', #8, #13, #32, #46]) then
  key := #0;
end;

procedure TForm1.edtfckKeyPress(Sender: TObject; var Key: char);
begin
  if not (key in ['0'..'9', #8, #13, #32, #46]) then
  key := #0;
end;

procedure TForm1.edthfKeyPress(Sender: TObject; var Key: char);
begin
  if not (key in ['0'..'9', #8, #13, #32, #46]) then
  key := #0;
end;

procedure TForm1.edtlxKeyPress(Sender: TObject; var Key: char);
begin
  if not (key in ['0'..'9', #8, #13, #32, #46]) then
  key := #0;
end;

procedure TForm1.edtlyKeyPress(Sender: TObject; var Key: char);
begin
  if not (key in ['0'..'9', #8, #13, #32, #46]) then
  key := #0;
end;

procedure TForm1.edtppKeyPress(Sender: TObject; var Key: char);
begin

  if not (key in ['0'..'9', #8, #13, #32, #46]) then
  key := #0;

end;

procedure TForm1.edtrevestKeyPress(Sender: TObject; var Key: char);
begin
  if not (key in ['0'..'9', #8, #13, #32, #46]) then
  key := #0;
end;

end.

