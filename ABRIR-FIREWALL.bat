@echo off
setlocal

set PORTA=3000

net session >nul 2>&1
if errorlevel 1 (
    echo.
    echo Execute este arquivo como Administrador:
    echo clique com o botao direito e escolha
    echo "Executar como administrador".
    echo.
    pause
    exit /b 1
)

netsh advfirewall firewall delete rule name="SISSO (porta %PORTA%)" >nul 2>&1

netsh advfirewall firewall add rule name="SISSO (porta %PORTA%)" dir=in action=allow protocol=TCP localport=%PORTA% profile=domain,private,public

echo.
echo Regra criada: conexoes de entrada na porta %PORTA% liberadas.
echo Acesse de outras maquinas em: http://IP-DESTE-SERVIDOR:%PORTA%/html/TelaLogin.html
echo.
pause
endlocal
