# 🚀 GUÍA DE SCRIPTS - COURSE SERVICE

## 📋 Descripción General

Esta guía detalla todos los scripts disponibles para gestionar el **EduTech Course Service**. Los scripts están organizados por plataforma y proporcionan una interfaz completa para el desarrollo, despliegue y mantenimiento del microservicio.

## 📁 Estructura de Scripts

```
scripts/
├── banner.sh                 # Banner y funciones de UI (Unix)
├── banner.bat                # Banner y funciones de UI (Windows)
├── mac/                      # Scripts para macOS/Linux
│   ├── configurar.sh         # Configuración inicial del entorno
│   ├── controlador.sh        # Script maestro con menú interactivo
│   ├── iniciar.sh           # Inicio avanzado del servicio
│   ├── detener.sh           # Detención segura del servicio
│   └── verificar-estado.sh   # Verificación de estado completa
└── windows/                  # Scripts para Windows
    ├── configurar.bat        # Configuración inicial del entorno
    ├── controlador.bat       # Script maestro con menú interactivo
    ├── iniciar.bat          # Inicio avanzado del servicio
    ├── detener.bat          # Detención segura del servicio
    └── verificar-estado.bat  # Verificación de estado completa
```

## 🖥️ Scripts para macOS/Linux

### 🎮 `controlador.sh` - Script Maestro
**Propósito**: Interfaz principal con menú interactivo para todas las operaciones

```bash
./scripts/mac/controlador.sh
```

**Funcionalidades**:
- 🔧 Configuración del entorno
- ⚙️ Gestión de variables de entorno  
- 🚀 Inicio/detención/reinicio del servicio
- 📊 Verificación de estado
- 🔨 Compilación y limpieza
- 📄 Visualización de logs
- 🧪 Ejecución de pruebas
- ℹ️ Información del proyecto
- 🌐 URLs de acceso
- 🏥 Health checks completos

### ⚙️ `configurar.sh` - Configuración Inicial
**Propósito**: Configurar el entorno de desarrollo completo

```bash
./scripts/mac/configurar.sh
```

**Qué hace**:
- ✅ Verifica prerrequisitos (Java 17+, Maven, curl, lsof)
- 📁 Crea estructura de directorios
- 📄 Genera archivo `.env` con variables optimizadas
- 🔧 Configura `application.properties`
- 📦 Valida `pom.xml`
- 🌐 Prueba conectividad a base de datos
- 🔐 Configura permisos de scripts
- 📝 Crea aliases útiles

### 🚀 `iniciar.sh` - Inicio Avanzado
**Propósito**: Iniciar el Course Service con verificaciones completas

```bash
./scripts/mac/iniciar.sh
```

**Características**:
- 🛑 Detiene procesos existentes de forma segura
- ✅ Verifica prerrequisitos automáticamente
- 🔨 Compila el proyecto con Maven
- 🚀 Inicia Spring Boot con monitoreo
- ⏱️ Espera hasta 120 segundos para que esté listo
- 🏥 Realiza health check automático
- 📊 Muestra URLs de acceso
- 📄 Gestiona logs y PID
- 🧪 Test básico de endpoints

### 🛑 `detener.sh` - Detención Segura
**Propósito**: Detener el servicio de forma segura y completa

```bash
./scripts/mac/detener.sh
```

**Métodos de detención**:
1. **PID almacenado**: Usa el PID guardado en `logs/service.pid`
2. **Búsqueda por puerto**: Encuentra procesos en puerto 8082
3. **Búsqueda Java específica**: Busca procesos relacionados con Course Service

**Proceso**:
- 🛑 Envía SIGTERM (cierre graceful)
- ⏱️ Espera tiempo configurado
- ⚡ Envía SIGKILL si es necesario
- 🧹 Limpia archivos temporales
- ✅ Verifica liberación del puerto

### 📊 `verificar-estado.sh` - Verificación Completa
**Propósito**: Análisis exhaustivo del estado del servicio

```bash
./scripts/mac/verificar-estado.sh
```

**Verificaciones**:
- 🔍 Estado del puerto 8082
- 🏥 Health check endpoint
- 📡 Endpoints principales de API
- 📄 Estado de archivos de log
- 💻 Uso de CPU y memoria
- 🔍 PID activo vs almacenado

## 🪟 Scripts para Windows

### 🎮 `controlador.bat` - Script Maestro
```cmd
scripts\windows\controlador.bat
```

### ⚙️ `configurar.bat` - Configuración Inicial  
```cmd
scripts\windows\configurar.bat
```

### 🚀 `iniciar.bat` - Inicio Avanzado
```cmd
scripts\windows\iniciar.bat
```

### 🛑 `detener.bat` - Detención Segura
```cmd
scripts\windows\detener.bat
```

### 📊 `verificar-estado.bat` - Verificación Completa
```cmd
scripts\windows\verificar-estado.bat
```

## 🌟 Características Avanzadas

### 🎨 Interfaz Visual
- ✨ Banners ASCII profesionales
- 🎨 Colores y emojis para mejor UX
- 📊 Barras de progreso y estados visuales
- ⚡ Feedback en tiempo real

