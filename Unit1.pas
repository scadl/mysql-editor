unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB,
  Bde.DBTables, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    Button1: TButton;
    ADOCommand1: TADOCommand;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Button3: TButton;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    GroupBox3: TGroupBox;
    LabeledEdit6: TLabeledEdit;
    Button2: TButton;
    LabeledEdit7: TLabeledEdit;
    Timer1: TTimer;
    LabeledEdit8: TLabeledEdit;
    LabeledEdit9: TLabeledEdit;
    Button4: TButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGridRefresh;
    procedure Button4Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  connected: boolean;
  addupd: boolean;

implementation

{$R *.dfm}



procedure TForm1.Button1Click(Sender: TObject);
begin
ADOCommand1.CommandText:='DELETE FROM '+LabeledEdit7.Text+' WHERE '+DBGrid1.Columns[DBGrid1.SelectedIndex].Title.Caption+'="'+DBGrid1.SelectedField.Text+'" LIMIT 1;';
ADOCommand1.Execute;
DBGridRefresh;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin

if addupd then
begin
ADOCommand1.CommandText:='UPDATE '+LabeledEdit7.Text+' SET '+DBGrid1.Columns[DBGrid1.SelectedIndex].Title.Caption+'="'+LabeledEdit6.Text+'" WHERE '+DBGrid1.Columns[0].Title.Caption+'='+DBGrid1.Columns[0].Field.Text+';';
ADOCommand1.Execute;
end else begin
ADOCommand1.CommandText:='INSERT INTO '+LabeledEdit7.Text+' VALUES ('+LabeledEdit8.Text+', "'+LabeledEdit6.Text+'", "'+LabeledEdit9.Text+'");';
ADOCommand1.Execute;
end;

DBGridRefresh;
LabeledEdit6.Text:='';
Label1.Font.Color:=clGreen;
LAbel1.Caption:='Your data has been sent.';
label1.Width:=106;
Button2.Caption:='Add to DB';
end;

procedure TForm1.Button3Click(Sender: TObject);
var i:integer;
begin



if connected then
begin
  ADOConnection1.Connected:=false;
  ADOTable1.Active:=false;
  Button3.Caption:='Connect to DB';
  connected:=false;
end else begin
ADOConnection1.Provider:='MSDASQL.1';
ADOConnection1.ConnectionString:='Provider=MSDASQL.1;Password='+LabeledEdit4.Text+';Persist Security Info=True;User ID='+LabeledEdit3.Text+';Extended Properties="DRIVER=MySQL ODBC 3.51 Driver;DATABASE='+LabeledEdit5.Text+';OPTION=0;PWD='+LabeledEdit4.Text+';PORT='+LabeledEdit2.Text+';SERVER='+LabeledEdit1.Text+';UID='+LabeledEdit3.Text+';";Initial Catalog='+LabeledEdit5.Text;
ADOTable1.TableName:=LabeledEdit7.Text;
ADOConnection1.Connected:=true;
ADOTable1.Active:=true;
  for I := 0 to DBGrid1.Columns.Count - 1 do
  begin
    DBGrid1.Columns[i].Width:= 5 + DBGrid1.Canvas.TextWidth(DBGrid1.Columns[i].Title.Caption);
  end;
  Button3.Caption:='Disconnect from Server';
  connected:=true;
end;

end;



procedure TForm1.Button4Click(Sender: TObject);
begin
LabeledEdit6.Text:=DBGrid1.SelectedField.Text;
label1.Font.Color:=clred;
label1.Caption:='Now, you are editing EXITSTING field!';
label1.Width:=106;
Button2.Caption:='Update Data';
addupd:=true;
end;

procedure TForm1.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var  w:integer;
begin
  w:= 15 + DBGrid1.Canvas.TextExtent(Column.Field.DisplayText).cx;
  if (w > Column.Width) then Column.Width:= w;
end;

procedure TForm1.DBGridRefresh;
var i:integer;
begin
  ADOTable1.Active:=false;
  ADOTable1.Active:=true;

  for I := 0 to DBGrid1.Columns.Count - 1 do

    DBGrid1.Columns[i].Width:= 5 + DBGrid1.Canvas.TextWidth(DBGrid1.Columns[i].Title.Caption);
  end;


procedure TForm1.FormCreate(Sender: TObject);
begin
Form1.Width:=222;
connected:=false;
addupd:=false;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
LabeledEdit9.Text:=FormatDateTime('dd.mm.yyyy - hh:mm:ss', Now());
LabeledEdit8.Text:=IntToStr(Random(99999));

if ADOConnection1.Connected
then form1.Width:=786
else Form1.Width:=222;
end;

end.
