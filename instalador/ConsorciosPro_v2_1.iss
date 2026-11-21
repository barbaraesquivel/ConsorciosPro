; =====================================================================
; Consorcios Pro - Instalador v2.1 (Inno Setup 6.3 o superior)
;
; Carpeta esperada (junto al .sln):  instalador\
;     ConsorciosPro_v2_1.iss                 (este archivo)
;     AppBaseDB_Instalacion_Sala.sql       (script de la base)
;     Tutorial_SQL_Server.html             (guia de contingencia, funciona sin Internet)
;     DbInstaller\                         (cliente SQL embebido, se publica con Publicar_v2_1.bat)
;     publicacion\                         (la aplicacion publicada, la genera Publicar_v2_1.bat)
;     redist\SqlLocalDB.msi                (OPCIONAL: lo baja Descargar_LocalDB.bat)
;
; Que hace, en orden:
;  1. Detecta las instancias de SQL Server del equipo (registro de Windows) y SQL LocalDB.
;  2. Pagina "Servidor": lista editable con lo detectado. Si no hay motor, ofrece instalar
;     SQL Server LocalDB (pide permiso de administrador SOLO para ese paso) o abrir el tutorial.
;  3. Pre-chequeos ANTES de copiar nada: servicio de Windows (si esta detenido intenta iniciarlo),
;     conexion, permisos para crear la base y estado de la base (no existe / vacia / con datos).
;  4. Copia la aplicacion por usuario (sin administrador) y escribe Servidor= en Configuracion_413BE.txt.
;  5. Crea la base y carga tablas y datos de prueba con el script embebido; verifica el resultado.
;     Si falla: deshace la base parcial, explica el motivo y permite REINTENTAR.
;  6. Si la base ya existia con datos: hace un backup previo, la verifica y NO la modifica; si esta
;     desactualizada lo informa y remite al tutorial de contingencia.
;  Instalacion silenciosa:  Instalador_ConsorciosPro.exe /VERYSILENT /Servidor=.\SQLEXPRESS
; =====================================================================
#define NombreApp "Consorcios Pro"
#define VersionApp "2.1"
#define ExeApp "AppBase.exe"
#define CarpetaPublicacion "publicacion"
#define ScriptBD "AppBaseDB_Instalacion_Sala.sql"
#define DbInstallerExe "DbInstaller\publicacion\DbInstaller.exe"
#define LocalDbMsi "redist\SqlLocalDB.msi"

#if !FileExists(CarpetaPublicacion + "\" + ExeApp)
  #error "No se encontro publicacion\AppBase.exe. Ejecute Publicar_v2_1.bat primero (o cambie ExeApp si el .exe se llama distinto)."
#endif
#if !FileExists(DbInstallerExe)
  #error "No se encontro DbInstaller\publicacion\DbInstaller.exe. Ejecute Publicar_v2_1.bat primero."
#endif
#if FileExists(LocalDbMsi)
  #define TieneMsiLocalDb
#endif

