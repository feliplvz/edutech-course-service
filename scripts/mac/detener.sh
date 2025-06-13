#!/bin/bash
# =============================================================================
# EduTech - Script de Detención (macOS/Linux) - Course Service
# =============================================================================
# Descripción: Detiene de forma segura el Course Service
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
readonly SERVICE_PORT="8082"
readonly PID_FILE="$ROOT_DIR/logs/service.pid"
readonly LOG_FILE="$ROOT_DIR/logs/detener.log"

# Crear directorio de logs
mkdir -p "$ROOT_DIR/logs"

# Función de logging
log() {
    local level="$1"
    shift
    local message="$*"
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] [$level] $message" | tee -a "${LOG_FILE}"
}

# Función para detener el servicio
stop_service() {
    show_operation_banner "🛑 DETENIENDO COURSE SERVICE" "Parando el microservicio de forma segura..."
    
    local stopped=false
    
    # Método 1: Usar PID almacenado
    if [ -f "$PID_FILE" ]; then
        local stored_pid=$(cat "$PID_FILE" 2>/dev/null || echo "")
        if [ -n "$stored_pid" ]; then
            if kill -0 "$stored_pid" 2>/dev/null; then
                echo "🔍 Encontrado proceso almacenado (PID: $stored_pid)"
                log "INFO" "Deteniendo proceso almacenado: $stored_pid"
                
                echo "🛑 Enviando señal SIGTERM..."
                if kill -TERM "$stored_pid" 2>/dev/null; then
                    echo "⏱️  Esperando cierre graceful (10 segundos)..."
                    sleep 10
                    
                    if ! kill -0 "$stored_pid" 2>/dev/null; then
                        echo "✅ Proceso detenido correctamente"
                        stopped=true
                        log "INFO" "Proceso detenido exitosamente: $stored_pid"
                    else
                        echo "⚡ Forzando cierre con SIGKILL..."
                        kill -KILL "$stored_pid" 2>/dev/null || true
                        sleep 2
                        
                        if ! kill -0 "$stored_pid" 2>/dev/null; then
                            echo "✅ Proceso forzado a detenerse"
                            stopped=true
                            log "WARN" "Proceso forzado a detenerse: $stored_pid"
                        else
                            echo "❌ No se pudo detener el proceso"
                            log "ERROR" "Fallo al detener proceso: $stored_pid"
                        fi
                    fi
                else
                    echo "❌ Error al enviar señal al proceso"
                    log "ERROR" "Error enviando señal a proceso: $stored_pid"
                fi
            else
                echo "⚠️  El PID almacenado no corresponde a un proceso activo"
                log "WARN" "PID almacenado inválido: $stored_pid"
            fi
        fi
        
        # Limpiar archivo PID
        rm -f "$PID_FILE"
    else
        echo "ℹ️  No se encontró archivo PID almacenado"
        log "INFO" "Archivo PID no encontrado"
    fi
    
    # Método 2: Buscar por puerto
    if [ "$stopped" = false ]; then
        echo ""
        echo "🔍 Buscando procesos en puerto $SERVICE_PORT..."
        
        local port_pids=$(lsof -ti:$SERVICE_PORT 2>/dev/null || echo "")
        if [ -n "$port_pids" ]; then
            echo "📋 Procesos encontrados en puerto $SERVICE_PORT:"
            for pid in $port_pids; do
                if kill -0 "$pid" 2>/dev/null; then
                    local process_info=$(ps -p "$pid" -o pid,comm,args --no-headers 2>/dev/null || echo "$pid unknown unknown")
                    echo "   🔍 PID $pid: $process_info"
                    
                    echo "🛑 Deteniendo proceso $pid..."
                    log "INFO" "Deteniendo proceso en puerto: $pid"
                    
                    if kill -TERM "$pid" 2>/dev/null; then
                        echo "⏱️  Esperando cierre graceful..."
                        sleep 5
                        
                        if ! kill -0 "$pid" 2>/dev/null; then
                            echo "✅ Proceso $pid detenido"
                            stopped=true
                            log "INFO" "Proceso detenido exitosamente: $pid"
                        else
                            echo "⚡ Forzando cierre del proceso $pid..."
                            kill -KILL "$pid" 2>/dev/null || true
                            sleep 2
                            
                            if ! kill -0 "$pid" 2>/dev/null; then
                                echo "✅ Proceso $pid forzado a detenerse"
                                stopped=true
                                log "WARN" "Proceso forzado a detenerse: $pid"
                            else
                                echo "❌ No se pudo detener el proceso $pid"
                                log "ERROR" "Fallo al detener proceso: $pid"
                            fi
                        fi
                    else
                        echo "❌ Error al detener proceso $pid"
                        log "ERROR" "Error deteniendo proceso: $pid"
                    fi
                fi
            done
        else
            echo "ℹ️  No se encontraron procesos en puerto $SERVICE_PORT"
            log "INFO" "No hay procesos en puerto $SERVICE_PORT"
            stopped=true
        fi
    fi
    
    # Método 3: Buscar procesos Java específicos
    if [ "$stopped" = false ]; then
        echo ""
        echo "🔍 Buscando procesos Java del Course Service..."
        
        local java_pids=$(pgrep -f "course-service\|CourseServiceApplication" 2>/dev/null || echo "")
        if [ -n "$java_pids" ]; then
            echo "📋 Procesos Java relacionados encontrados:"
            for pid in $java_pids; do
                if kill -0 "$pid" 2>/dev/null; then
                    local process_info=$(ps -p "$pid" -o pid,comm,args --no-headers 2>/dev/null || echo "$pid java unknown")
                    echo "   🔍 PID $pid: $(echo "$process_info" | cut -c1-80)..."
                    
                    echo "🛑 Deteniendo proceso Java $pid..."
                    log "INFO" "Deteniendo proceso Java: $pid"
                    
                    if kill -TERM "$pid" 2>/dev/null; then
                        echo "⏱️  Esperando cierre graceful..."
                        sleep 8
                        
                        if ! kill -0 "$pid" 2>/dev/null; then
                            echo "✅ Proceso Java $pid detenido"
                            stopped=true
                            log "INFO" "Proceso Java detenido exitosamente: $pid"
                        else
                            echo "⚡ Forzando cierre del proceso Java $pid..."
                            kill -KILL "$pid" 2>/dev/null || true
                            sleep 2
                            
                            if ! kill -0 "$pid" 2>/dev/null; then
                                echo "✅ Proceso Java $pid forzado a detenerse"
                                stopped=true
                                log "WARN" "Proceso Java forzado a detenerse: $pid"
                            else
                                echo "❌ No se pudo detener el proceso Java $pid"
                                log "ERROR" "Fallo al detener proceso Java: $pid"
                            fi
                        fi
                    else
                        echo "❌ Error al detener proceso Java $pid"
                        log "ERROR" "Error deteniendo proceso Java: $pid"
                    fi
                fi
            done
        else
            echo "ℹ️  No se encontraron procesos Java específicos"
            log "INFO" "No hay procesos Java específicos"
        fi
    fi
    
    echo ""
    
    # Verificación final
    echo "🔍 Verificación final..."
    if lsof -Pi :$SERVICE_PORT -sTCP:LISTEN -t >/dev/null 2>&1; then
        show_warning_banner "Advertencia: Aún hay procesos en puerto $SERVICE_PORT"
        echo "🔍 Procesos restantes:"
        lsof -Pi :$SERVICE_PORT -sTCP:LISTEN 2>/dev/null || true
        log "WARN" "Procesos restantes en puerto $SERVICE_PORT"
    else
        show_success_banner "Course Service detenido completamente"
        echo "✅ Puerto $SERVICE_PORT liberado"
        echo "🧹 Archivos temporales limpiados"
        log "INFO" "Course Service detenido exitosamente"
    fi
    
    # Limpiar archivos temporales
    rm -f "$ROOT_DIR/logs/service.pid" 2>/dev/null || true
    
    echo ""
    echo "📄 Log de detención guardado en: $LOG_FILE"
    echo "🔍 Para verificar estado: ./scripts/mac/verificar-estado.sh"
}

# Función principal
main() {
    show_edutech_banner
    show_operation_banner "🎯 DETENCIÓN DEL SERVICIO" "Preparando detención segura del Course Service"
    
    echo "⚠️  Esta acción detendrá el Course Service completamente"
    echo ""
    
    read -p "¿Está seguro de que desea continuar? (y/n): " -n 1 -r
    echo ""
    
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo ""
        stop_service
    else
        show_info_banner "Operación cancelada por el usuario"
        log "INFO" "Detención cancelada por el usuario"
        echo ""
    fi
    
    echo "🔄 Para reiniciar: ./scripts/mac/iniciar.sh"
    echo ""
}

# Manejar señales
cleanup() {
    echo ""
    echo "🛑 Script interrumpido"
    exit 1
}

trap cleanup SIGINT SIGTERM

# Ejecutar función principal
main "$@"
