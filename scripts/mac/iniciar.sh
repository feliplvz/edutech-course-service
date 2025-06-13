#!/bin/bash
# =============================================================================
# EduTech - Script de Inicio (macOS/Linux) - Course Service
# =============================================================================
# Descripción: Inicio avanzado del Microservicio de Cursos EduTech
#              con verificaciones completas y monitoreo en tiempo real
# Autor: Equipo de Desarrollo EduTech
# Versión: 1.0.0
# Plataforma: macOS/Linux/Unix
# =============================================================================

set -euo pipefail

# Importar banner
readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly ROOT_DIR="$(dirname "$(dirname "$SCRIPT_DIR")")"

if [ -f "$ROOT_DIR/scripts/banner.sh" ]; then
    source "$ROOT_DIR/scripts/banner.sh"
fi

# Configuración
readonly SERVICE_NAME="Course Service"
readonly SERVICE_PORT="8082"
readonly HEALTH_ENDPOINT="http://localhost:${SERVICE_PORT}/actuator/health"
readonly MAX_WAIT_TIME=120
readonly LOG_FILE="${ROOT_DIR}/logs/inicio.log"
readonly PID_FILE="${ROOT_DIR}/logs/service.pid"

# Crear directorio de logs
mkdir -p "${ROOT_DIR}/logs"

# Función de logging
log() {
    local level="$1"
    shift
    local message="$*"
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] [$level] $message" | tee -a "${LOG_FILE}"
}

# Función para verificar si el puerto está en uso
check_port() {
    local port="$1"
    if lsof -Pi :$port -sTCP:LISTEN -t >/dev/null 2>&1; then
        return 0  # Puerto en uso
    else
        return 1  # Puerto libre
    fi
}

# Función para obtener PID del proceso en el puerto
get_port_pid() {
    local port="$1"
    lsof -ti:$port 2>/dev/null || echo ""
}

# Función para detener procesos existentes
stop_existing_service() {
    show_operation_banner "🛑 VERIFICANDO PROCESOS EXISTENTES" "Buscando instancias del servicio en ejecución..."
    
    if check_port "${SERVICE_PORT}"; then
        local existing_pid=$(get_port_pid "${SERVICE_PORT}")
        if [ -n "$existing_pid" ]; then
            log "WARN" "Proceso existente encontrado en puerto ${SERVICE_PORT} (PID: ${existing_pid})"
            echo "⚠️  Proceso existente detectado en puerto ${SERVICE_PORT}"
            echo "🔍 PID del proceso: ${existing_pid}"
            
            read -p "¿Desea detener el proceso existente? (y/n): " -n 1 -r
            echo
            
            if [[ $REPLY =~ ^[Yy]$ ]]; then
                echo "🛑 Deteniendo proceso existente..."
                kill -TERM "$existing_pid" 2>/dev/null || true
                sleep 3
                
                # Verificar si el proceso aún existe
                if kill -0 "$existing_pid" 2>/dev/null; then
                    echo "⚡ Forzando cierre del proceso..."
                    kill -KILL "$existing_pid" 2>/dev/null || true
                    sleep 2
                fi
                
                show_success_banner "Proceso anterior detenido correctamente"
                log "INFO" "Proceso anterior detenido (PID: ${existing_pid})"
            else
                show_error_banner "Operación cancelada por el usuario"
                log "WARN" "Usuario canceló detener proceso existente"
                exit 1
            fi
        fi
    else
        show_success_banner "Puerto ${SERVICE_PORT} disponible"
        log "INFO" "Puerto ${SERVICE_PORT} está disponible"
    fi
}

