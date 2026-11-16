@echo off
title GameReady PC Doctor Launcher
cd /d "%~dp0"

:: Auto-elevate to Administrator (UAC)
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Solicitando privilegios de administrador...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: Run GameReady Optimizer in modern GUI mode without persistent black console
start "" powershell -WindowStyle Hidden -ExecutionPolicy Bypass -NoProfile -File "%~dp0GameReady_Optimizer.ps1"
exit
