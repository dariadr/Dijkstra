unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;
type
  TPelement = ^Telement;
  Telement = record
    versh: integer;
    put: integer;
    next: TPelement;
  end;
  adrzap=^zap;
  zap = record
    value: integer;
    next: adrzap;
    last: adrzap;
  end;
  ocher = class(TObject)
  private
    fHead: adrzap;
    fTail: adrzap;
  public
    constructor Create;
    destructor Destroy; override;
    procedure dob(item:  integer);
    function vs:  integer;
    function isEmpty: boolean;
    procedure sort(versh:integer);
  end;
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Button1: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    OpenDialog1: TOpenDialog;
    Button2: TButton;
    Label5: TLabel;
    ListBox1: TListBox;
    Label4: TLabel;
    Button3: TButton;
    Label6: TLabel;
    StringGrid2: TStringGrid;
    Button4: TButton;
    Button5: TButton;
    SaveDialog1: TSaveDialog;
    Edit1: TEdit;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form1: TForm1;
  b,v:array[1..500000]of boolean;
  d:array[1..500000] of longint;
  head:array[1..500000] of TPelement;
  n,st,fin:integer;
  s:string;
  kl:byte;
implementation

{$R *.dfm}


constructor ocher.Create;
begin
  fHead:= nil;
  fTail:= nil;
end;

destructor ocher.Destroy;
begin
  while not isEmpty do
    vs;
  fHead:= nil;
  fTail:= nil;
end;

procedure ocher.dob(item: integer);
var
  temp:  adrzap;
begin
  New(temp);
  temp^.value:= item;
  temp^.next:= nil;
  temp^.last:= nil;
  if (isEmpty)  then
  begin
    fHead:= temp;
    fTail:= temp;
  end
  else
  begin
    ftail^.next:=temp;
    temp^.last:=ftail;
    ftail:=temp;
    sort(item);
  end;
end;

function ocher.vs: integer;
var
  temp: adrzap;
begin
  if not isEmpty then
  begin
    temp:= fHead;
    if fhead^.next<>nil then
      fhead^.next^.last:=nil;
    fHead:= fHead^.next;
    result:= temp^.value;
    Dispose(temp);
  end
  else
    result:= 0;
end;

function ocher.isEmpty: boolean;
begin
  result:= fHead = nil;
end;


procedure ocher.sort(versh: integer);
var
  temp,t1:adrzap;
begin
  temp:=ftail;
  while (temp^.value<>versh) do
     temp:=temp^.last;
  if temp=fhead then
    exit
  else
    t1:=temp^.last;
  while (t1<>nil) and (d[t1^.value]>d[temp^.value]) do
    t1:=t1^.last;
  if (t1=nil) or (t1^.next<>temp) then
  begin
    if t1=nil then
    begin
      if temp<>ftail then
        temp^.next^.last:=temp^.last
      else
        ftail:=temp^.last;
      temp^.last^.next:=temp^.next;
      fhead^.last:= temp;
      temp^.next:=fHead;
      fHead:= temp;
      temp^.last:=nil;
    end
    else
    begin
      if temp=ftail
      then
      begin
        ftail:=temp^.last;
        ftail^.next:=nil;
      end
      else
        temp^.next^.last:=temp^.last;
      t1^.next^.last:=temp;
      temp^.last^.next:=temp^.next;
      temp^.next:=t1^.next;
      t1^.next:=temp;
      temp^.last:=t1;
    end;
  end;
end;

procedure dob(i:integer;versh:integer;put:integer);
var
  curr: TPelement;
begin
  new(curr);
  curr^.versh := versh;
  curr^.put := put;
  curr^.next := head[i];
  head[i] := curr;
end;

procedure delete(var head:tpelement);
var
  p:tpelement;
begin
  while head<>nil do
  begin
    p:=head;
    head:=head^.next;
    dispose(p);
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  i,c:integer;
  curr:tpelement;
  och:ocher;
  q,w,e:int64;
begin
  if (trim(edit2.Text)='') then
  begin
    showmessage('вы не указали начальную вершину');
    exit;
  end;
  st:=strtoint(edit2.Text);
  if st>n then
  begin
    showmessage('такой вершины нет в графе');
    exit;
  end;
  for i:=1 to StringGrid2.RowCount-1 do
  begin
    StringGrid2.Cells[1,i]:='';
    StringGrid2.Cells[2,i]:='';
  end;
  kl:=0;
  listbox1.Clear;
  randomize;
  och:=ocher.Create;
  queryperformancefrequency(e);
  QueryPerformanceCounter(q);
  fillchar(b,sizeof(b),0);
  fillchar(v,sizeof(v),0);
  for i:=1 to n do
  d[i]:=maxint;
  d[st]:=0;
  och.dob(st);
  v[st]:=true;
  s:='';
  while  not och.isEmpty do
  begin
    c:=och.vs;
    curr:=head[c];
    b[c]:=true;
    while curr <> nil do
    begin
      if (d[c]+curr^.put<d[curr^.versh]) and not(b[curr^.versh]) then
      begin
        d[curr^.versh] := d[c]+curr^.put;
        if (not v[curr^.versh])  then
        begin
          och.dob(curr^.versh);
          v[curr^.versh]:=true;
        end
        else
          och.sort(curr^.versh);
      end;
      curr := curr^.next;
    end;
  end;
  QueryPerformanceCounter(w);
  edit1.text:=floattostr((w-q)/e);
  if n<=100000 then
  for i:=1 to n do
    if (d[i]<>0) then
      if (d[i]<>maxint)
      then
        listbox1.Items.Add(inttostr(i)+'--->'+inttostr(d[i]))
      else
        listbox1.Items.Add(inttostr(i)+'---> пути не сущестует');
  button4.Enabled:=true;
  button5.Enabled:=true;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  c,p,i:integer;
  curr:tpelement;