[Setup]
AppId={{B7C0E6A4-5D1F-4A3B-9C2E-7F4D8A1E6C30}
AppName={#NombreApp}
AppVersion={#VersionApp}
AppPublisher=Barbara Esquivel - UAI
PrivilegesRequired=lowest
DefaultDirName={autopf}\{#NombreApp}
DefaultGroupName={#NombreApp}
DisableProgramGroupPage=yes
OutputDir=salida
OutputBaseFilename=Instalador_ConsorciosPro
Compression=lzma2
SolidCompression=yes
WizardStyle=modern
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
UninstallDisplayIcon={app}\{#ExeApp}

[Languages]
Name: "es"; MessagesFile: "compiler:Languages\Spanish.isl"

[Tasks]
Name: "iconoescritorio"; Description: "Crear un acceso directo en el escritorio"; Flags: unchecked

[Files]
Source: "{#CarpetaPublicacion}\*"; DestDir: "{app}"; Excludes: "Configuracion_413BE.txt,*.pdb"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ScriptBD}"; DestDir: "{app}\BaseDeDatos"; Flags: ignoreversion
Source: "Tutorial_SQL_Server.html"; DestDir: "{app}\Docs"; Flags: ignoreversion
; Archivos que se usan durante la instalacion (no se copian a la carpeta de la aplicacion)
Source: "Tutorial_SQL_Server.html"; DestDir: "{tmp}"; Flags: dontcopy
Source: "{#DbInstallerExe}"; DestDir: "{tmp}"; Flags: dontcopy
#ifdef TieneMsiLocalDb
Source: "{#LocalDbMsi}"; DestDir: "{tmp}"; Flags: dontcopy
#endif

[Icons]
Name: "{autoprograms}\{#NombreApp}"; Filename: "{app}\{#ExeApp}"
Name: "{autoprograms}\{#NombreApp} - Tutorial de SQL Server"; Filename: "{app}\Docs\Tutorial_SQL_Server.html"
Name: "{autodesktop}\{#NombreApp}"; Filename: "{app}\{#ExeApp}"; Tasks: iconoescritorio

[Run]
Filename: "{app}\{#ExeApp}"; Description: "Ejecutar {#NombreApp}"; Flags: nowait postinstall skipifsilent

[UninstallDelete]
Type: files; Name: "{app}\Configuracion_413BE.txt"

[Code]
const
  NombreBD = 'AppBaseDB';

var
  PaginaServidor: TWizardPage;
  CboServidor: TNewComboBox;
  LblInfo: TNewStaticText;
  DbiExtraido: Boolean;

{ ------------------------------------------------------------------ utilidades }

function LogDbi(): String;
begin
  Result := ExpandConstant('{userdocs}\ConsorciosPro_instalacion.log');
end;

function Dbi(const Argumentos: String; var Salida: String): Integer;
var
  Rc: Integer;
  Crudo: AnsiString;
begin
  if not DbiExtraido then
  begin
    ExtractTemporaryFile('DbInstaller.exe');
    DbiExtraido := True;
  end;
  DeleteFile(LogDbi() + '.out');
  if not Exec(ExpandConstant('{tmp}\DbInstaller.exe'), Argumentos + ' "' + LogDbi() + '"', '',
              SW_HIDE, ewWaitUntilTerminated, Rc) then
    Rc := -1;
  Salida := '';
  if LoadStringFromFile(LogDbi() + '.out', Crudo) then
    Salida := Trim(String(Crudo));
  if Rc = -1 then
    Salida := 'No se pudo ejecutar el asistente de base de datos (DbInstaller.exe). Puede estar bloqueado por el antivirus o por la configuracion del equipo.';
  Result := Rc;
end;

function ArrayContieneTexto(const Arr: TArrayOfString; const Valor: String): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to GetArrayLength(Arr) - 1 do
    if CompareText(Arr[I], Valor) = 0 then
    begin
      Result := True;
      Exit;
    end;
end;

procedure AgregarTexto(var Arr: TArrayOfString; const Valor: String);
var
  N: Integer;
begin
  N := GetArrayLength(Arr);
  SetArrayLength(Arr, N + 1);
  Arr[N] := Valor;
end;

function EsLocalDb(const Servidor: String): Boolean;
begin
  Result := Pos('(localdb)', Lowercase(Trim(Servidor))) = 1;
end;

function EsServidorLocal(const Servidor: String): Boolean;
var
  P: Integer;
  Host: String;
begin
  P := Pos('\', Servidor);
  if P = 0 then
    Host := Servidor
  else
    Host := Copy(Servidor, 1, P - 1);
  Host := Lowercase(Trim(Host));
  Result := (Host = '.') or (Host = 'localhost') or (Host = '(local)') or
            (Host = Lowercase(GetComputerNameString()));
end;

{ La instancia predeterminada usa el servicio MSSQLSERVER; las demas, MSSQL$<nombre> }
function NombreServicio(const Servidor: String): String;
var
  P: Integer;
  Instancia: String;
begin
  P := Pos('\', Servidor);
  if P = 0 then
    Instancia := ''
  else
    Instancia := Copy(Servidor, P + 1, 200);
  if (Instancia = '') or (CompareText(Instancia, 'MSSQLSERVER') = 0) then
    Result := 'MSSQLSERVER'
  else
    Result := 'MSSQL$' + Instancia;
end;

{ ------------------------------------------------------------------ deteccion }

function DetectarInstancias(): TArrayOfString;
var
  Nativo, Wow, Combinadas: TArrayOfString;
  I: Integer;
begin
  SetArrayLength(Combinadas, 0);
  if not RegGetValueNames(HKLM, 'SOFTWARE\Microsoft\Microsoft SQL Server\Instance Names\SQL', Nativo) then
    SetArrayLength(Nativo, 0);
  if not RegGetValueNames(HKLM, 'SOFTWARE\WOW6432Node\Microsoft\Microsoft SQL Server\Instance Names\SQL', Wow) then
    SetArrayLength(Wow, 0);
  for I := 0 to GetArrayLength(Nativo) - 1 do
    AgregarTexto(Combinadas, Nativo[I]);
  for I := 0 to GetArrayLength(Wow) - 1 do
    if not ArrayContieneTexto(Nativo, Wow[I]) then
      AgregarTexto(Combinadas, Wow[I]);
  Result := Combinadas;
end;

function TieneLocalDbInstalado(): Boolean;
var
  Versiones: TArrayOfString;
begin
  Result := (RegGetSubkeyNames(HKLM, 'SOFTWARE\Microsoft\Microsoft SQL Server Local DB\Installed Versions', Versiones)
             and (GetArrayLength(Versiones) > 0))
         or (RegGetSubkeyNames(HKCU, 'SOFTWARE\Microsoft\Microsoft SQL Server Local DB\Installed Versions', Versiones)
             and (GetArrayLength(Versiones) > 0));
end;

{ ------------------------------------------------------------------ tutorial y LocalDB }

procedure AbrirTutorial();
var
  Destino: String;
  Rc: Integer;
begin
  ExtractTemporaryFile('Tutorial_SQL_Server.html');
  Destino := ExpandConstant('{userdocs}\Tutorial_SQL_Server_ConsorciosPro.html');
  if not FileCopy(ExpandConstant('{tmp}\Tutorial_SQL_Server.html'), Destino, False) then
    Destino := ExpandConstant('{tmp}\Tutorial_SQL_Server.html');
  ShellExec('open', Destino, '', '', SW_SHOWNORMAL, ewNoWait, Rc);
end;

procedure BotonTutorialClick(Sender: TObject);
begin
  AbrirTutorial();
end;

{ Instala LocalDB desde el MSI embebido. Solo este paso pide permiso de administrador (UAC). }
function InstalarLocalDb(): Boolean;
var
  Rc: Integer;
begin
  Result := False;
#ifdef TieneMsiLocalDb
  ExtractTemporaryFile('SqlLocalDB.msi');
  if not ShellExec('runas', ExpandConstant('{sys}\msiexec.exe'),
       '/i "' + ExpandConstant('{tmp}\SqlLocalDB.msi') + '" /passive /norestart IACCEPTSQLLOCALDBLICENSETERMS=YES',
       '', SW_SHOWNORMAL, ewWaitUntilTerminated, Rc) then
  begin
    MsgBox('No se pudo iniciar la instalacion de SQL Server LocalDB (se cancelo el permiso de administrador).' + #13#10 +
           'Puede instalarlo a mano siguiendo el tutorial.', mbError, MB_OK);
    Exit;
  end;
  { 3010 = instalado, pide reiniciar (LocalDB funciona igual sin reiniciar) }
  Result := ((Rc = 0) or (Rc = 3010)) and TieneLocalDbInstalado();
  if not Result then
    MsgBox('La instalacion de SQL Server LocalDB no se completo (codigo ' + IntToStr(Rc) + ').' + #13#10 +
           'Puede instalar SQL Server a mano siguiendo el tutorial.', mbError, MB_OK);
#else
  MsgBox('Este instalador no incluye SQL Server LocalDB.' + #13#10 +
         'Instale SQL Server Express siguiendo el tutorial y vuelva a ejecutar el instalador.', mbInformation, MB_OK);
#endif
end;

procedure BotonLocalDbClick(Sender: TObject);
begin
  if InstalarLocalDb() then
  begin
    CboServidor.Items.Add('(localdb)\MSSQLLocalDB');
    CboServidor.Text := '(localdb)\MSSQLLocalDB';
    LblInfo.Caption := 'SQL Server LocalDB quedo instalado y se selecciono. La base sera solo de su usuario de Windows.';
  end;
end;

{ ------------------------------------------------------------------ pagina de servidor }

procedure InitializeWizard;
var
  Instancias: TArrayOfString;
  I: Integer;
  Defecto, Parametro: String;
  BtnTutorial, BtnLocalDb: TNewButton;
begin
  PaginaServidor := CreateCustomPage(wpSelectDir, 'Servidor de base de datos',
    'Elija la instancia de SQL Server que usara Consorcios Pro');

  LblInfo := TNewStaticText.Create(PaginaServidor);
  LblInfo.Parent := PaginaServidor.Surface;
  LblInfo.Left := 0;
  LblInfo.Top := 0;
  LblInfo.Width := PaginaServidor.SurfaceWidth;
  LblInfo.AutoSize := False;
  LblInfo.WordWrap := True;
  LblInfo.Height := ScaleY(80);

  CboServidor := TNewComboBox.Create(PaginaServidor);
  CboServidor.Parent := PaginaServidor.Surface;
  CboServidor.Left := 0;
  CboServidor.Top := ScaleY(92);
  CboServidor.Width := PaginaServidor.SurfaceWidth;
  CboServidor.Style := csDropDown;

  Instancias := DetectarInstancias();
  Defecto := '';
  for I := 0 to GetArrayLength(Instancias) - 1 do
  begin
    if CompareText(Instancias[I], 'MSSQLSERVER') = 0 then
      CboServidor.Items.Add('.')
    else
      CboServidor.Items.Add('.\' + Instancias[I]);
  end;
  if GetArrayLength(Instancias) > 0 then
    Defecto := CboServidor.Items[0];
  if TieneLocalDbInstalado() then
  begin
    CboServidor.Items.Add('(localdb)\MSSQLLocalDB');
    if Defecto = '' then
      Defecto := '(localdb)\MSSQLLocalDB';
  end;

  if Defecto <> '' then
    LblInfo.Caption := 'Se detectaron servidores en este equipo (lista de abajo). Elija uno o escriba otro ' +
      '(por ejemplo .\SQLEXPRESS, localhost o localhost\SQLEXPRESS). Se usa la autenticacion de Windows. ' +
      'Si la base AppBaseDB no existe, el instalador la crea y carga los datos iniciales.'
  else
  begin
    Defecto := '.\SQLEXPRESS';
    LblInfo.Caption := 'No se detecto SQL Server en este equipo. Si el servidor esta en otra ubicacion, escriba su nombre abajo. ' +
      'Si necesita instalar un motor, use el boton "Instalar SQL Server LocalDB" (si el instalador lo incluye) ' +
      'o abra el tutorial.';
  end;

  Parametro := ExpandConstant('{param:Servidor|}');
  if Parametro <> '' then
    Defecto := Parametro;
  CboServidor.Text := Defecto;

  BtnTutorial := TNewButton.Create(PaginaServidor);
  BtnTutorial.Parent := PaginaServidor.Surface;
  BtnTutorial.Left := 0;
  BtnTutorial.Top := ScaleY(130);
  BtnTutorial.Width := ScaleX(210);
  BtnTutorial.Height := ScaleY(26);
  BtnTutorial.Caption := 'Ver tutorial de SQL Server';
  BtnTutorial.OnClick := @BotonTutorialClick;

  BtnLocalDb := TNewButton.Create(PaginaServidor);
  BtnLocalDb.Parent := PaginaServidor.Surface;
  BtnLocalDb.Left := ScaleX(220);
  BtnLocalDb.Top := ScaleY(130);
  BtnLocalDb.Width := ScaleX(230);
  BtnLocalDb.Height := ScaleY(26);
  BtnLocalDb.Caption := 'Instalar SQL Server LocalDB';
  BtnLocalDb.OnClick := @BotonLocalDbClick;
#ifndef TieneMsiLocalDb
  BtnLocalDb.Visible := False;
#endif
end;

function ServidorSeleccionado(): String;
begin
  Result := Trim(CboServidor.Text);
  if Result = '' then
    Result := '.\SQLEXPRESS';
end;

{ Pre-chequeos antes de copiar nada. Devuelve False para quedarse en la pagina. }
function VerificarServidor(): Boolean;
var
  Servidor, Salida: String;
  Rc: Integer;
begin
  Result := False;
  Servidor := ServidorSeleccionado();

  if EsLocalDb(Servidor) and (not TieneLocalDbInstalado()) then
  begin
    if MsgBox('SQL Server LocalDB no esta instalado en este equipo. ' + #13#10 +
              'Puede instalarlo ahora (Windows pedira permiso de administrador solo para este paso) o ' +
              'usar el tutorial.' + #13#10#13#10 + 'Desea instalarlo ahora?', mbConfirmation, MB_YESNO) = IDYES then
    begin
      if not InstalarLocalDb() then
        Exit;
    end
    else
      Exit;
  end;

  if EsServidorLocal(Servidor) and (not EsLocalDb(Servidor)) then
  begin
    Rc := Dbi('service "' + NombreServicio(Servidor) + '"', Salida);
    if Rc = 0 then
    begin
      if Salida <> '' then
        MsgBox(Salida, mbInformation, MB_OK);
    end
    else if Rc = 3 then
    begin
      if MsgBox(Salida + #13#10#13#10 + 'Inicie el servicio desde "Servicios" de Windows (o pida al encargado que lo haga) ' +
                'y presione Si para continuar, o No para volver y corregir.', mbError, MB_YESNO) = IDNO then
        Exit;
    end;
  end;

  Rc := Dbi('test "' + Servidor + '"', Salida);
  if Rc <> 0 then
  begin
    if MsgBox('No se pudo conectar con "' + Servidor + '".' + #13#10#13#10 + Salida + #13#10#13#10 +
              'Revise el nombre del servidor, que el servicio de SQL Server este iniciado o abra el tutorial.' + #13#10 +
              'Desea continuar de todos modos?', mbError, MB_YESNO) = IDNO then
      Exit;
  end
  else
  begin
    Rc := Dbi('perms "' + Servidor + '" ' + NombreBD, Salida);
    if Rc = 3 then
    begin
      if MsgBox(Salida + #13#10#13#10 + 'Desea continuar de todos modos?', mbError, MB_YESNO) = IDNO then
        Exit;
    end
    else
    begin
      Rc := Dbi('estado "' + Servidor + '" ' + NombreBD, Salida);
      if Rc = 12 then
        MsgBox('La base ' + NombreBD + ' ya existe y tiene datos: se conservara sin modificarla ' +
               '(se hace un backup previo y se verifica).', mbInformation, MB_OK);
    end;
  end;
  Result := True;
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  Result := True;
  if CurPageID = PaginaServidor.ID then
    Result := VerificarServidor();
end;

{ ------------------------------------------------------------------ configuracion y base }

procedure EscribirConfiguracion(const Servidor: String);
var
  Ruta, T: String;
  Lineas, Nuevas: TArrayOfString;
  I, N: Integer;
  TieneUmbral: Boolean;
begin
  Ruta := ExpandConstant('{app}\Configuracion_413BE.txt');
  SetArrayLength(Nuevas, 0);
  TieneUmbral := False;
  if FileExists(Ruta) then
    if LoadStringsFromFile(Ruta, Lineas) then
      for I := 0 to GetArrayLength(Lineas) - 1 do
      begin
        T := Trim(Lineas[I]);
        if (T <> '') and (Pos('SERVIDOR=', UpperCase(T)) <> 1) then
        begin
          if Pos('UMBRALREPETICION=', UpperCase(T)) = 1 then
            TieneUmbral := True;
          AgregarTexto(Nuevas, T);
        end;
      end;
  if not TieneUmbral then
    AgregarTexto(Nuevas, 'UmbralRepeticion=3');
  AgregarTexto(Nuevas, 'Servidor=' + Servidor);
  SaveStringsToFile(Ruta, Nuevas, False);
end;

procedure MostrarFalloBase(const Detalle: String);
begin
  if SuppressibleMsgBox('La aplicacion quedo instalada, pero la base de datos NO quedo lista.' + #13#10#13#10 +
       Detalle + #13#10#13#10 + 'Registro: ' + LogDbi() + #13#10#13#10 +
       'Desea abrir el tutorial de contingencia?', mbError, MB_YESNO, IDNO) = IDYES then
    AbrirTutorial();
end;

procedure PrepararBase(const Servidor: String);
var
  Salida, Script, Backup, Resumen: String;
  Estado, Rc: Integer;
  Reintentar: Boolean;
begin
  Script := ExpandConstant('{app}\BaseDeDatos\{#ScriptBD}');
  WizardForm.StatusLabel.Caption := 'Preparando la base de datos (puede demorar un minuto)...';
  repeat
    Reintentar := False;

    Estado := Dbi('estado "' + Servidor + '" ' + NombreBD, Salida);
    if (Estado <> 10) and (Estado <> 11) and (Estado <> 12) then
    begin
      MostrarFalloBase('No se pudo consultar el servidor "' + Servidor + '". ' + Salida);
      Exit;
    end;

    if Estado = 12 then
    begin
      { Instalacion previa: backup y verificacion, sin modificar nada }
      Rc := Dbi('backup "' + Servidor + '" ' + NombreBD, Backup);
      if Rc = 0 then
        Resumen := 'Se hizo un backup previo en: ' + Backup + #13#10#13#10
      else
        Resumen := 'No se pudo hacer el backup previo (' + Backup + ').' + #13#10#13#10;
      Rc := Dbi('verify "' + Servidor + '" ' + NombreBD, Salida);
      if Rc = 0 then
        SuppressibleMsgBox('La base ' + NombreBD + ' ya existia y esta completa: se conserva sin cambios.' + #13#10#13#10 + Resumen,
          mbInformation, MB_OK, IDOK)
      else
        MostrarFalloBase('La base ' + NombreBD + ' ya existe pero esta desactualizada o incompleta.' + #13#10 + Salida + #13#10#13#10 +
          Resumen + 'Si es una base de prueba, puede borrarla (DROP DATABASE ' + NombreBD + ') y volver a ejecutar el instalador.');
      Exit;
    end;

    Rc := Dbi('script "' + Servidor + '" "' + Script + '"', Salida);
    if Rc = 0 then
      Rc := Dbi('verify "' + Servidor + '" ' + NombreBD, Salida);

    if Rc <> 0 then
    begin
      { Deshacer lo parcial solo si la base la creo este instalador }
      if Estado = 10 then
        Dbi('drop "' + Servidor + '" ' + NombreBD, Backup);
      if SuppressibleMsgBox('No se pudo preparar la base de datos.' + #13#10#13#10 + Salida + #13#10#13#10 +
           'Se deshizo lo que se hubiera creado a medias. Registro: ' + LogDbi() + #13#10#13#10 +
           'Desea reintentar?', mbError, MB_YESNO, IDNO) = IDYES then
        Reintentar := True
      else
        MostrarFalloBase(Salida);
    end;
  until not Reintentar;
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssPostInstall then
  begin
    EscribirConfiguracion(ServidorSeleccionado());
    PrepararBase(ServidorSeleccionado());
  end;
end;
