unit Backup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, FileCtrl, ComCtrls,ShellAPI;

const
  SourceSect='Source';
  DestSect  ='Destination';
  IncludeExtSect='Include extension';
  MaskIdent   ='Mask';
  OverwriteSect='Overwrite options';
  OverwriteIdent='Overwrite';
  DriveIdent='Drive';
  DirectoryIdent='Directory';

type
  TformBackup = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    SourcePath: TLabel;
    DestinationPath: TLabel;
    CopyFiles: TButton;
    SourceDirectory: TDirectoryListBox;
    DestinationDirectory: TDirectoryListBox;
    SourceDrive: TDriveComboBox;
    DestinationDrive: TDriveComboBox;
    SourceFiles: TFileListBox;
    DestinationFiles: TFileListBox;
    IncludeExtBox: TScrollBox;
    Label4: TLabel;
    Bevel1: TBevel;
    FIleCount: TLabel;
    FilesLength: TLabel;
    WriteOpt: TRadioGroup;
    Bevel2: TBevel;
    FreeLabel: TLabel;
    ProgressBar: TProgressBar;
    CopyingFileLabel: TLabel;
    ButtonMkDir: TButton;
    ButtonExit: TButton;
    SaveINI: TButton;
    SaveINIDlg: TSaveDialog;
    procedure SourceDirectoryChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DestinationDirectoryChange(Sender: TObject);
    procedure CopyFilesClick(Sender: TObject);
    procedure ButtonMkDirClick(Sender: TObject);
    procedure ButtonExitClick(Sender: TObject);
    procedure SaveINIClick(Sender: TObject);
    procedure Label3Click(Sender: TObject);
  private
    { Private declarations }
    IncludeExt:TStringList;
    SourceFilesList:TStringList;
    procedure UpdateExt;
    procedure UpdateMask;
    procedure CheckBoxClick(Sender:TObject);
  public
    { Public declarations }
    function AutoCopy:boolean;
  end;

var
  formBackup: TformBackup;

implementation

{$R *.DFM}

uses NovaPasta,inifiles;

procedure TformBackup.SourceDirectoryChange(Sender: TObject);
begin
 SourceFiles.Directory:=SourceDirectory.Directory;
 UpdateExt;
end;

procedure TformBackup.UpdateExt;
var F:integer;
    SearchRec:TSearchRec;
    s:string[5];
    i:integer;
    CheckBox:TCheckBox;
    Control:TControl;
    SSepar:string;
begin
  try
    IncludeExtBox.Visible:=false;
   {Remove old checkboxes and clear extensions list}
    while IncludeExtBox.ControlCount > 0 do begin
     Control:=IncludeExtBox.Controls[0];
     IncludeExtBox.RemoveControl(Control);
     Control.Destroy;
    end;
    IncludeExt.Clear;
    {Create list of possible extensions}
    if SourceDirectory.Directory[length(SourceDirectory.Directory)]='\'
       then SSepar:='' else SSepar:='\';
    F := FindFirst(SourceDirectory.Directory+SSepar+'*.*',
                   faAnyFile and (not faDirectory), SearchRec);
    while F = 0 do
    begin
      s:=ExtractFileExt(SearchRec.Name);
      if s[1]='.' then system.delete(s,1,1);
      if length(s)=0 then s:='   ';
      IncludeExt.Add(s);
      F := FindNext(SearchRec);
    end;
    FindClose(SearchRec);
    CheckBox:=NIL;
    {Insert new checkboxes}
    for i:=0 to IncludeExt.Count-1 do begin
     CheckBox:=TCheckBox.Create(IncludeExtBox);
     CheckBox.Parent:=IncludeExtBox;
     with CheckBox do begin
      Width:=50;
      Height:=17;
      Top:=4+Height*i;
      Left:=4;
      Caption:=IncludeExt[i];
      Checked:=true;
      Font.Name:='Times New Roman';
      Font.Size:=8;
      OnClick:=CheckBoxClick;
     end;
    end;
    if CheckBox<>NIL then IncludeExtBox.ScrollInView(CheckBox);
   finally
    IncludeExtBox.Visible:=true;
    UpdateMask;
   end;
end;

procedure TformBackup.UpdateMask;
var Mask:string;
    i,size:integer;
    SearchRec:TSearchRec;
