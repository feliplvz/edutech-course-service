#!/bin/bash
# =============================================================================
# EduTech - Script de Configuración (macOS/Linux) - Course Service
# =============================================================================
# Descripción: Configura el entorno de desarrollo para el Course Service
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
readonly LOG_FILE="$ROOT_DIR/logs/configuracion.log"

# Crear directorio de logs
mkdir -p "$ROOT_DIR/logs"

# Función de logging
log() {
    local level="$1"
    shift
    local message="$*"
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] [$level] $message" | tee -a "${LOG_FILE}"
}

# Función para verificar prerrequisitos
check_prerequisites() {
    show_operation_banner "🔍 VERIFICANDO PRERREQUISITOS" "Validando herramientas necesarias..."
    
    local all_ok=true
    
    echo "🔍 Verificando herramientas esenciales..."
    echo ""
    
    # Verificar Java
    if command -v java &> /dev/null; then
        local java_version=$(java -version 2>&1 | head -n 1 | cut -d'"' -f2)
        local java_major=$(echo "$java_version" | cut -d'.' -f1)
        
        if [ "$java_major" -ge 17 ]; then
            echo "✅ Java $java_version (compatible)"
            log "INFO" "Java $java_version verificado"
        else
            echo "❌ Java $java_version (se requiere 17+)"
            log "ERROR" "Versión de Java insuficiente: $java_version"
            all_ok=false
        fi
    else
        echo "❌ Java no encontrado"
        log "ERROR" "Java no instalado"
        all_ok=false
    fi
    
    # Verificar Maven
    if command -v mvn &> /dev/null; then
        local maven_version=$(mvn -version 2>/dev/null | head -n 1 | cut -d' ' -f3)
        echo "✅ Maven $maven_version"
        log "INFO" "Maven $maven_version verificado"
    else
        echo "❌ Maven no encontrado"
        log "ERROR" "Maven no instalado"
        all_ok=false
    fi
    
    # Verificar curl
    if command -v curl &> /dev/null; then
        echo "✅ curl disponible"
        log "INFO" "curl verificado"
    else
        echo "❌ curl no encontrado"
        log "ERROR" "curl no instalado"
        all_ok=false
    fi
    
    # Verificar lsof
    if command -v lsof &> /dev/null; then
        echo "✅ lsof disponible"
        log "INFO" "lsof verificado"
    else
        echo "❌ lsof no encontrado"
        log "ERROR" "lsof no instalado"
        all_ok=false
    fi
    
    echo ""
    
    if [ "$all_ok" = true ]; then
        show_success_banner "Todos los prerrequisitos están satisfechos"
        return 0
    else
        show_error_banner "Algunos prerrequisitos faltan"
        echo ""
        echo "📋 Para instalar herramientas faltantes:"
        echo ""
        echo "🍎 macOS (con Homebrew):"
        echo "   brew install openjdk@17 maven curl"
        echo "   sudo ln -sfn /opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk"
        echo ""
        echo "🐧 Linux (Ubuntu/Debian):"
        echo "   sudo apt update"
        echo "   sudo apt install openjdk-17-jdk maven curl lsof"
        echo ""
        return 1
    fi
}

# Función para configurar estructura de directorios
setup_directories() {
    show_operation_banner "📁 CONFIGURANDO DIRECTORIOS" "Creando estructura de proyecto..."
    
    local directories=(
        "$ROOT_DIR/logs"
        "$ROOT_DIR/target"
        "$ROOT_DIR/src/main/resources"
        "$ROOT_DIR/src/test/java"
    )
    
    for dir in "${directories[@]}"; do
        if [ ! -d "$dir" ]; then
            mkdir -p "$dir"
            echo "📁 Creado: $(basename "$dir")"
            log "INFO" "Directorio creado: $dir"
        else
            echo "✅ Existe: $(basename "$dir")"
        fi
    done
    
    show_success_banner "Estructura de directorios configurada"
}

