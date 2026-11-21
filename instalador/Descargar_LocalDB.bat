@echo off
rem OPCIONAL: descarga SQL Server LocalDB (unos 60 MB) para incluirlo en el instalador.
rem Con este archivo el instalador puede instalar un motor de base de datos en equipos que no tengan ninguno.
cd /d "%~dp0"
if not exist redist mkdir redist
powershell -NoProfile -Command "Invoke-WebRequest 'https://download.microsoft.com/download/3/8/d/38de7036-2433-4207-8eae-06e247e17b25/SqlLocalDB.msi' -OutFile 'redist\SqlLocalDB.msi' -UseBasicParsing; $s=Get-AuthenticodeSignature 'redist\SqlLocalDB.msi'; if($s.Status -ne 'Valid' -or $s.SignerCertificate.Subject -notlike '*Microsoft*'){Remove-Item 'redist\SqlLocalDB.msi'; Write-Host 'La firma del archivo no es valida: se borro.'; exit 1}; Write-Host 'Descarga verificada.'"
pause