### 🔍 Validaciones Inteligentes
- ✅ Verificación automática de prerrequisitos
- 🔧 Detección de versiones de herramientas
- 🌐 Pruebas de conectividad
- 📦 Validación de dependencias Maven

### 📄 Logging Avanzado
- 📅 Timestamps en todas las operaciones
- 📊 Niveles de log (INFO, WARN, ERROR)
- 📁 Logs separados por operación
- 🔄 Rotación automática de logs antiguos

### 🛡️ Gestión de Errores
- 🚨 Detección proactiva de conflictos
- 🔄 Reintentos automáticos
- 🧹 Cleanup automático en caso de error
- ⚠️ Mensajes de error descriptivos

## 📚 Casos de Uso Comunes

### 🚀 Primer Uso (Desarrollador Nuevo)
```bash
# 1. Configurar entorno inicial
./scripts/mac/configurar.sh

# 2. Iniciar servicio
./scripts/mac/iniciar.sh

# 3. Verificar que todo funciona
./scripts/mac/verificar-estado.sh
```

### 💻 Desarrollo Diario
```bash
# Usar el controlador maestro
./scripts/mac/controlador.sh

# O comandos directos
./scripts/mac/iniciar.sh      # Iniciar para desarrollo
./scripts/mac/detener.sh      # Detener al final del día
```

### 🔍 Debugging y Troubleshooting
```bash
# Verificar estado completo
./scripts/mac/verificar-estado.sh

# Ver logs en tiempo real
tail -f logs/service.log

# Reiniciar servicio limpio
./scripts/mac/detener.sh && ./scripts/mac/iniciar.sh
```

### 🧪 Testing y CI/CD
```bash
# Compilar y ejecutar tests
./scripts/mac/controlador.sh  # Opción 7 y 10

# O directamente con Maven
mvn clean test
```

## ⚙️ Variables de Entorno

Los scripts crean automáticamente un archivo `.env` con configuración optimizada:

```bash
# Principales variables configuradas
SERVER_PORT=8082
SPRING_DATASOURCE_URL=jdbc:postgresql://yamabiko.proxy.rlwy.net:41638/railway
SPRING_DATASOURCE_USERNAME=postgres
SPRING_DATASOURCE_PASSWORD=pcOCwrpYzhldbzeCbSIQiADPtLoseYsC

# Optimizaciones de pool de conexiones
SPRING_DATASOURCE_HIKARI_MAXIMUM_POOL_SIZE=20
SPRING_DATASOURCE_HIKARI_MINIMUM_IDLE=5

# Configuración JPA/Hibernate
SPRING_JPA_HIBERNATE_DDL_AUTO=update
SPRING_JPA_PROPERTIES_HIBERNATE_DIALECT=org.hibernate.dialect.PostgreSQLDialect
```

## 📊 Monitoreo y URLs

### 🏥 Health Checks
```
http://localhost:8082/actuator/health     # Estado del servicio
http://localhost:8082/actuator/info      # Información de la aplicación
```

### 📚 API Endpoints
```
http://localhost:8082/api/categories      # Gestión de categorías
http://localhost:8082/api/courses         # Gestión de cursos
http://localhost:8082/api/courses/premium # Cursos premium
http://localhost:8082/api/courses/featured # Cursos destacados
```

## 🔧 Troubleshooting

### ❌ Problemas Comunes

**Puerto 8082 ocupado**:
```bash
# Los scripts detectan automáticamente y ofrecen detener el proceso
./scripts/mac/iniciar.sh  # Detecta y pregunta si detener
```

**Java no encontrado**:
```bash
# Instalar Java 17+ en macOS
brew install openjdk@17
sudo ln -sfn /opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk
```

**Maven no encontrado**:
```bash
# Instalar Maven en macOS
brew install maven
```

**Error de conexión a base de datos**:
- Verificar conectividad a internet
- Confirmar credenciales en `.env`
- Probar conectividad: `nc -z yamabiko.proxy.rlwy.net 41638`

### 📄 Logs Útiles
```bash
# Log del servicio principal
tail -f logs/service.log

# Log de inicio
cat logs/inicio.log

# Log de configuración
cat logs/configuracion.log

# Log de detención
cat logs/detener.log
```

## 🎯 Mejores Prácticas

### ✅ Recomendaciones
1. **Usar siempre el configurador**: Ejecutar `configurar.sh` en nuevos entornos
2. **Verificar estado regularmente**: Usar `verificar-estado.sh` para monitoreo
3. **Revisar logs**: Mantener el archivo `service.log` monitoreado
4. **Detención segura**: Usar `detener.sh` antes de apagar el sistema
5. **Backup de configuración**: Respaldar archivos `.env` personalizados

### 🚀 Optimizaciones
- Los scripts están optimizados para desarrollo local
- Configuración de producción incluida en variables de entorno
- Pool de conexiones configurado para performance
- Timeouts apropiados para desarrollo vs producción


---

*📅 Última actualización: 12 de Junio de 2025*  
*🔧 Versión de scripts: 1.0.0*  
*📚 EduTech Course Service*