# Función para crear archivo .env
create_env_file() {
    show_operation_banner "⚙️ CONFIGURANDO VARIABLES DE ENTORNO" "Creando archivo .env..."
    
    local env_file="$ROOT_DIR/.env"
    
    if [ -f "$env_file" ]; then
        echo "📄 Archivo .env ya existe"
        
        read -p "¿Desea sobrescribirlo? (y/n): " -n 1 -r
        echo ""
        
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            echo "ℹ️  Manteniendo archivo .env existente"
            return 0
        fi
        
        # Hacer backup
        cp "$env_file" "$env_file.backup.$(date +%Y%m%d_%H%M%S)"
        echo "💾 Backup creado: .env.backup.$(date +%Y%m%d_%H%M%S)"
    fi
    
    echo "📝 Creando archivo .env..."
    
    cat > "$env_file" << 'EOF'
# =============================================================================
# EduTech Course Service - Variables de Entorno
# =============================================================================
# Configuración para desarrollo y producción

# Perfil de Spring
SPRING_PROFILES_ACTIVE=development

# Configuración del servidor
SERVER_PORT=8082
SPRING_APPLICATION_NAME=course-service

# Base de datos - Railway PostgreSQL
SPRING_DATASOURCE_URL=jdbc:postgresql://yamabiko.proxy.rlwy.net:41638/railway
SPRING_DATASOURCE_USERNAME=postgres
SPRING_DATASOURCE_PASSWORD=pcOCwrpYzhldbzeCbSIQiADPtLoseYsC
SPRING_DATASOURCE_DRIVER_CLASS_NAME=org.postgresql.Driver

# Pool de conexiones HikariCP
SPRING_DATASOURCE_HIKARI_MAXIMUM_POOL_SIZE=20
SPRING_DATASOURCE_HIKARI_MINIMUM_IDLE=5
SPRING_DATASOURCE_HIKARI_CONNECTION_TIMEOUT=30000
SPRING_DATASOURCE_HIKARI_IDLE_TIMEOUT=600000
SPRING_DATASOURCE_HIKARI_MAX_LIFETIME=1800000

# Configuración JPA/Hibernate
SPRING_JPA_HIBERNATE_DDL_AUTO=update
SPRING_JPA_SHOW_SQL=false
SPRING_JPA_PROPERTIES_HIBERNATE_DIALECT=org.hibernate.dialect.PostgreSQLDialect
SPRING_JPA_PROPERTIES_HIBERNATE_FORMAT_SQL=true
SPRING_JPA_PROPERTIES_HIBERNATE_USE_SQL_COMMENTS=false
SPRING_JPA_PROPERTIES_HIBERNATE_JDBC_BATCH_SIZE=20
SPRING_JPA_PROPERTIES_HIBERNATE_ORDER_INSERTS=true
SPRING_JPA_PROPERTIES_HIBERNATE_ORDER_UPDATES=true

# Logging
LOGGING_LEVEL_COM_EDUTECH=INFO
LOGGING_LEVEL_ORG_SPRINGFRAMEWORK=WARN
LOGGING_LEVEL_ORG_HIBERNATE=WARN
LOGGING_LEVEL_ORG_HIBERNATE_SQL=WARN
LOGGING_LEVEL_ORG_HIBERNATE_TYPE=WARN

# Actuator (Monitoreo)
MANAGEMENT_ENDPOINTS_WEB_EXPOSURE_INCLUDE=health,info,metrics,env
MANAGEMENT_ENDPOINT_HEALTH_SHOW_DETAILS=always
MANAGEMENT_METRICS_ENABLED=true

# CORS (desarrollo)
CORS_ALLOWED_ORIGINS=http://localhost:3000,http://localhost:8080,http://localhost:8081,http://localhost:8083,http://localhost:8084
CORS_ALLOWED_METHODS=GET,POST,PUT,DELETE,PATCH,OPTIONS
CORS_ALLOWED_HEADERS=*
CORS_ALLOW_CREDENTIALS=true

# Configuración de archivos
SPRING_SERVLET_MULTIPART_MAX_FILE_SIZE=10MB
SPRING_SERVLET_MULTIPART_MAX_REQUEST_SIZE=10MB

# Configuración de caché (opcional)
SPRING_CACHE_TYPE=simple

# Configuración de timeouts
SERVER_SERVLET_SESSION_TIMEOUT=30m
SPRING_TRANSACTION_DEFAULT_TIMEOUT=300

# Variables específicas del negocio
EDUTECH_COURSE_DEFAULT_CATEGORY=General
EDUTECH_COURSE_MAX_MODULES=50
EDUTECH_COURSE_MAX_LESSONS_PER_MODULE=100
EDUTECH_COURSE_DEFAULT_DURATION_HOURS=10
EOF
    
    echo "✅ Archivo .env creado exitosamente"
    log "INFO" "Archivo .env configurado"
    
    echo ""
    echo "📋 Variables configuradas:"
    echo "   🌐 Puerto del servicio: 8082"
    echo "   🗄️  Base de datos: PostgreSQL en Railway"
    echo "   📊 Pool de conexiones: HikariCP optimizado"
    echo "   🔧 JPA/Hibernate: Configuración de producción"
    echo "   📄 Logging: Optimizado para desarrollo"
    echo "   🏥 Actuator: Health checks habilitados"
    
    show_success_banner "Variables de entorno configuradas"
}