begin
 Screen.Cursor:=crHourGlass;
 Mask:='';
 for i:=0 to IncludeExtBox.ControlCount-1 do
  if (IncludeExtBox.Controls[i] is TCheckBox) then
   with (IncludeExtBox.Controls[i] as TCheckBox) do begin
    if Checked then Mask:=Mask+'*.'+Caption+';';
   end;
 SourceFiles.Mask:=Mask;
 FileCount.Caption:='Number of files: '+IntToStr(SourceFiles.Items.Count);
 size:=0;
 for i:=0 to SourceFiles.Items.Count-1 do begin
   FindFirst(SourceFiles.Items[i],faAnyFile,SearchRec);
   size:=size+SearchRec.Size;
   FindClose(SearchRec);
  end;
 FilesLength.Caption:='Total size: '+IntToStr(size div 1024)+' KB';
 Screen.Cursor:=crDefault;
end;

procedure TformBackup.FormCreate(Sender: TObject);
begin
 IncludeExt:=TStringList.Create;
 IncludeExt.Sorted:=true;
 IncludeExt.Duplicates:=dupIgnore;
 SourceFilesList:=TStringList.Create;
 UpdateExt;
end;

procedure TformBackup.FormDestroy(Sender: TObject);
begin
 IncludeExt.Destroy;
 SourceFilesList.Destroy;
end;

procedure TformBackup.CheckBoxClick(Sender:TObject);
begin
 UpdateMask;
end;

procedure TformBackup.DestinationDirectoryChange(Sender: TObject);
begin
 FreeLabel.Caption:='Free: '+IntToStr(DiskFree(0) div 1024)+' KB';
end;

procedure TformBackup.CopyFilesClick(Sender: TObject);
var FName,SDir,DDir:string;
    CopyBuffer: Pointer; { buffer for copying }
    TimeStamp, BytesCopied: Longint;
    Source, Dest: Integer; { handles }
    i:integer;
    SSepar,DSepar:string;
label TryAgain,TryAgain2,TryAgain3,TryAgain4; //Did I really use labels ????!!!
const
  ChunkSize: Longint = 32768;
