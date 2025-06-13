#!/bin/bash
# =============================================================================
# EduTech - Script Master de Control (macOS/Linux) - Course Service
# =============================================================================
# Descripción: Script empresarial para gestionar el ciclo completo de desarrollo
#              del Microservicio de Cursos EduTech
# Autor: Equipo de Desarrollo EduTech
# Versión: 1.0.0
# Plataforma: macOS/Linux/Unix
# =============================================================================

set -euo pipefail

# Configuración
readonly SCRIPT_NAME="$(basename "$0")"
readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly ROOT_DIR="$(dirname "$(dirname "$SCRIPT_DIR")")"
readonly VERSION="1.0.0"

# Importar banner
if [ -f "$ROOT_DIR/scripts/banner.sh" ]; then
    source "$ROOT_DIR/scripts/banner.sh"
fi

# Funciones de utilidad
log() {
    local level="$1"
    shift
    local message="$*"
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] [$level] $message" | tee -a "$ROOT_DIR/logs/controlador.log"
}

print_separator() {
    echo -e "${CYAN}${BOLD}══════════════════════════════════════════════════════════════════════════════════${NC}"
}

# Función para mostrar el menú principal
show_main_menu() {
    show_edutech_banner
    show_operation_banner "🎮 CONTROLADOR MAESTRO COURSE SERVICE" "Centro de comando unificado v${VERSION}"
    
    echo -e "${WHITE}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${WHITE}${BOLD}║${NC} ${YELLOW}${BOLD}🔧 CONFIGURACIÓN${NC} ${WHITE}${BOLD}║${NC}"
    echo -e "${WHITE}${BOLD}╠═══════════════════════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${WHITE}${BOLD}║${NC} ${GREEN} 1)${NC} configurar      - 🛠️  Configurar entorno de desarrollo        ${WHITE}${BOLD}║${NC}"
    echo -e "${WHITE}${BOLD}║${NC} ${GREEN} 2)${NC} variables       - ⚙️  Gestionar variables de entorno            ${WHITE}${BOLD}║${NC}"
    echo -e "${WHITE}${BOLD}║${NC}                                                                          ${WHITE}${BOLD}║${NC}"
    echo -e "${WHITE}${BOLD}║${NC} ${YELLOW}${BOLD}🚀 CICLO DE VIDA${NC} ${WHITE}${BOLD}║${NC}"
    echo -e "${WHITE}${BOLD}╠═══════════════════════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${WHITE}${BOLD}║${NC} ${GREEN} 3)${NC} iniciar         - 🚀 Iniciar el microservicio                  ${WHITE}${BOLD}║${NC}"
    echo -e "${WHITE}${BOLD}║${NC} ${GREEN} 4)${NC} detener         - 🛑 Detener el microservicio                  ${WHITE}${BOLD}║${NC}"
    echo -e "${WHITE}${BOLD}║${NC} ${GREEN} 5)${NC} reiniciar       - 🔄 Reiniciar el microservicio               ${WHITE}${BOLD}║${NC}"
    echo -e "${WHITE}${BOLD}║${NC} ${GREEN} 6)${NC} estado          - 📊 Verificar estado del servicio            ${WHITE}${BOLD}║${NC}"
    echo -e "${WHITE}${BOLD}║${NC}                                                                          ${WHITE}${BOLD}║${NC}"
    echo -e "${WHITE}${BOLD}║${NC} ${YELLOW}${BOLD}🛠️ DESARROLLO${NC} ${WHITE}${BOLD}║${NC}"
    echo -e "${WHITE}${BOLD}╠═══════════════════════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${WHITE}${BOLD}║${NC} ${GREEN} 7)${NC} compilar        - 🔨 Compilar proyecto                        ${WHITE}${BOLD}║${NC}"
    echo -e "${WHITE}${BOLD}║${NC} ${GREEN} 8)${NC} limpiar         - 🧹 Limpiar archivos temporales             ${WHITE}${BOLD}║${NC}"
    echo -e "${WHITE}${BOLD}║${NC} ${GREEN} 9)${NC} logs            - 📄 Ver logs en tiempo real                  ${WHITE}${BOLD}║${NC}"
    echo -e "${WHITE}${BOLD}║${NC} ${GREEN}10)${NC} test            - 🧪 Ejecutar pruebas                         ${WHITE}${BOLD}║${NC}"
    echo -e "${WHITE}${BOLD}║${NC}                                                                          ${WHITE}${BOLD}║${NC}"
    echo -e "${WHITE}${BOLD}║${NC} ${YELLOW}${BOLD}📊 INFORMACIÓN${NC} ${WHITE}${BOLD}║${NC}"
    echo -e "${WHITE}${BOLD}╠═══════════════════════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${WHITE}${BOLD}║${NC} ${GREEN}11)${NC} info            - ℹ️  Información del proyecto                 ${WHITE}${BOLD}║${NC}"
    echo -e "${WHITE}${BOLD}║${NC} ${GREEN}12)${NC} urls            - 🌐 Mostrar URLs de acceso                   ${WHITE}${BOLD}║${NC}"
    echo -e "${WHITE}${BOLD}║${NC} ${GREEN}13)${NC} health          - 🏥 Health check completo                    ${WHITE}${BOLD}║${NC}"
    echo -e "${WHITE}${BOLD}║${NC}                                                                          ${WHITE}${BOLD}║${NC}"
    echo -e "${WHITE}${BOLD}║${NC} ${RED} 0)${NC} salir           - 👋 Salir del controlador                    ${WHITE}${BOLD}║${NC}"
    echo -e "${WHITE}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════════╝${NC}"
    echo ""
}

