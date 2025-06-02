@echo off
REM 🚀 EduTech Course Service - Script de Inicio para Windows
REM Autor: Felipe López
REM Fecha: Junio 2025

echo 🚀 ===============================================
echo    EduTech Course Service - Microservicio
echo    Spring Boot 3.5.0 + PostgreSQL Railway
echo ===============================================
echo.

REM 🎯 Verificar Java
echo 🔍 Verificando Java...
java -version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Error: Java no está instalado
    echo 📥 Instalar Java 17+: https://adoptium.net/
    pause
    exit /b 1
)

for /f tokens^=3 %%g in ('java -version 2^>^&1 ^| findstr /i version') do (
    set JAVA_VERSION=%%g
)
set JAVA_VERSION=%JAVA_VERSION:"=%
for /f "delims=." %%a in ("%JAVA_VERSION%") do set JAVA_MAJOR=%%a
if %JAVA_MAJOR% lss 17 (
    echo ❌ Error: Se requiere Java 17+. Versión actual: %JAVA_VERSION%
    pause
    exit /b 1
)
echo ✅ Java %JAVA_VERSION% detectado

REM 🔍 Verificar Maven
echo 🔍 Verificando Maven...
mvn -version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Error: Maven no está instalado
    echo 📥 Instalar Maven: https://maven.apache.org/install.html
    pause
    exit /b 1
)
echo ✅ Maven detectado

REM 🛠️ Compilar el proyecto
echo.
echo 🛠️ Compilando el proyecto...
mvn clean compile -q
if %errorlevel% neq 0 (
    echo ❌ Error en la compilación
    pause
    exit /b 1
)
echo ✅ Compilación exitosa

REM 🗄️ Verificar variables de entorno
echo.
echo 🗄️ Verificando configuración de base de datos...
if exist ".env" (
    echo ✅ Archivo .env encontrado - Configuración personalizada
    echo 💡 Asegúrate de que las credenciales de Railway estén correctas
) else (
    echo ⚠️  Archivo .env no encontrado - Usando configuración por defecto
    echo 💡 Para Railway: copia .env.example a .env y edita las credenciales
)

REM 🚀 Ejecutar el servicio
echo.
echo 🚀 Iniciando EduTech Course Service...
echo 📍 URL: http://localhost:8082
echo 🏥 Health: http://localhost:8082/health
echo 📚 API: http://localhost:8082/api/courses
echo.
echo 💡 Presiona Ctrl+C para detener el servicio
echo.

REM Ejecutar Spring Boot
mvn spring-boot:run

echo.
echo 🛑 Servicio detenido
pause
