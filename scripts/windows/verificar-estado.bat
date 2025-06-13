@echo off
REM =============================================================================
REM EduTech - Script de Verificación de Estado (Windows) - Course Service
REM =============================================================================
REM Descripción: Verifica el estado completo del Course Service
REM Autor: Equipo de Desarrollo EduTech
REM Versión: 1.0.0
REM Plataforma: Windows
REM =============================================================================

setlocal enabledelayedexpansion
set ROOT_DIR=%~dp0..\..
set SERVICE_PORT=8082
set HEALTH_ENDPOINT=http://localhost:%SERVICE_PORT%/actuator/health
set API_BASE=http://localhost:%SERVICE_PORT%/api

REM Importar funciones de banner
call "%ROOT_DIR%\scripts\banner.bat"

REM Función principal
:main
call :show_edutech_banner
call :show_operation_banner "📊 VERIFICACIÓN DE ESTADO" "Analizando Course Service..."

set status=🔴 INACTIVO
set pid=
set health_status=❌ NO DISPONIBLE

REM Verificar si el puerto está en uso
netstat -an | findstr ":%SERVICE_PORT% " | findstr "LISTENING" >nul
if !errorlevel! == 0 (
    set status=🟢 ACTIVO
    
    REM Obtener PID del proceso
    for /f "tokens=5" %%a in ('netstat -ano ^| findstr ":%SERVICE_PORT% " ^| findstr "LISTENING"') do (
        set pid=%%a
        goto :pid_found
    )
    :pid_found
    
    REM Verificar health endpoint
    curl -s "%HEALTH_ENDPOINT%" >nul 2>&1
    if !errorlevel! == 0 (
        curl -s "%HEALTH_ENDPOINT%" | findstr "UP" >nul 2>&1
        if !errorlevel! == 0 (
            set health_status=✅ SALUDABLE
        ) else (
            set health_status=⚠️ RESPONDIENDO
        )
    )
)

REM Mostrar estado
call :show_service_status "!status!" "%SERVICE_PORT%" "!pid!"

echo.
echo 🏥 Health Check: !health_status!

if "!status!"=="🟢 ACTIVO" (
    echo 🌐 Health URL: %HEALTH_ENDPOINT%
    echo 📚 API Base: %API_BASE%
    
    echo.
    echo 🔍 Verificando endpoints principales:
    
    REM Verificar endpoints
    curl -s "%API_BASE%/categories" >nul 2>&1
    if !errorlevel! == 0 (
        echo    ✅ /api/categories
    ) else (
        echo    ❌ /api/categories
    )
    
    curl -s "%API_BASE%/courses" >nul 2>&1
    if !errorlevel! == 0 (
        echo    ✅ /api/courses
    ) else (
        echo    ❌ /api/courses
    )
    
    curl -s "%API_BASE%/courses/premium" >nul 2>&1
    if !errorlevel! == 0 (
        echo    ✅ /api/courses/premium
    ) else (
        echo    ❌ /api/courses/premium
    )
    
    curl -s "%API_BASE%/courses/featured" >nul 2>&1
    if !errorlevel! == 0 (
        echo    ✅ /api/courses/featured
    ) else (
        echo    ❌ /api/courses/featured
    )
)

echo.
echo 📄 Estado de logs:
if exist "%ROOT_DIR%\logs\service.log" (
    for %%F in ("%ROOT_DIR%\logs\service.log") do echo    📄 service.log: %%~zF bytes
) else (
    echo    📄 service.log: No encontrado
)

if exist "%ROOT_DIR%\logs\service.pid" (
    set /p stored_pid=<"%ROOT_DIR%\logs\service.pid"
    echo    🔍 PID almacenado: !stored_pid!
) else (
    echo    🔍 PID almacenado: No encontrado
)

echo.

if "!status!"=="🟢 ACTIVO" if "!health_status!"=="✅ SALUDABLE" (
    call :show_success_banner "Course Service está operativo y saludable"
) else if "!status!"=="🟢 ACTIVO" (
    call :show_warning_banner "Course Service está activo pero con problemas de salud"
) else (
    call :show_error_banner "Course Service no está ejecutándose"
)

echo.
echo 🔄 Para monitoreo continuo: Ejecutar este script repetidamente
echo 📄 Para ver logs: type "%ROOT_DIR%\logs\service.log"
echo.

pause
goto :eof

REM Ejecutar función principal
call :main %*
