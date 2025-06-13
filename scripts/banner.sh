#!/bin/bash
# =============================================================================
# EduTech Banner - Banner profesional para Course Service
# =============================================================================

# Colores
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[0;33m'
readonly BLUE='\033[0;34m'
readonly PURPLE='\033[0;35m'
readonly CYAN='\033[0;36m'
readonly WHITE='\033[1;37m'
readonly BOLD='\033[1m'
readonly NC='\033[0m' # No Color

show_edutech_banner() {
    clear
    echo -e "${BLUE}${BOLD}"
    echo "╔═══════════════════════════════════════════════════════════════════════════════╗"
    echo "║                                                                               ║"
    echo "║   ███████╗██████╗ ██╗   ██╗████████╗███████╗ ██████╗██╗  ██╗                 ║"
    echo "║   ██╔════╝██╔══██╗██║   ██║╚══██╔══╝██╔════╝██╔════╝██║  ██║                 ║"
    echo "║   █████╗  ██║  ██║██║   ██║   ██║   █████╗  ██║     ███████║                 ║"
    echo "║   ██╔══╝  ██║  ██║██║   ██║   ██║   ██╔══╝  ██║     ██╔══██║                 ║"
    echo "║   ███████╗██████╔╝╚██████╔╝   ██║   ███████╗╚██████╗██║  ██║                 ║"
    echo "║   ╚══════╝╚═════╝  ╚═════╝    ╚═╝   ╚══════╝ ╚═════╝╚═╝  ╚═╝                 ║"
    echo "║                                                                               ║"
    echo "║                📚 MICROSERVICIO DE CURSOS Y CONTENIDO 📚                     ║"
    echo "║                     💡 Course Service - v1.0.0 💡                           ║"
    echo "║                                                                               ║"
    echo "╚═══════════════════════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

show_operation_banner() {
    local operation="$1"
    local description="$2"
    echo -e "\n${CYAN}${BOLD}╔══════════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}${BOLD}║${NC} ${YELLOW}${BOLD}${operation}${NC} ${CYAN}${BOLD}║${NC}"
    echo -e "${CYAN}${BOLD}╠══════════════════════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${CYAN}${BOLD}║${NC} ${WHITE}${description}${NC} ${CYAN}${BOLD}║${NC}"
    echo -e "${CYAN}${BOLD}╚══════════════════════════════════════════════════════════════════════════════════╝${NC}\n"
}

show_success_banner() {
    local message="$1"
    echo -e "\n${GREEN}${BOLD}╔══════════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}${BOLD}║${NC} ${WHITE}✅ ${message}${NC} ${GREEN}${BOLD}║${NC}"
    echo -e "${GREEN}${BOLD}╚══════════════════════════════════════════════════════════════════════════════════╝${NC}\n"
}

show_error_banner() {
    local message="$1"
    echo -e "\n${RED}${BOLD}╔══════════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${RED}${BOLD}║${NC} ${WHITE}❌ ${message}${NC} ${RED}${BOLD}║${NC}"
    echo -e "${RED}${BOLD}╚══════════════════════════════════════════════════════════════════════════════════╝${NC}\n"
}

show_warning_banner() {
    local message="$1"
    echo -e "\n${YELLOW}${BOLD}╔══════════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${YELLOW}${BOLD}║${NC} ${WHITE}⚠️ ${message}${NC} ${YELLOW}${BOLD}║${NC}"
    echo -e "${YELLOW}${BOLD}╚══════════════════════════════════════════════════════════════════════════════════╝${NC}\n"
}

show_info_banner() {
    local message="$1"
    echo -e "\n${BLUE}${BOLD}╔══════════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}${BOLD}║${NC} ${WHITE}ℹ️ ${message}${NC} ${BLUE}${BOLD}║${NC}"
    echo -e "${BLUE}${BOLD}╚══════════════════════════════════════════════════════════════════════════════════╝${NC}\n"
}

# Función para mostrar el estado del servicio
show_service_status() {
    local status="$1"
    local port="$2"
    local pid="$3"
    
    echo -e "${CYAN}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}${BOLD}║${NC} ${YELLOW}${BOLD}📊 ESTADO DEL COURSE SERVICE${NC} ${CYAN}${BOLD}║${NC}"
    echo -e "${CYAN}${BOLD}╠═══════════════════════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${CYAN}${BOLD}║${NC} ${WHITE}Estado: ${status}${NC} ${CYAN}${BOLD}║${NC}"
    echo -e "${CYAN}${BOLD}║${NC} ${WHITE}Puerto: ${port}${NC} ${CYAN}${BOLD}║${NC}"
    echo -e "${CYAN}${BOLD}║${NC} ${WHITE}PID: ${pid}${NC} ${CYAN}${BOLD}║${NC}"
    echo -e "${CYAN}${BOLD}║${NC} ${WHITE}Fecha: $(date '+%Y-%m-%d %H:%M:%S')${NC} ${CYAN}${BOLD}║${NC}"
    echo -e "${CYAN}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════════╝${NC}"
}

# Función para mostrar información del proyecto
show_project_info() {
    echo -e "${BLUE}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}${BOLD}║${NC} ${YELLOW}${BOLD}📋 INFORMACIÓN DEL PROYECTO${NC} ${BLUE}${BOLD}║${NC}"
    echo -e "${BLUE}${BOLD}╠═══════════════════════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${BLUE}${BOLD}║${NC} ${WHITE}Proyecto: EduTech Course Service${NC} ${BLUE}${BOLD}║${NC}"
    echo -e "${BLUE}${BOLD}║${NC} ${WHITE}Versión: 1.0.0-SNAPSHOT${NC} ${BLUE}${BOLD}║${NC}"
    echo -e "${BLUE}${BOLD}║${NC} ${WHITE}Puerto: 8082${NC} ${BLUE}${BOLD}║${NC}"
    echo -e "${BLUE}${BOLD}║${NC} ${WHITE}Framework: Spring Boot 3.5.0${NC} ${BLUE}${BOLD}║${NC}"
    echo -e "${BLUE}${BOLD}║${NC} ${WHITE}Java: 17+${NC} ${BLUE}${BOLD}║${NC}"
    echo -e "${BLUE}${BOLD}║${NC} ${WHITE}Base de datos: PostgreSQL${NC} ${BLUE}${BOLD}║${NC}"
    echo -e "${BLUE}${BOLD}║${NC} ${WHITE}Health Check: http://localhost:8082/actuator/health${NC} ${BLUE}${BOLD}║${NC}"
    echo -e "${BLUE}${BOLD}║${NC} ${WHITE}API Base: http://localhost:8082/api${NC} ${BLUE}${BOLD}║${NC}"
    echo -e "${BLUE}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════════╝${NC}"
}

# Función para mostrar URLs útiles
show_urls() {
    echo -e "${GREEN}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}${BOLD}║${NC} ${YELLOW}${BOLD}🌐 URLS DE ACCESO${NC} ${GREEN}${BOLD}║${NC}"
    echo -e "${GREEN}${BOLD}╠═══════════════════════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${GREEN}${BOLD}║${NC} ${WHITE}Health Check: http://localhost:8082/actuator/health${NC} ${GREEN}${BOLD}║${NC}"
    echo -e "${GREEN}${BOLD}║${NC} ${WHITE}Categorías: http://localhost:8082/api/categories${NC} ${GREEN}${BOLD}║${NC}"
    echo -e "${GREEN}${BOLD}║${NC} ${WHITE}Cursos: http://localhost:8082/api/courses${NC} ${GREEN}${BOLD}║${NC}"
    echo -e "${GREEN}${BOLD}║${NC} ${WHITE}Cursos Premium: http://localhost:8082/api/courses/premium${NC} ${GREEN}${BOLD}║${NC}"
    echo -e "${GREEN}${BOLD}║${NC} ${WHITE}Cursos Destacados: http://localhost:8082/api/courses/featured${NC} ${GREEN}${BOLD}║${NC}"
    echo -e "${GREEN}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════════╝${NC}"
}
