# 🚀 Scripts de Inicio - EduTech Course Service

## 📋 Descripción

Este proyecto incluye scripts multiplataforma para facilitar el inicio del servidor Spring Boot tanto para **usuarios** como para **desarrolladores**.

## 🖥️ Scripts Disponibles

### 📜 Scripts Completos (Con Validaciones)

#### `run.sh` (macOS/Linux)
```bash
./run.sh
```
- ✅ Verifica Java 17+
- ✅ Verifica Maven
- ✅ Compila el proyecto
- ✅ Carga variables de entorno (.env)
- ✅ Muestra URLs de acceso
- ✅ Ejecuta Spring Boot

#### `run.bat` (Windows)
```cmd
run.bat
```
- ✅ Verifica Java 17+
- ✅ Verifica Maven  
- ✅ Compila el proyecto
- ✅ Detecta archivo .env
- ✅ Muestra URLs de acceso
- ✅ Ejecuta Spring Boot

### ⚡ Scripts Rápidos (Para Usuarios)

#### `start.sh` (macOS/Linux)
```bash
./start.sh
```

#### `start.bat` (Windows)
```cmd
start.bat
```

## 🎯 Para Usuarios

### 🚀 Inicio Inmediato
1. Abrir terminal en la carpeta del proyecto
2. Ejecutar según tu sistema operativo:
   - **macOS/Linux**: `./start.sh`
   - **Windows**: `start.bat`
3. Esperar a ver: `Started CourseServiceApplication`
4. Abrir navegador en: `http://localhost:8082/health`

### 📊 URLs de Prueba
- **🏥 Health Check**: `http://localhost:8082/health`
- **📚 API Cursos**: `http://localhost:8082/api/courses`
- **🏷️ API Categorías**: `http://localhost:8082/api/categories`

## 🛠️ Prerequisitos

### ✅ Requeridos
- **Java 17+** (OpenJDK o Oracle)
- **Maven 3.6+**
- **Conexión a Internet** (para PostgreSQL Railway)

### 🔍 Verificar Instalación
```bash
# Verificar Java
java -version

# Verificar Maven
mvn -version
```

## 🗄️ Configuración de Base de Datos

### 🌐 Railway Cloud (Configurado por defecto)
El servicio se conecta automáticamente a la base de datos PostgreSQL en Railway Cloud.

### ⚙️ Configuración Local (Opcional)
Si quieres usar una base de datos local:
1. Copia `.env.example` a `.env`
2. Edita las credenciales según tu configuración
3. Ejecuta el script normalmente

## ❌ Solución de Problemas

### 🔧 Error: "Java no está instalado"
- **Solución**: Instalar Java 17+ desde [Adoptium.net](https://adoptium.net/)

### 🔧 Error: "Maven no está instalado"  
- **Solución**: Instalar Maven desde [maven.apache.org](https://maven.apache.org/install.html)

### 🔧 Error: "Permission denied" (macOS/Linux)
```bash
chmod +x run.sh start.sh
```

### 🔧 Error de Conexión a Base de Datos
- Verificar conexión a Internet
- El servicio usa Railway Cloud por defecto
- Credenciales están preconfiguradas
