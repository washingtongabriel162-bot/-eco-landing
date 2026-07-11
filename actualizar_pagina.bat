@echo off
chcp 65001 >nul
title Actualizar pagina ECO
cd /d "%~dp0"

echo ============================================================
echo   ACTUALIZAR PAGINA DE ECO  (subir a GitHub)
echo ============================================================
echo.

REM --- 1) Verificar que Git este instalado ---
git --version >nul 2>&1
if errorlevel 1 (
  echo [ERROR] Git no esta instalado en esta PC.
  echo Descargalo de: https://git-scm.com/download/win
  echo Instalalo y vuelve a dar doble clic a este archivo.
  echo.
  pause
  exit /b 1
)

REM --- 2) Conectar esta carpeta con tu repo si aun no lo esta ---
set REPO=https://github.com/washingtongabriel162-bot/-eco-landing.git
if not exist ".git" (
  echo Primera vez: conectando la carpeta con tu repositorio...
  git init >nul
  git remote add origin %REPO% >nul 2>&1
  git branch -M main >nul 2>&1
)

REM Asegurar el remoto correcto (por si cambio)
git remote set-url origin %REPO% >nul 2>&1
if errorlevel 1 git remote add origin %REPO% >nul 2>&1

REM --- 3) Identidad para el commit (por si no estaba configurada) ---
git config user.name  "Gabriel" >nul 2>&1
git config user.email "washingtongabriel162@gmail.com" >nul 2>&1

REM --- 4) Preparar y guardar los cambios ---
echo Guardando cambios...
git add -A
git commit -m "Actualizar pagina ECO (%date% %time%)" >nul 2>&1

REM --- 5) Subir a GitHub ---
echo.
echo Subiendo a GitHub...
echo (Si es la primera vez, se abrira una ventana para iniciar sesion en GitHub. Acepta.)
echo.
git push -u origin main
if errorlevel 1 (
  echo.
  echo El envio normal no paso. Publicando tus archivos actuales...
  git push -u origin main --force
)

echo.
if errorlevel 1 (
  echo ============================================================
  echo   [ATENCION] No se pudo subir automaticamente.
  echo   Revisa que hayas iniciado sesion en GitHub y tu internet.
  echo   Si sigue fallando, pasame lo que dice arriba.
  echo ============================================================
) else (
  echo ============================================================
  echo   LISTO. Tu pagina se actualiza en ~1 minuto aqui:
  echo   https://washingtongabriel162-bot.github.io/-eco-landing/
  echo ============================================================
)

echo.
pause