# Función para configurar entorno
configure_environment() {
    show_operation_banner "🛠️ CONFIGURACIÓN DEL ENTORNO" "Configurando entorno de desarrollo..."
    
    # Crear estructura de directorios
    mkdir -p "$ROOT_DIR/logs"
    mkdir -p "$ROOT_DIR/target"
    
    # Verificar prerrequisitos
    echo "🔍 Verificando prerrequisitos..."
    
    if ! command -v java &> /dev/null; then
        show_error_banner "Java no está instalado"
        return 1
    fi
    
    if ! command -v mvn &> /dev/null; then
        show_error_banner "Maven no está instalado"
        return 1
    fi
    
    # Crear archivo .env si no existe
    if [ ! -f "$ROOT_DIR/.env" ]; then
        echo "📄 Creando archivo .env..."
        cat > "$ROOT_DIR/.env" << EOF
# EduTech Course Service - Variables de Entorno
SPRING_PROFILES_ACTIVE=development
SERVER_PORT=8082
SPRING_APPLICATION_NAME=course-service

# Base de datos
SPRING_DATASOURCE_URL=jdbc:postgresql://yamabiko.proxy.rlwy.net:41638/railway
SPRING_DATASOURCE_USERNAME=postgres
SPRING_DATASOURCE_PASSWORD=pcOCwrpYzhldbzeCbSIQiADPtLoseYsC

# JPA Configuration
SPRING_JPA_HIBERNATE_DDL_AUTO=update
SPRING_JPA_SHOW_SQL=false
SPRING_JPA_PROPERTIES_HIBERNATE_DIALECT=org.hibernate.dialect.PostgreSQLDialect

# Logging
LOGGING_LEVEL_COM_EDUTECH=INFO
LOGGING_LEVEL_ORG_SPRINGFRAMEWORK=WARN
EOF
        echo "✅ Archivo .env creado"
    fi
    
    show_success_banner "Entorno configurado correctamente"
}