# Función para verificar prerrequisitos
check_prerequisites() {
    show_operation_banner "🔍 VERIFICANDO PRERREQUISITOS" "Validando entorno de desarrollo..."
    
    # Verificar Java
    if ! command -v java &> /dev/null; then
        show_error_banner "Java no está instalado"
        log "ERROR" "Java no encontrado en el sistema"
        exit 1
    fi
    
    local java_version=$(java -version 2>&1 | head -n 1 | cut -d'"' -f2 | cut -d'.' -f1)
    if [ "$java_version" -lt 17 ]; then
        show_error_banner "Se requiere Java 17 o superior. Versión actual: $java_version"
        log "ERROR" "Versión de Java insuficiente: $java_version"
        exit 1
    fi
    
    echo "✅ Java $java_version detectado"
    log "INFO" "Java $java_version verificado"
    
    # Verificar Maven
    if ! command -v mvn &> /dev/null; then
        show_error_banner "Maven no está instalado"
        log "ERROR" "Maven no encontrado en el sistema"
        exit 1
    fi
    
    local maven_version=$(mvn -version | head -n 1 | cut -d' ' -f3)
    echo "✅ Maven $maven_version detectado"
    log "INFO" "Maven $maven_version verificado"
    
    # Verificar archivo pom.xml
    if [ ! -f "${ROOT_DIR}/pom.xml" ]; then
        show_error_banner "Archivo pom.xml no encontrado en ${ROOT_DIR}"
        log "ERROR" "pom.xml no encontrado"
        exit 1
    fi
    
    echo "✅ Archivo pom.xml encontrado"
    log "INFO" "pom.xml verificado"
    
    show_success_banner "Todos los prerrequisitos verificados correctamente"
}

# Función para compilar el proyecto
compile_project() {
    show_operation_banner "🔨 COMPILANDO PROYECTO" "Ejecutando Maven clean compile..."
    
    cd "${ROOT_DIR}"
    
    echo "📁 Directorio de trabajo: ${ROOT_DIR}"
    echo "🔨 Iniciando compilación..."
    
    # Limpiar compilaciones anteriores
    if mvn clean > "${ROOT_DIR}/logs/maven-clean.log" 2>&1; then
        echo "✅ Limpieza completada"
        log "INFO" "Maven clean ejecutado exitosamente"
    else
        show_error_banner "Error durante la limpieza del proyecto"
        log "ERROR" "Maven clean falló"
        echo "📄 Ver logs en: ${ROOT_DIR}/logs/maven-clean.log"
        exit 1
    fi
    
    # Compilar proyecto
    if mvn compile > "${ROOT_DIR}/logs/maven-compile.log" 2>&1; then
        echo "✅ Compilación completada"
        log "INFO" "Maven compile ejecutado exitosamente"
        show_success_banner "Proyecto compilado correctamente"
    else
        show_error_banner "Error durante la compilación del proyecto"
        log "ERROR" "Maven compile falló"
        echo "📄 Ver logs en: ${ROOT_DIR}/logs/maven-compile.log"
        echo ""
        echo "🔍 Últimas líneas del error:"
        tail -10 "${ROOT_DIR}/logs/maven-compile.log"
        exit 1
    fi
}