begin
 if (SourceDrive.Drive=DestinationDrive.Drive) and
    (SourceDirectory.Directory=DestinationDirectory.Directory) then
   ShowMessage('You cannot copy to the same directory!')
  else begin
   try
    Screen.Cursor:=crHourGlass;
    SDir:=SourceDirectory.Directory;
    DDir:=DestinationDirectory.Directory;
    if SDir[length(SDir)]='\' then SSepar:='' else SSepar:='\';
    if DDir[length(DDir)]='\' then DSepar:='' else DSepar:='\';
    GetMem(CopyBuffer, ChunkSize); { allocate the buffer }
    for i:=0 to SourceFiles.Items.Count-1 do begin
     FName:=ExtractFileName(SourceFiles.Items[i]);
     ProgressBar.Position:=trunc(i*100/SourceFiles.Items.Count);
     CopyingFileLabel.Caption:='Copying: '+FName;
     CopyingFileLabel.Update;
     TimeStamp := FileAge(FName); { get source's time stamp }
    TryAgain:
     Source := FileOpen(SDir+SSepar+FName, fmShareDenyWrite); { open source file }
     if Source < 0 then
      case MessageDlg('Erro ao ler o arquivo '#13#10+FName,mtError,
                     [mbAbort,mbRetry,mbIgnore],0) of
         mrAbort:Break; //Exit for... loop
         mrRetry:GoTo TryAgain;
         mrIgnore:Continue;//Continue for... loop
     end;
     if WriteOpt.ItemIndex=1 then //See if there is an old file
        if FileExists(DDir+DSepar+FName) then
        case MessageDlg('O Arquivo '+FName+' já existe'#13#10'Substituír ?', mtConfirmation,
                        [mbYes,mbNo,mbAll],0) of
         mrYes:begin end;
         mrNo: Continue; //Continue for ... loop
         mrAll:WriteOpt.ItemIndex:=0; //Always overwrite
        end;
    TryAgain2:
     Dest := FileCreate(DDir+DSepar+FName); { create output file}
     if Dest < 0 then
        case MessageDlg('Erro na criação '+FName,mtError,
                        [mbAbort,mbRetry,mbIgnore],0) of
          mrAbort:Break; //Exit for... loop
          mrRetry:GoTo TryAgain2;
          mrIgnore:Continue;//Continue for... loop
        end;
     try
      repeat
       TryAgain3:
           {$I-}
           BytesCopied := FileRead(Source, CopyBuffer^, ChunkSize); { read chunk }
           {$I+}
           if IOResult <> 0 then
            case MessageDlg('Error reading file'#13#10+FName,mtError,
                      [mbAbort,mbRetry,mbIgnore],0) of
              mrAbort:Break; //Exit repeat... loop
              mrRetry:GoTo TryAgain3;
              mrIgnore:Continue;//Continue repeat... loop
            end;
           if BytesCopied > 0 then begin{ if we read anything... }
            TryAgain4:
            {$I-}
             FileWrite(Dest, CopyBuffer^, BytesCopied); { ...write chunk }
            {$I+}
             if IOResult <> 0 then
              case MessageDlg('Error writing file'#13#10+FName,mtError,
                       [mbAbort,mbRetry,mbIgnore],0) of
               mrAbort:Break; //Exit repeat... loop
               mrRetry:GoTo TryAgain4;
               mrIgnore:Continue;//Continue repeat... loop
              end;
            end;
         until BytesCopied < ChunkSize; { until we run out of chunks }
     finally
         FileSetDate(Dest, TimeStamp);
         FileClose(Dest); { close the destination file }
     end;
    end;
   finally
    ProgressBar.Position:=0;
    CopyingFileLabel.Caption:='';
    DestinationFiles.Update;
    FreeMem(CopyBuffer, ChunkSize);
    Screen.Cursor:=crDefault;
   end;
  end;
end;

procedure TformBackup.ButtonMkDirClick(Sender: TObject);
begin
 with formNovaPasta do
  if ShowModal=mrOk then begin
   {$I-}
   MkDir(NewDir.Text);
   {$I+}
   if IOResult<>0 then MessageDlg('Erro ao criar a pasta '#13#10+
                       NewDir.Text,mtError,[mbOk],0)
                  else begin
                   DestinationDirectory.Directory:=NewDir.Text;
                  end;
  end;
end;

procedure TformBackup.ButtonExitClick(Sender: TObject);
begin
 Close;
end;

procedure TformBackup.SaveINIClick(Sender: TObject);
var INIFile:TINIFile;
    ININame:string;
begin
 if SaveINIDlg.Execute then begin
 INIFile:=TINIFile.Create(SaveINIDlg.Filename);
 INIFile.WriteString(SourceSect,DriveIdent,SourceDrive.Drive);
 INIFile.WriteString(SourceSect,DirectoryIdent,SourceDirectory.Directory);
 INIFile.WriteString(DestSect,DriveIdent,DestinationDrive.Drive);
 INIFile.WriteString(DestSect,DirectoryIdent,DestinationDirectory.Directory);
 INIFile.WriteInteger(OverwriteSect,OverwriteIdent,WriteOpt.ItemIndex);
 INIFile.WriteString(IncludeExtSect,MaskIdent,SourceFiles.Mask);
 end;
end;

function TformBackup.AutoCopy:boolean;
var INIFile:TINIFile;
    ININame:string;
    params:string;
begin
 Result:=false;
 if ParamCount > 1 then
   if UpperCase(ParamStr(1))='/A' then begin
    if ExtractFileName(ParamStr(2))=ParamStr(2) then begin
     ININame:=GetCurrentDir;
     if ININame[length(ININame)]='\' then
        ININame:=ININame+ParamStr(2) else
        ININame:=ININame+'\'+ParamStr(2)
    end else
     ININame:=ParamStr(2);
    if FileExists(ININame) then begin
     Show;
     INIFile:=TINIFile.Create(ININame);
     SourceDrive.Drive:=INIFile.ReadString(SourceSect,DriveIdent,'')[1];
     SourceDirectory.Directory:=INIFile.ReadString(SourceSect,DirectoryIdent,'');
     DestinationDrive.Drive:=INIFile.ReadString(DestSect,DriveIdent,'')[1];
     DestinationDirectory.Directory:=INIFile.ReadString(DestSect,DirectoryIdent,'');
     WriteOpt.ItemIndex:=INIFile.ReadInteger(OverwriteSect,OverwriteIdent,1);
     SourceFiles.Mask:=INIFile.ReadString(IncludeExtSect,MaskIdent,'');
     CopyFilesClick(Self);
     Result:=true;
    end else Showmessage('File not found: '+ParamStr(2));
   end else ShowMessage('Unknown command line parameter'#13#10+ParamStr(1));
end;

procedure TformBackup.Label3Click(Sender: TObject);

begin
ShellExecute(Handle,'open','http://www.mpdelphi.cjb.net',nil,nil,SW_NORMAL);
end;

end.
