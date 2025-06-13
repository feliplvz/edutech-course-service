#!/bin/bash
# =============================================================================
# EduTech - Script de Verificación de Estado (macOS/Linux) - Course Service
# =============================================================================
# Descripción: Verifica el estado completo del Course Service
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
readonly HEALTH_ENDPOINT="http://localhost:${SERVICE_PORT}/actuator/health"
readonly API_BASE="http://localhost:${SERVICE_PORT}/api"

# Función para verificar estado del servicio
check_service_status() {
    show_operation_banner "📊 VERIFICACIÓN DE ESTADO" "Analizando Course Service..."
    
    local status="🔴 INACTIVO"
    local pid=""
    local health_status="❌ NO DISPONIBLE"
    
    # Verificar si el puerto está en uso
    if lsof -Pi :$SERVICE_PORT -sTCP:LISTEN -t >/dev/null 2>&1; then
        status="🟢 ACTIVO"
        pid=$(lsof -ti:$SERVICE_PORT 2>/dev/null || echo "N/A")
        
        # Verificar health endpoint
        if curl -s "$HEALTH_ENDPOINT" >/dev/null 2>&1; then
            local response=$(curl -s "$HEALTH_ENDPOINT" 2>/dev/null || echo "")
            if [[ "$response" == *"UP"* ]]; then
                health_status="✅ SALUDABLE"
            else
                health_status="⚠️ RESPONDIENDO"
            fi
        fi
    fi
    
    # Mostrar estado
    show_service_status "$status" "$SERVICE_PORT" "$pid"
    
    echo ""
    echo "🏥 Health Check: $health_status"
    
    if [[ "$status" == "🟢 ACTIVO" ]]; then
        echo "🌐 Health URL: $HEALTH_ENDPOINT"
        echo "📚 API Base: $API_BASE"
        
        # Verificar endpoints específicos
        echo ""
        echo "🔍 Verificando endpoints principales:"
        
        # Categorías
        if curl -s "${API_BASE}/categories" >/dev/null 2>&1; then
            echo "   ✅ /api/categories"
        else
            echo "   ❌ /api/categories"
        fi
        
        # Cursos
        if curl -s "${API_BASE}/courses" >/dev/null 2>&1; then
            echo "   ✅ /api/courses"
        else
            echo "   ❌ /api/courses"
        fi
        
        # Cursos premium
        if curl -s "${API_BASE}/courses/premium" >/dev/null 2>&1; then
            echo "   ✅ /api/courses/premium"
        else
            echo "   ❌ /api/courses/premium"
        fi
        
        # Cursos destacados
        if curl -s "${API_BASE}/courses/featured" >/dev/null 2>&1; then
            echo "   ✅ /api/courses/featured"
        else
            echo "   ❌ /api/courses/featured"
        fi
    fi
    
    echo ""
    
    # Verificar archivos de log
    echo "📄 Estado de logs:"
    local log_dir="$ROOT_DIR/logs"
    if [ -d "$log_dir" ]; then
        if [ -f "$log_dir/service.log" ]; then
            local log_size=$(du -h "$log_dir/service.log" | cut -f1)
            echo "   📄 service.log: $log_size"
        else
            echo "   📄 service.log: No encontrado"
        fi
        
        if [ -f "$log_dir/service.pid" ]; then
            local stored_pid=$(cat "$log_dir/service.pid" 2>/dev/null || echo "N/A")
            echo "   🔍 PID almacenado: $stored_pid"
        else
            echo "   🔍 PID almacenado: No encontrado"
        fi
    else
        echo "   📁 Directorio de logs: No encontrado"
    fi
    
    # Verificar memoria y CPU (si el proceso está activo)
    if [[ "$pid" != "N/A" && -n "$pid" ]]; then
        echo ""
        echo "💻 Recursos del proceso:"
        if command -v ps &> /dev/null; then
            local cpu_mem=$(ps -p "$pid" -o %cpu,%mem --no-headers 2>/dev/null || echo "N/A N/A")
            echo "   🔥 CPU: $(echo $cpu_mem | cut -d' ' -f1)%"
            echo "   💾 Memoria: $(echo $cpu_mem | cut -d' ' -f2)%"
        fi
    fi
    
    echo ""
    
    if [[ "$status" == "🟢 ACTIVO" && "$health_status" == "✅ SALUDABLE" ]]; then
        show_success_banner "Course Service está operativo y saludable"
    elif [[ "$status" == "🟢 ACTIVO" ]]; then
        show_warning_banner "Course Service está activo pero con problemas de salud"
    else
        show_error_banner "Course Service no está ejecutándose"
    fi
}

# Función principal
main() {
    show_edutech_banner
    check_service_status
    
    echo ""
    echo "🔄 Para monitoreo continuo: watch -n 5 '$0'"
    echo "📄 Para ver logs: tail -f $ROOT_DIR/logs/service.log"
    echo ""
}

# Ejecutar función principal
main "$@"
