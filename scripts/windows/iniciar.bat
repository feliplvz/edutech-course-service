@echo off
REM =============================================================================
REM EduTech - Script de Inicio Inteligente (Windows) - Course Service
REM =============================================================================
REM Descripción: Inicio avanzado del Microservicio de Cursos EduTech
REM              con verificaciones completas y monitoreo en tiempo real
REM Autor: Equipo de Desarrollo EduTech
REM Versión: 1.0.0
REM Plataforma: Windows
REM =============================================================================

setlocal enabledelayedexpansion
set ROOT_DIR=%~dp0..\..
set SCRIPT_DIR=%~dp0
set SERVICE_NAME=Course Service
set SERVICE_PORT=8082
set HEALTH_ENDPOINT=http://localhost:%SERVICE_PORT%/actuator/health
set MAX_WAIT_TIME=120
set LOG_FILE=%ROOT_DIR%\logs\inicio.log
set PID_FILE=%ROOT_DIR%\logs\service.pid

REM Crear directorio de logs
if not exist "%ROOT_DIR%\logs" mkdir "%ROOT_DIR%\logs"

REM Función de logging
:log
echo [%date% %time%] [%~1] %~2 >> "%LOG_FILE%"
goto :eof

REM Importar funciones de banner
call "%ROOT_DIR%\scripts\banner.bat"

REM Verificar si el puerto está en uso
:check_port
netstat -an | findstr ":%~1 " | findstr "LISTENING" >nul
goto :eof

REM Obtener PID del proceso en el puerto
:get_port_pid
for /f "tokens=5" %%a in ('netstat -ano ^| findstr ":%~1 " ^| findstr "LISTENING"') do (
    set port_pid=%%a
    goto :eof
)
set port_pid=
goto :eof

REM Detener procesos existentes
:stop_existing_service
call :show_operation_banner "🛑 VERIFICANDO PROCESOS EXISTENTES" "Buscando instancias del servicio en ejecución..."

call :check_port %SERVICE_PORT%
if !errorlevel! == 0 (
    call :get_port_pid %SERVICE_PORT%
    if defined port_pid (
        call :log "WARN" "Proceso existente encontrado en puerto %SERVICE_PORT% (PID: !port_pid!)"
        echo ⚠️  Proceso existente detectado en puerto %SERVICE_PORT%
        echo 🔍 PID del proceso: !port_pid!
        
        set /p "response=¿Desea detener el proceso existente? (y/n): "
        if /i "!response!"=="y" (
            echo 🛑 Deteniendo proceso existente...
            taskkill /PID !port_pid! /T /F >nul 2>&1
            timeout /t 3 >nul
            call :show_success_banner "Proceso anterior detenido correctamente"
            call :log "INFO" "Proceso anterior detenido (PID: !port_pid!)"
        ) else (
            call :show_error_banner "Operación cancelada por el usuario"
            call :log "WARN" "Usuario canceló detener proceso existente"
            exit /b 1
        )
    )
) else (
    call :show_success_banner "Puerto %SERVICE_PORT% disponible"
    call :log "INFO" "Puerto %SERVICE_PORT% está disponible"
)
goto :eof

REM Verificar prerrequisitos
:check_prerequisites
call :show_operation_banner "🔍 VERIFICANDO PRERREQUISITOS" "Validando entorno de desarrollo..."

REM Verificar Java
java -version >nul 2>&1
if !errorlevel! neq 0 (
    call :show_error_banner "Java no está instalado"
    call :log "ERROR" "Java no encontrado en el sistema"
    exit /b 1
)

for /f "tokens=3" %%g in ('java -version 2^>^&1 ^| findstr version') do (
    set JAVA_VERSION=%%g
    set JAVA_VERSION=!JAVA_VERSION:"=!
)

echo ✅ Java !JAVA_VERSION! detectado
call :log "INFO" "Java !JAVA_VERSION! verificado"

REM Verificar Maven
mvn -version >nul 2>&1
if !errorlevel! neq 0 (
    call :show_error_banner "Maven no está instalado"
    call :log "ERROR" "Maven no encontrado en el sistema"
    exit /b 1
)

for /f "tokens=3" %%g in ('mvn -version 2^>^&1 ^| findstr "Apache Maven"') do (
    set MAVEN_VERSION=%%g
)

echo ✅ Maven !MAVEN_VERSION! detectado
call :log "INFO" "Maven !MAVEN_VERSION! verificado"

REM Verificar archivo pom.xml
if not exist "%ROOT_DIR%\pom.xml" (
    call :show_error_banner "Archivo pom.xml no encontrado en %ROOT_DIR%"
    call :log "ERROR" "pom.xml no encontrado"
    exit /b 1
)

echo ✅ Archivo pom.xml encontrado
call :log "INFO" "pom.xml verificado"

call :show_success_banner "Todos los prerrequisitos verificados correctamente"
goto :eof

REM Compilar el proyecto
:compile_project
call :show_operation_banner "🔨 COMPILANDO PROYECTO" "Ejecutando Maven clean compile..."

cd /d "%ROOT_DIR%"

echo 📁 Directorio de trabajo: %ROOT_DIR%
echo 🔨 Iniciando compilación...

