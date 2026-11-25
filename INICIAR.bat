@echo off
setlocal

pushd "%~dp0backend"

if not exist "node_modules" (
    echo Instalando dependencias...
    call npm install
    if errorlevel 1 goto erro
)

if not exist ".env" (
    echo Arquivo .env nao encontrado.
    echo Copie .env.example para .env e configure os dados do SQL Server.
    goto erro
)

echo ==================================================
echo Iniciando o SISSO...
echo.
echo Neste computador: http://localhost:3000/html/TelaLogin.html
echo Outras maquinas: use o endereco "Rede:" exibido abaixo.
echo.
echo Se outra maquina nao conseguir abrir, execute
echo ABRIR-FIREWALL.bat como Administrador neste servidor.
echo ==================================================

start "" cmd /c "timeout /t 3 >nul & start http://localhost:3000/html/TelaLogin.html"

call npm start
goto fim

:erro
pause

:fim
popd
endlocal
