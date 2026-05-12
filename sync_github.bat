@echo off
title Sincronizzazione GitHub
echo =========================================
echo    Sincronizzazione Repository GitHub
echo =========================================
echo.

echo [1/4] Scaricamento eventuali aggiornamenti dai colleghi (Pull)...
git pull origin main
if %errorlevel% neq 0 (
    echo.
    echo ATTENZIONE: C'e' stato un errore durante lo scaricamento! 
    echo Potrebbero esserci conflitti sui file. Risolvi i conflitti e riprova.
    pause
    exit /b %errorlevel%
)
echo.

echo [2/4] Aggiunta dei file modificati...
git add .
echo.

set commit_msg=
set /p commit_msg="[3/4] Inserisci il nome della modifica (o premi INVIO per inserire data e ora in automatico): "
if "%commit_msg%"=="" (
    set commit_msg=Aggiornamento automatico del %date% %time%
)

git commit -m "%commit_msg%"
echo.

echo [4/4] Caricamento file online (Push)...
git push origin main
if %errorlevel% neq 0 (
    echo.
    echo ATTENZIONE: Si e' verificato un errore durante il caricamento.
    pause
    exit /b %errorlevel%
)

echo.
echo =========================================
echo  Sincronizzazione completata con successo!
echo =========================================
pause