# Función para gestionar variables de entorno
manage_environment_variables() {
    show_operation_banner "⚙️ GESTIÓN DE VARIABLES" "Variables de entorno del proyecto"
    
    if [ -f "$ROOT_DIR/.env" ]; then
        echo "📄 Variables actuales en .env:"
        echo ""
        cat "$ROOT_DIR/.env" | grep -v '^#' | grep -v '^$'
        echo ""
        
        read -p "¿Desea editar el archivo .env? (y/n): " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            ${EDITOR:-nano} "$ROOT_DIR/.env"
            show_success_banner "Variables actualizadas"
        fi
    else
        show_warning_banner "Archivo .env no encontrado. Ejecute 'configurar' primero."
    fi
}

# Función para iniciar servicio
start_service() {
    show_operation_banner "🚀 INICIANDO SERVICIO" "Ejecutando script de inicio..."
    
    if [ -f "$SCRIPT_DIR/iniciar.sh" ]; then
        chmod +x "$SCRIPT_DIR/iniciar.sh"
        "$SCRIPT_DIR/iniciar.sh"
    else
        show_error_banner "Script de inicio no encontrado"
    fi
}

# Función para detener servicio
stop_service() {
    show_operation_banner "🛑 DETENIENDO SERVICIO" "Parando Course Service..."
    
    local pid_file="$ROOT_DIR/logs/service.pid"
    
    if [ -f "$pid_file" ]; then
        local pid=$(cat "$pid_file")
        if kill -0 "$pid" 2>/dev/null; then
            echo "🛑 Deteniendo servicio (PID: $pid)..."
            kill -TERM "$pid" 2>/dev/null || true
            sleep 3
            
            if kill -0 "$pid" 2>/dev/null; then
                echo "⚡ Forzando cierre..."
                kill -KILL "$pid" 2>/dev/null || true
            fi
            
            rm -f "$pid_file"
            show_success_banner "Servicio detenido correctamente"
        else
            show_warning_banner "El proceso no está ejecutándose"
            rm -f "$pid_file"
        fi
    else
        # Buscar proceso por puerto
        local port_pid=$(lsof -ti:8082 2>/dev/null || echo "")
        if [ -n "$port_pid" ]; then
            echo "🔍 Encontrado proceso en puerto 8082 (PID: $port_pid)"
            kill -TERM "$port_pid" 2>/dev/null || true
            sleep 3
            kill -KILL "$port_pid" 2>/dev/null || true
            show_success_banner "Proceso detenido"
        else
            show_info_banner "No hay procesos ejecutándose en puerto 8082"
        fi
    fi
}

# Función para reiniciar servicio
restart_service() {
    show_operation_banner "🔄 REINICIANDO SERVICIO" "Deteniendo y reiniciando..."
    
    stop_service
    sleep 2
    start_service
}

# Función para verificar estado
check_status() {
    show_operation_banner "📊 VERIFICANDO ESTADO" "Estado actual del Course Service"
    
    local health_url="http://localhost:8082/actuator/health"
    
    echo "🔍 Verificando servicio en puerto 8082..."
    
    if curl -s "$health_url" >/dev/null 2>&1; then
        local response=$(curl -s "$health_url")
        if [[ "$response" == *"UP"* ]]; then
            show_success_banner "Servicio ACTIVO y saludable"
            echo "✅ Health Check: EXITOSO"
            echo "🌐 URL: $health_url"
            
            # Mostrar PID si está disponible
            local pid_file="$ROOT_DIR/logs/service.pid"
            if [ -f "$pid_file" ]; then
                local pid=$(cat "$pid_file")
                echo "🔍 PID: $pid"
            fi
        else
            show_warning_banner "Servicio responde pero estado desconocido"
            echo "📄 Respuesta: $response"
        fi
    else
        show_error_banner "Servicio NO disponible"
        echo "❌ No se puede conectar a $health_url"
    fi
}

# Función para compilar proyecto
compile_project() {
    show_operation_banner "🔨 COMPILANDO PROYECTO" "Maven clean compile..."
    
    cd "$ROOT_DIR"
    
    if mvn clean compile; then
        show_success_banner "Compilación exitosa"
    else
        show_error_banner "Error en compilación"
    fi
}