# Función para configurar aplicación.properties
setup_application_properties() {
    show_operation_banner "🔧 CONFIGURANDO APPLICATION.PROPERTIES" "Archivo de configuración de Spring..."
    
    local props_file="$ROOT_DIR/src/main/resources/application.properties"
    
    if [ ! -f "$props_file" ]; then
        echo "📄 Creando application.properties..."
        
        mkdir -p "$(dirname "$props_file")"
        
        cat > "$props_file" << 'EOF'
# =============================================================================
# EduTech Course Service - Application Properties
# =============================================================================

# Información de la aplicación
spring.application.name=course-service
info.app.name=EduTech Course Service
info.app.description=Microservicio de gestión de cursos y contenido educativo
info.app.version=1.0.0

# Configuración del servidor
server.port=${SERVER_PORT:8082}
server.servlet.context-path=/

# Base de datos
spring.datasource.url=${SPRING_DATASOURCE_URL}
spring.datasource.username=${SPRING_DATASOURCE_USERNAME}
spring.datasource.password=${SPRING_DATASOURCE_PASSWORD}
spring.datasource.driver-class-name=${SPRING_DATASOURCE_DRIVER_CLASS_NAME:org.postgresql.Driver}

# Pool de conexiones
spring.datasource.hikari.maximum-pool-size=${SPRING_DATASOURCE_HIKARI_MAXIMUM_POOL_SIZE:20}
spring.datasource.hikari.minimum-idle=${SPRING_DATASOURCE_HIKARI_MINIMUM_IDLE:5}
spring.datasource.hikari.connection-timeout=${SPRING_DATASOURCE_HIKARI_CONNECTION_TIMEOUT:30000}

# JPA/Hibernate
spring.jpa.hibernate.ddl-auto=${SPRING_JPA_HIBERNATE_DDL_AUTO:update}
spring.jpa.show-sql=${SPRING_JPA_SHOW_SQL:false}
spring.jpa.properties.hibernate.dialect=${SPRING_JPA_PROPERTIES_HIBERNATE_DIALECT:org.hibernate.dialect.PostgreSQLDialect}
spring.jpa.properties.hibernate.format_sql=${SPRING_JPA_PROPERTIES_HIBERNATE_FORMAT_SQL:true}

# Actuator
management.endpoints.web.exposure.include=${MANAGEMENT_ENDPOINTS_WEB_EXPOSURE_INCLUDE:health,info}
management.endpoint.health.show-details=${MANAGEMENT_ENDPOINT_HEALTH_SHOW_DETAILS:always}

# Logging
logging.level.com.edutech=${LOGGING_LEVEL_COM_EDUTECH:INFO}
logging.level.org.springframework=${LOGGING_LEVEL_ORG_SPRINGFRAMEWORK:WARN}
logging.pattern.console=%d{yyyy-MM-dd HH:mm:ss} - %msg%n
logging.pattern.file=%d{yyyy-MM-dd HH:mm:ss} [%thread] %-5level %logger{36} - %msg%n
EOF
        
        echo "✅ application.properties creado"
        log "INFO" "application.properties configurado"
    else
        echo "✅ application.properties ya existe"
    fi
    
    show_success_banner "Configuración de Spring completada"
}

# Función para verificar pom.xml
check_pom_xml() {
    show_operation_banner "📦 VERIFICANDO POM.XML" "Validando configuración de Maven..."
    
    local pom_file="$ROOT_DIR/pom.xml"
    
    if [ ! -f "$pom_file" ]; then
        show_error_banner "Archivo pom.xml no encontrado"
        echo ""
        echo "❌ El archivo pom.xml es requerido para el proyecto Maven"
        echo "🔍 Asegúrese de estar en el directorio raíz del proyecto"
        return 1
    fi
    
    echo "✅ pom.xml encontrado"
    
    # Verificar dependencias clave
    echo "🔍 Verificando dependencias clave..."
    
    local dependencies=(
        "spring-boot-starter-web"
        "spring-boot-starter-data-jpa"
        "postgresql"
        "spring-boot-starter-actuator"
    )
    
    for dep in "${dependencies[@]}"; do
        if grep -q "$dep" "$pom_file"; then
            echo "   ✅ $dep"
        else
            echo "   ⚠️  $dep (no encontrada)"
        fi
    done
    
    # Verificar versión de Java
    if grep -q "<java.version>17</java.version>" "$pom_file"; then
        echo "   ✅ Java 17 configurado"
    else
        echo "   ⚠️  Verificar versión de Java en pom.xml"
    fi
    
    show_success_banner "pom.xml verificado"
}