# Función para iniciar el servicio
start_service() {
    show_operation_banner "🚀 INICIANDO COURSE SERVICE" "Ejecutando Spring Boot application..."
    
    cd "${ROOT_DIR}"
    
    # Cargar variables de entorno si existe el archivo .env
    if [ -f "${ROOT_DIR}/.env" ]; then
        echo "📄 Cargando variables de entorno desde .env..."
        export $(cat "${ROOT_DIR}/.env" | grep -v '^#' | xargs)
        log "INFO" "Variables de entorno cargadas desde .env"
    fi
    
    echo "🚀 Iniciando Course Service en puerto ${SERVICE_PORT}..."
    echo "📊 Health endpoint: ${HEALTH_ENDPOINT}"
    echo "⏱️  Tiempo máximo de espera: ${MAX_WAIT_TIME} segundos"
    echo ""
    
    # Iniciar el servicio en background y capturar PID
    nohup mvn spring-boot:run > "${ROOT_DIR}/logs/service.log" 2>&1 &
    local service_pid=$!
    
    # Guardar PID
    echo "$service_pid" > "${PID_FILE}"
    log "INFO" "Servicio iniciado con PID: $service_pid"
    
    echo "🔄 Esperando que el servicio esté listo..."
    echo "📋 PID del servicio: $service_pid"
    
    # Esperar a que el servicio esté listo
    local start_time=$(date +%s)
    local ready=false
    
    while [ $(($(date +%s) - start_time)) -lt $MAX_WAIT_TIME ]; do
        if curl -s "$HEALTH_ENDPOINT" >/dev/null 2>&1; then
            ready=true
            break
        fi
        
        # Verificar si el proceso sigue ejecutándose
        if ! kill -0 "$service_pid" 2>/dev/null; then
            show_error_banner "El proceso del servicio se detuvo inesperadamente"
            log "ERROR" "Proceso del servicio se detuvo (PID: $service_pid)"
            echo "📄 Ver logs en: ${ROOT_DIR}/logs/service.log"
            echo ""
            echo "🔍 Últimas líneas del log:"
            tail -20 "${ROOT_DIR}/logs/service.log"
            exit 1
        fi
        
        printf "."
        sleep 2
    done
    
    echo ""
    
    if [ "$ready" = true ]; then
        local elapsed_time=$(($(date +%s) - start_time))
        show_success_banner "Course Service iniciado correctamente en ${elapsed_time} segundos"
        log "INFO" "Servicio listo en ${elapsed_time} segundos"
        
        # Mostrar información del servicio
        show_service_status "🟢 ACTIVO" "$SERVICE_PORT" "$service_pid"
        
        echo ""
        show_urls
        
        echo ""
        echo "📄 Logs en tiempo real: tail -f ${ROOT_DIR}/logs/service.log"
        echo "🛑 Para detener: kill $service_pid"
        echo ""
        
        log "INFO" "Course Service completamente operativo"
        
        # Realizar test básico de health check
        echo "🧪 Realizando test de health check..."
        local health_response=$(curl -s "$HEALTH_ENDPOINT" 2>/dev/null || echo "ERROR")
        if [[ "$health_response" == *"UP"* ]]; then
            echo "✅ Health check: EXITOSO"
            log "INFO" "Health check exitoso"
        else
            echo "⚠️  Health check: ADVERTENCIA - Respuesta inesperada"
            log "WARN" "Health check con respuesta inesperada: $health_response"
        fi
        
    else
        show_error_banner "Timeout: El servicio no respondió en ${MAX_WAIT_TIME} segundos"
        log "ERROR" "Timeout durante inicio del servicio"
        
        # Intentar detener el proceso
        if kill -0 "$service_pid" 2>/dev/null; then
            echo "🛑 Deteniendo proceso por timeout..."
            kill -TERM "$service_pid" 2>/dev/null || true
            sleep 3
            kill -KILL "$service_pid" 2>/dev/null || true
        fi
        
        echo "📄 Ver logs en: ${ROOT_DIR}/logs/service.log"
        echo ""
        echo "🔍 Últimas líneas del log:"
        tail -20 "${ROOT_DIR}/logs/service.log"
        exit 1
    fi
}

# Función principal
main() {
    # Mostrar banner
    show_edutech_banner
    show_project_info
    
    echo ""
    echo "🎯 Iniciando secuencia de arranque del Course Service..."
    echo ""
    
    # Ejecutar pasos
    stop_existing_service
    echo ""
    
    check_prerequisites
    echo ""
    
    compile_project
    echo ""
    
    start_service
    
    echo ""
    echo "🎉 ¡Course Service está listo para recibir solicitudes!"
    echo ""
    
    # Mantener el script ejecutándose para mostrar logs
    read -p "Presiona Enter para ver logs en tiempo real (Ctrl+C para salir)..."
    tail -f "${ROOT_DIR}/logs/service.log"
}

# Manejar señales para cleanup
cleanup() {
    echo ""
    echo "🛑 Señal de interrupción recibida..."
    if [ -f "${PID_FILE}" ]; then
        local pid=$(cat "${PID_FILE}")
        if kill -0 "$pid" 2>/dev/null; then
            echo "🛑 Deteniendo Course Service (PID: $pid)..."
            kill -TERM "$pid" 2>/dev/null || true
            sleep 3
            kill -KILL "$pid" 2>/dev/null || true
        fi
        rm -f "${PID_FILE}"
    fi
    echo "✅ Cleanup completado"
    exit 0
}

trap cleanup SIGINT SIGTERM

# Ejecutar función principal
main "$@"