# Función para limpiar proyecto
clean_project() {
    show_operation_banner "🧹 LIMPIANDO PROYECTO" "Eliminando archivos temporales..."
    
    cd "$ROOT_DIR"
    
    echo "🗑️ Limpiando target/..."
    rm -rf target/
    
    echo "🗑️ Limpiando logs antiguos..."
    find logs/ -name "*.log" -mtime +7 -delete 2>/dev/null || true
    
    echo "🗑️ Ejecutando Maven clean..."
    mvn clean >/dev/null 2>&1 || true
    
    show_success_banner "Proyecto limpiado"
}

# Función para mostrar logs
show_logs() {
    show_operation_banner "📄 LOGS EN TIEMPO REAL" "Monitoreando logs del servicio"
    
    local log_file="$ROOT_DIR/logs/service.log"
    
    if [ -f "$log_file" ]; then
        echo "📄 Mostrando logs de: $log_file"
        echo "🛑 Presiona Ctrl+C para salir"
        echo ""
        tail -f "$log_file"
    else
        show_warning_banner "Archivo de log no encontrado"
        echo "📁 Busque logs en: $ROOT_DIR/logs/"
    fi
}

# Función para ejecutar tests
run_tests() {
    show_operation_banner "🧪 EJECUTANDO PRUEBAS" "Maven test..."
    
    cd "$ROOT_DIR"
    
    if mvn test; then
        show_success_banner "Todas las pruebas pasaron"
    else
        show_error_banner "Algunas pruebas fallaron"
    fi
}

# Función para mostrar información
show_info() {
    show_project_info
}

# Función para mostrar URLs
show_service_urls() {
    show_urls
}

# Función para health check completo
health_check() {
    show_operation_banner "🏥 HEALTH CHECK COMPLETO" "Verificación exhaustiva del servicio"
    
    local base_url="http://localhost:8082"
    
    echo "🔍 Verificando endpoints principales..."
    echo ""
    
    # Health check
    echo "1. 🏥 Health Check:"
    if curl -s "${base_url}/actuator/health" >/dev/null 2>&1; then
        echo "   ✅ /actuator/health - OK"
    else
        echo "   ❌ /actuator/health - FALLO"
    fi
    
    # API endpoints
    echo ""
    echo "2. 📚 API Endpoints:"
    
    if curl -s "${base_url}/api/categories" >/dev/null 2>&1; then
        echo "   ✅ /api/categories - OK"
    else
        echo "   ❌ /api/categories - FALLO"
    fi
    
    if curl -s "${base_url}/api/courses" >/dev/null 2>&1; then
        echo "   ✅ /api/courses - OK"
    else
        echo "   ❌ /api/courses - FALLO"
    fi
    
    echo ""
    echo "3. 💾 Base de datos:"
    # Aquí se podría agregar verificación de BD
    echo "   ℹ️  Verificación manual requerida"
    
    echo ""
    show_success_banner "Health check completado"
}

# Función principal del menú
main() {
    while true; do
        show_main_menu
        
        read -p "Seleccione una opción [0-13]: " choice
        echo ""
        
        case $choice in
            1) configure_environment ;;
            2) manage_environment_variables ;;
            3) start_service ;;
            4) stop_service ;;
            5) restart_service ;;
            6) check_status ;;
            7) compile_project ;;
            8) clean_project ;;
            9) show_logs ;;
            10) run_tests ;;
            11) show_info ;;
            12) show_service_urls ;;
            13) health_check ;;
            0) 
                show_success_banner "¡Hasta luego!"
                exit 0
                ;;
            *)
                show_error_banner "Opción inválida. Seleccione 0-13."
                ;;
        esac
        
        echo ""
        read -p "Presiona Enter para continuar..."
    done
}

# Crear directorio de logs
mkdir -p "$ROOT_DIR/logs"

# Ejecutar menú principal
main "$@"
