@echo off
rem Publica la aplicacion y el asistente de base de datos (autocontenidos: no requieren instalar .NET).
rem Ejecutar desde la carpeta "instalador" (dentro de la carpeta de la solucion). Necesita internet la primera vez.
cd /d "%~dp0"
if exist publicacion rmdir /s /q publicacion
if exist DbInstaller\publicacion rmdir /s /q DbInstaller\publicacion

echo === Publicando la aplicacion ===
dotnet publish "..\App\AppBase.csproj" -c Release -r win-x64 --self-contained true -o "publicacion"
if errorlevel 1 goto error

echo === Publicando el asistente de base de datos ===
dotnet publish "DbInstaller\DbInstaller.csproj" -c Release -r win-x64 --self-contained true -p:PublishSingleFile=true -p:IncludeNativeLibrariesForSelfExtract=true -p:EnableCompressionInSingleFile=true -o "DbInstaller\publicacion"
if errorlevel 1 goto error

echo.
echo Listo. Ahora abra ConsorciosPro_v2_1.iss con Inno Setup y presione Compile ^(Ctrl+F9^).
echo Ejecutables de la aplicacion:
dir /b publicacion\*.exe
pause
exit /b 0

:error
echo.
echo ERROR al publicar. Revise el mensaje de arriba.
pause
exit /b 1