# Función para test de conectividad
test_connectivity() {
    show_operation_banner "🌐 PROBANDO CONECTIVIDAD" "Verificando acceso a servicios externos..."
    
    echo "🔍 Probando conexión a base de datos..."
    
    # Probar conexión a Railway PostgreSQL
    local db_host="yamabiko.proxy.rlwy.net"
    local db_port="41638"
    
    if command -v nc &> /dev/null; then
        if nc -z -w5 "$db_host" "$db_port" 2>/dev/null; then
            echo "✅ Conexión a PostgreSQL ($db_host:$db_port) exitosa"
            log "INFO" "Conexión a base de datos exitosa"
        else
            echo "❌ No se puede conectar a PostgreSQL ($db_host:$db_port)"
            log "ERROR" "Fallo conexión a base de datos"
        fi
    else
        echo "⚠️  nc no disponible, saltando test de conectividad"
    fi
    
    # Probar conectividad a internet
    echo "🌐 Probando conectividad a internet..."
    if curl -s --max-time 10 https://www.google.com >/dev/null 2>&1; then
        echo "✅ Conectividad a internet disponible"
        log "INFO" "Conectividad a internet OK"
    else
        echo "❌ Sin conectividad a internet"
        log "WARN" "Sin conectividad a internet"
    fi
    
    show_success_banner "Pruebas de conectividad completadas"
}

# Función para configuración final
final_setup() {
    show_operation_banner "🎯 CONFIGURACIÓN FINAL" "Preparando entorno para desarrollo..."
    
    # Dar permisos a scripts
    echo "🔐 Configurando permisos de scripts..."
    chmod +x "$ROOT_DIR/scripts/banner.sh" 2>/dev/null || true
    chmod +x "$ROOT_DIR/scripts/mac/"*.sh 2>/dev/null || true
    
    # Crear alias útiles en un archivo temporal
    local aliases_file="$ROOT_DIR/course-service-aliases.sh"
    cat > "$aliases_file" << 'EOF'
#!/bin/bash
# EduTech Course Service - Aliases útiles
# Ejecute: source course-service-aliases.sh

alias course-start='./scripts/mac/iniciar.sh'
alias course-stop='./scripts/mac/detener.sh'
alias course-status='./scripts/mac/verificar-estado.sh'
alias course-control='./scripts/mac/controlador.sh'
alias course-logs='tail -f logs/service.log'
alias course-compile='mvn clean compile'
alias course-test='mvn test'

echo "🚀 Aliases del Course Service cargados:"
echo "   course-start    - Iniciar servicio"
echo "   course-stop     - Detener servicio"
echo "   course-status   - Verificar estado"
echo "   course-control  - Controlador maestro"
echo "   course-logs     - Ver logs en tiempo real"
echo "   course-compile  - Compilar proyecto"
echo "   course-test     - Ejecutar pruebas"
EOF
    
    echo "📝 Aliases creados en: course-service-aliases.sh"
    
    show_success_banner "Configuración completada exitosamente"
}

# Función principal
main() {
    show_edutech_banner
    show_operation_banner "🛠️ CONFIGURACIÓN INICIAL" "Configurando entorno de desarrollo para Course Service"
    
    echo "🎯 Este script configurará todo lo necesario para desarrollar y ejecutar el Course Service"
    echo ""
    
    read -p "¿Desea continuar con la configuración? (y/n): " -n 1 -r
    echo ""
    
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        show_info_banner "Configuración cancelada"
        exit 0
    fi
    
    echo ""
    log "INFO" "Iniciando configuración del Course Service"
    
    # Ejecutar pasos de configuración
    check_prerequisites || {
        echo ""
        echo "❌ No se puede continuar sin los prerrequisitos"
        exit 1
    }
    
    echo ""
    setup_directories
    
    echo ""
    create_env_file
    
    echo ""
    setup_application_properties
    
    echo ""
    check_pom_xml
    
    echo ""
    test_connectivity
    
    echo ""
    final_setup
    
    echo ""
    show_success_banner "¡Course Service configurado exitosamente!"
    
    echo ""
    echo "🎉 ¡Configuración completada!"
    echo ""
    echo "📋 Próximos pasos:"
    echo "   1. 🚀 Iniciar servicio: ./scripts/mac/iniciar.sh"
    echo "   2. 📊 Verificar estado: ./scripts/mac/verificar-estado.sh"
    echo "   3. 🎮 Usar controlador: ./scripts/mac/controlador.sh"
    echo "   4. 📄 Ver logs: tail -f logs/service.log"
    echo ""
    echo "💡 Para cargar aliases útiles:"
    echo "   source course-service-aliases.sh"
    echo ""
    echo "📄 Log de configuración: $LOG_FILE"
    
    log "INFO" "Configuración del Course Service completada exitosamente"
}

# Manejar señales
cleanup() {
    echo ""
    echo "🛑 Configuración interrumpida"
    exit 1
}

trap cleanup SIGINT SIGTERM

# Ejecutar función principal
main "$@"
