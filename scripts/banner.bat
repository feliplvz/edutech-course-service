@echo off
REM =============================================================================
REM EduTech Banner - Banner profesional para Course Service (Windows)
REM =============================================================================

REM Colores (usando caracteres ANSI)
set "BOLD="
set "NC="
set "RED="
set "GREEN="
set "YELLOW="
set "BLUE="
set "PURPLE="
set "CYAN="
set "WHITE="

REM Función para mostrar banner principal
:show_edutech_banner
cls
echo.
echo ╔═══════════════════════════════════════════════════════════════════════════════╗
echo ║                                                                               ║
echo ║   ███████╗██████╗ ██╗   ██╗████████╗███████╗ ██████╗██╗  ██╗                 ║
echo ║   ██╔════╝██╔══██╗██║   ██║╚══██╔══╝██╔════╝██╔════╝██║  ██║                 ║
echo ║   █████╗  ██║  ██║██║   ██║   ██║   █████╗  ██║     ███████║                 ║
echo ║   ██╔══╝  ██║  ██║██║   ██║   ██║   ██╔══╝  ██║     ██╔══██║                 ║
echo ║   ███████╗██████╔╝╚██████╔╝   ██║   ███████╗╚██████╗██║  ██║                 ║
echo ║   ╚══════╝╚═════╝  ╚═════╝    ╚═╝   ╚══════╝ ╚═════╝╚═╝  ╚═╝                 ║
echo ║                                                                               ║
echo ║                📚 MICROSERVICIO DE CURSOS Y CONTENIDO 📚                     ║
echo ║                     💡 Course Service - v1.0.0 💡                           ║
echo ║                                                                               ║
echo ╚═══════════════════════════════════════════════════════════════════════════════╝
echo.
goto :eof

REM Función para mostrar banner de operación
:show_operation_banner
echo.
echo ╔══════════════════════════════════════════════════════════════════════════════════╗
echo ║ %~1 ║
echo ╠══════════════════════════════════════════════════════════════════════════════════╣
echo ║ %~2 ║
echo ╚══════════════════════════════════════════════════════════════════════════════════╝
echo.
goto :eof

REM Función para mostrar banner de éxito
:show_success_banner
echo.
echo ╔══════════════════════════════════════════════════════════════════════════════════╗
echo ║ ✅ %~1 ║
echo ╚══════════════════════════════════════════════════════════════════════════════════╝
echo.
goto :eof

REM Función para mostrar banner de error
:show_error_banner
echo.
echo ╔══════════════════════════════════════════════════════════════════════════════════╗
echo ║ ❌ %~1 ║
echo ╚══════════════════════════════════════════════════════════════════════════════════╝
echo.
goto :eof

REM Función para mostrar banner de advertencia
:show_warning_banner
echo.
echo ╔══════════════════════════════════════════════════════════════════════════════════╗
echo ║ ⚠️ %~1 ║
echo ╚══════════════════════════════════════════════════════════════════════════════════╝
echo.
goto :eof

REM Función para mostrar banner de información
:show_info_banner
echo.
echo ╔══════════════════════════════════════════════════════════════════════════════════╗
echo ║ ℹ️ %~1 ║
echo ╚══════════════════════════════════════════════════════════════════════════════════╝
echo.
goto :eof

REM Función para mostrar estado del servicio
:show_service_status
echo ╔═══════════════════════════════════════════════════════════════════════════════════╗
echo ║ 📊 ESTADO DEL COURSE SERVICE ║
echo ╠═══════════════════════════════════════════════════════════════════════════════════╣
echo ║ Estado: %~1 ║
echo ║ Puerto: %~2 ║
echo ║ PID: %~3 ║
echo ║ Fecha: %date% %time% ║
echo ╚═══════════════════════════════════════════════════════════════════════════════════╝
goto :eof

REM Función para mostrar información del proyecto
:show_project_info
echo ╔═══════════════════════════════════════════════════════════════════════════════════╗
echo ║ 📋 INFORMACIÓN DEL PROYECTO ║
echo ╠═══════════════════════════════════════════════════════════════════════════════════╣
echo ║ Proyecto: EduTech Course Service ║
echo ║ Versión: 1.0.0-SNAPSHOT ║
echo ║ Puerto: 8082 ║
echo ║ Framework: Spring Boot 3.5.0 ║
echo ║ Java: 17+ ║
echo ║ Base de datos: PostgreSQL ║
echo ║ Health Check: http://localhost:8082/actuator/health ║
echo ║ API Base: http://localhost:8082/api ║
echo ╚═══════════════════════════════════════════════════════════════════════════════════╝
goto :eof

REM Función para mostrar URLs útiles
:show_urls
echo ╔═══════════════════════════════════════════════════════════════════════════════════╗
echo ║ 🌐 URLS DE ACCESO ║
echo ╠═══════════════════════════════════════════════════════════════════════════════════╣
echo ║ Health Check: http://localhost:8082/actuator/health ║
echo ║ Categorías: http://localhost:8082/api/categories ║
echo ║ Cursos: http://localhost:8082/api/courses ║
echo ║ Cursos Premium: http://localhost:8082/api/courses/premium ║
echo ║ Cursos Destacados: http://localhost:8082/api/courses/featured ║
echo ╚═══════════════════════════════════════════════════════════════════════════════════╝
goto :eof
