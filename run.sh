#!/bin/bash
# 🚀 EduTech Course Service - Script de Inicio para macOS/Linux
# Autor: Felipe López
# Fecha: Junio 2025

echo "🚀 ==============================================="
echo "   EduTech Course Service - Microservicio"
echo "   Spring Boot 3.5.0 + PostgreSQL Railway"
echo "==============================================="
echo ""

# 🎯 Verificar Java
echo "🔍 Verificando Java..."
if ! command -v java &> /dev/null; then
    echo "❌ Error: Java no está instalado"
    echo "📥 Instalar Java 17+: https://adoptium.net/"
    exit 1
fi

JAVA_VERSION=$(java -version 2>&1 | head -1 | cut -d'"' -f2 | cut -d'.' -f1)
if [ "$JAVA_VERSION" -lt 17 ]; then
    echo "❌ Error: Se requiere Java 17+. Versión actual: $JAVA_VERSION"
    exit 1
fi
echo "✅ Java $JAVA_VERSION detectado"

# 🔍 Verificar Maven
echo "🔍 Verificando Maven..."
if ! command -v mvn &> /dev/null; then
    echo "❌ Error: Maven no está instalado"
    echo "📥 Instalar Maven: https://maven.apache.org/install.html"
    exit 1
fi
echo "✅ Maven $(mvn -version | head -1 | cut -d' ' -f3) detectado"

# 🛠️ Compilar el proyecto
echo ""
echo "🛠️ Compilando el proyecto..."
mvn clean compile -q
if [ $? -ne 0 ]; then
    echo "❌ Error en la compilación"
    exit 1
fi
echo "✅ Compilación exitosa"

# 🗄️ Verificar variables de entorno
echo ""
echo "🗄️ Verificando configuración de base de datos..."
if [ -f ".env" ]; then
    echo "✅ Archivo .env encontrado - Cargando variables..."
    export $(cat .env | grep -v '^#' | xargs)
else
    echo "⚠️  Archivo .env no encontrado - Usando configuración por defecto"
    echo "💡 Para Railway: cp .env.example .env y edita las credenciales"
fi

# 🚀 Ejecutar el servicio
echo ""
echo "🚀 Iniciando EduTech Course Service..."
echo "📍 URL: http://localhost:8082"
echo "🏥 Health: http://localhost:8082/health"
echo "📚 API: http://localhost:8082/api/courses"
echo ""
echo "💡 Presiona Ctrl+C para detener el servicio"
echo ""

# Ejecutar Spring Boot
mvn spring-boot:run

echo ""
echo "🛑 Servicio detenido"