REM Limpiar compilaciones anteriores
mvn clean > "%ROOT_DIR%\logs\maven-clean.log" 2>&1
if !errorlevel! == 0 (
    echo ✅ Limpieza completada
    call :log "INFO" "Maven clean ejecutado exitosamente"
) else (
    call :show_error_banner "Error durante la limpieza del proyecto"
    call :log "ERROR" "Maven clean falló"
    echo 📄 Ver logs en: %ROOT_DIR%\logs\maven-clean.log
    exit /b 1
)

REM Compilar proyecto
mvn compile > "%ROOT_DIR%\logs\maven-compile.log" 2>&1
if !errorlevel! == 0 (
    echo ✅ Compilación completada
    call :log "INFO" "Maven compile ejecutado exitosamente"
    call :show_success_banner "Proyecto compilado correctamente"
) else (
    call :show_error_banner "Error durante la compilación del proyecto"
    call :log "ERROR" "Maven compile falló"
    echo 📄 Ver logs en: %ROOT_DIR%\logs\maven-compile.log
    echo.
    echo 🔍 Últimas líneas del error:
    powershell -command "Get-Content '%ROOT_DIR%\logs\maven-compile.log' | Select-Object -Last 10"
    exit /b 1
)
goto :eof

REM Iniciar el servicio
:start_service
call :show_operation_banner "🚀 INICIANDO COURSE SERVICE" "Ejecutando Spring Boot application..."

cd /d "%ROOT_DIR%"

REM Cargar variables de entorno si existe el archivo .env
if exist "%ROOT_DIR%\.env" (
    echo 📄 Cargando variables de entorno desde .env...
    for /f "usebackq tokens=1,2 delims==" %%a in ("%ROOT_DIR%\.env") do (
        if not "%%a"=="" if not "%%a:~0,1%"=="#" (
            set "%%a=%%b"
        )
    )
    call :log "INFO" "Variables de entorno cargadas desde .env"
)

echo 🚀 Iniciando Course Service en puerto %SERVICE_PORT%...
echo 📊 Health endpoint: %HEALTH_ENDPOINT%
echo ⏱️  Tiempo máximo de espera: %MAX_WAIT_TIME% segundos
echo.

REM Iniciar el servicio en background
start /b cmd /c "mvn spring-boot:run > "%ROOT_DIR%\logs\service.log" 2>&1"

REM Obtener PID aproximado (Windows no tiene una forma directa)
timeout /t 5 >nul

echo 🔄 Esperando que el servicio esté listo...

REM Esperar a que el servicio esté listo
set /a start_time=%time:~0,2%*3600+%time:~3,2%*60+%time:~6,2%
set ready=false

:wait_loop
set /a current_time=%time:~0,2%*3600+%time:~3,2%*60+%time:~6,2%
set /a elapsed_time=!current_time!-!start_time!

if !elapsed_time! geq %MAX_WAIT_TIME% goto timeout_reached

curl -s "%HEALTH_ENDPOINT%" >nul 2>&1
if !errorlevel! == 0 (
    set ready=true
    goto service_ready
)

echo|set /p="."
timeout /t 2 >nul
goto wait_loop

:timeout_reached
echo.
call :show_error_banner "Timeout: El servicio no respondió en %MAX_WAIT_TIME% segundos"
call :log "ERROR" "Timeout durante inicio del servicio"
echo 📄 Ver logs en: %ROOT_DIR%\logs\service.log
echo.
echo 🔍 Últimas líneas del log:
powershell -command "Get-Content '%ROOT_DIR%\logs\service.log' | Select-Object -Last 20"
exit /b 1

:service_ready
echo.
call :show_success_banner "Course Service iniciado correctamente en !elapsed_time! segundos"
call :log "INFO" "Servicio listo en !elapsed_time! segundos"

REM Mostrar información del servicio
call :get_port_pid %SERVICE_PORT%
if defined port_pid (
    call :show_service_status "🟢 ACTIVO" "%SERVICE_PORT%" "!port_pid!"
) else (
    call :show_service_status "🟢 ACTIVO" "%SERVICE_PORT%" "N/A"
)

echo.
call :show_urls

echo.
echo 📄 Logs en tiempo real: powershell -command "Get-Content '%ROOT_DIR%\logs\service.log' -Wait"
echo 🛑 Para detener: Ctrl+C en esta ventana
echo.

call :log "INFO" "Course Service completamente operativo"

REM Realizar test básico de health check
echo 🧪 Realizando test de health check...
curl -s "%HEALTH_ENDPOINT%" | findstr "UP" >nul 2>&1
if !errorlevel! == 0 (
    echo ✅ Health check: EXITOSO
    call :log "INFO" "Health check exitoso"
) else (
    echo ⚠️  Health check: ADVERTENCIA - Respuesta inesperada
    call :log "WARN" "Health check con respuesta inesperada"
)

goto :eof

REM Función principal
:main
call :show_edutech_banner
call :show_project_info

echo.
echo 🎯 Iniciando secuencia de arranque del Course Service...
echo.

call :stop_existing_service
echo.

call :check_prerequisites
echo.

call :compile_project
echo.

call :start_service

echo.
echo 🎉 ¡Course Service está listo para recibir solicitudes!
echo.

REM Mantener el script ejecutándose para mostrar logs
pause
goto :eof

REM Ejecutar función principal
call :main %*