begin
  if trim(edit3.Text)='' then
  begin
    showmessage('вы не указали конечную вершину');
    exit;
  end;
  fin:=strtoint(edit3.Text);
  if fin=st then
  begin
    showmessage('конечная вершина совпадает с начальной');
    exit;
  end;
  if fin>n then
  begin
    showmessage('такой вершины нет в графе');
    exit;
  end;
  kl:=1;
  for i:=1 to StringGrid2.RowCount-1 do
  begin
    StringGrid2.Cells[1,i]:='';
    StringGrid2.Cells[2,i]:='';
  end;
  if (d[fin]<maxint) then
  begin
    p:=fin;
    c:=2;
    fillchar(b,sizeof(b),0);
    b[fin]:=true;
    s:=inttostr(fin)+' ';
    while p <> st do
    begin
      curr:=head[p];
      while (curr <> nil) do
      begin
        if (d[p]-d[curr^.versh]=curr^.put) and (not b[curr^.versh]) then
        begin
          s:=inttostr(curr^.versh)+' '+s;
          b[curr^.versh]:=true;
          p:=curr^.versh;
          inc(c);
          break;
        end;
        curr := curr^.next;
      end;
    end;
    StringGrid2.RowCount:=c;
    StringGrid2.Cells[0,0]:='переход';
    StringGrid2.Cells[1,0]:='номер вершины';
    StringGrid2.Cells[2,0]:='путь до неё';
    for i:=1 to StringGrid2.RowCount-1 do
      StringGrid2.Cells[0,i]:=inttostr(i);
    for i:=1 to StringGrid2.RowCount-1 do
    begin
      c:=pos(' ',s);
      StringGrid2.Cells[1,i]:=copy(s,1,c-1);
      StringGrid2.Cells[2,i]:=inttostr(d[strtoint(StringGrid2.Cells[1,i])]);
      s:=copy(s,c+1,length(s)-c);
    end;
  end
  else
  StringGrid2.Cells[1,1]:='пути не существует';
end;


procedure TForm1.Button2Click(Sender: TObject);
var
  f:textfile;
  i,j,z,c,l,k:integer;
begin
  if RadioButton4.Checked then
  if opendialog1.Execute then
  begin
    assignfile(f,opendialog1.FileName);
    reset(f);
    read(f,n);
    stringgrid1.RowCount:=n;
    stringgrid1.ColCount:=31;
    if n<=100000 then
      for i:=0 to n-1 do
        stringgrid1.Cells[0,i]:=inttostr(i+1);
    for i:=1 to n do
    begin
      read(f,z);
      for j:=1 to z do
      begin
        read(f,c);
        read(f,l);
        dob(i,c,l);
        if n<=100000 then
        begin
          stringgrid1.Cells[j*2-1,i-1]:='v'+inttostr(c);
          stringgrid1.Cells[j*2,i-1]:=inttostr(l);
        end;
      end;
    end;
    closefile(f);
    button2.Enabled:=false;
    button1.Enabled:=true;
  end;
  if RadioButton3.Checked then
  if opendialog1.Execute then
  begin
    button2.Enabled:=false;
    assignfile(f,opendialog1.FileName);
    reset(f);
    read(f,n);
    stringgrid1.RowCount:=n;
    stringgrid1.ColCount:=31;
    if n<=100000 then
      for i:=0 to n-1 do
        stringgrid1.Cells[0,i]:=inttostr(i+1);
    for i:=1 to n do
    begin
    k:=1;
    for j:=1 to n do
    begin
      read(f,z);
      if z<>0 then
      begin
        dob(i,j,z);
        if n<=100000 then
        begin
          stringgrid1.Cells[k,i-1]:='v'+inttostr(j);
          stringgrid1.Cells[k+1,i-1]:=inttostr(z);
        end;
        k:=k+2;
      end;
    end;
    end;
    closefile(f);
    button2.Enabled:=false;
    button1.Enabled:=true;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  i,j:integer;
begin
  listbox1.Clear;
  for i:=0 to stringgrid1.RowCount-1 do
  for j:=0 to stringgrid1.ColCount-1 do
    stringgrid1.Cells[j,i]:='';
  for i:=0 to stringgrid2.RowCount-1 do
  for j:=0 to stringgrid2.ColCount-1 do
    stringgrid1.Cells[j,i]:='';
  for i:=1 to StringGrid2.RowCount-1 do
  begin
    StringGrid2.Cells[1,i]:='';
    StringGrid2.Cells[2,i]:='';
  end;
  edit1.Text:='';
  edit2.Text:='';
  edit3.Text:='';
  button1.Enabled:=false;
  button4.Enabled:=false;
  button5.Enabled:=false;
  button2.Enabled:=true;
  for i:=1 to n do
    delete(head[i]);
end;


procedure TForm1.Button5Click(Sender: TObject);
var
  f:textfile;
  i:integer;
begin
  if SaveDialog1.Execute then
  begin
    assignfile(f,SaveDialog1.FileName);
    rewrite(f);
    for i:=1 to n do
    if (d[i]<>0) then
      if (d[i]<>maxint)
      then
        writeln(f,inttostr(i)+'--->'+inttostr(d[i]))
      else
        writeln(f,inttostr(i)+'---> пути не сущестует');
    if kl=1 then
    for i:= 1 to StringGrid2.RowCount-1 do
      writeln(f,StringGrid2.cells[1,i],' ',StringGrid2.cells[2,i]);
    closefile(f);
  end;
end;

end.
