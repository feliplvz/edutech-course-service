# 🚀 EduTech - Microservicio de Gestión de Cursos

<div align="center">

[![Java](https://img.shields.io/badge/Java-17-orange.svg)](https://openjdk.java.net/projects/jdk/17/)
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.5.0-brightgreen.svg)](https://spring.io/projects/spring-boot)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-16.8-blue.svg)](https://www.postgresql.org/)
[![API](https://img.shields.io/badge/API-REST-green.svg)](https://restfulapi.net/)
[![Tests](https://img.shields.io/badge/Tests-✅%20Passed-success.svg)](./REPORTE_PRUEBAS_COMPLETO.md)

**🎯 Microservicio Empresarial de Gestión de Cursos y Categorías Educativas**

</div>
  
## 🎯 Descripción

**Course Service** es un microservicio empresarial robusto y escalable, desarrollado con **Spring Boot 3.5.0**, diseñado para gestionar de manera eficiente cursos y categorías educativas en plataformas de e-learning de nivel corporativo. Este servicio proporciona una **API REST completa** con estándares de calidad, incluyendo manejo avanzado de errores, validaciones estrictas y arquitectura orientada a microservicios.

### 🎯 Propósito de Negocio

- **Gestión Centralizada** de contenido educativo
- **Escalabilidad Horizontal** para múltiples clientes  
- **Integración Empresarial** con sistemas LMS
- **Arquitectura Cloud-Ready** para despliegues modernos

### 📊 Estadísticas Clave

- ✅ **15+ Endpoints API** completamente funcionales
- ✅ **35+ Tests en Postman** validados
- ✅ **100% Funcionalidades** implementadas
- ✅ **PostgreSQL Cloud** en Railway
- ✅ **4 Categorías** preconfiguradas
- ✅ **Sistema Premium** y destacados
- ✅ **Scripts multiplataforma** para Windows y macOS

---

## ✨ Características Principales

### 🏢 Gestión Empresarial
- **🏷️ Gestión de Categorías**: CRUD completo con contador inteligente de cursos
- **📚 Gestión de Cursos**: CRUD completo con búsqueda avanzada y filtrado
- **⭐ Sistema de Destacados**: Cursos premium y promocionados
- **🔍 Búsqueda Inteligente**: Búsqueda por palabras clave en título y descripción

### 🛠️ Características Técnicas
- **🏥 Health Monitoring**: Monitoreo completo de salud del servicio y BD
- **🛡️ Manejo de Errores**: GlobalExceptionHandler empresarial
- **🌐 CORS Empresarial**: Configuración avanzada para integración
- **✔️ Validaciones**: Validación robusta de datos de entrada
- **📄 Paginación**: Sistema completo de paginación y ordenamiento

### 🚀 Infraestructura
- **🗄️ Base de Datos**: PostgreSQL 16.8 en Railway (Cloud)
- **🎯 Auto-Inicialización**: Datos de demostración y configuración automática
- **🔄 Lazy Loading**: Optimización de carga de entidades relacionadas
- **🌐 Cloud-Ready**: Desplegable en cualquier plataforma cloud

---

## 🛠️ Tecnologías Utilizadas

### 🔧 Stack Principal

| Tecnología | Versión | Descripción |
|------------|---------|-------------|
| ☕ **Java** | 17+ LTS | Lenguaje principal con soporte empresarial |
| 🍃 **Spring Boot** | 3.5.0 | Framework empresarial de microservicios |
| 🗄️ **Spring Data JPA** | 3.5.0 | ORM avanzado para gestión de datos |
| 🌐 **Spring Web** | 3.5.0 | API REST con estándares empresariales |
| 🐘 **PostgreSQL** | 16.8 | Base de datos empresarial en la nube |

### 🔗 Dependencias
- 🔄 **Hibernate** 6.6.15 - ORM de nivel empresarial
- 🎭 **Lombok** Latest - Reducción de boilerplate code  
- 📦 **Maven** 3.6+ - Gestión de dependencias empresarial
- ⚡ **HikariCP** - Connection pooling optimizado

---

## 🚀 Configuración y Despliegue

### 📋 Prerrequisitos
- ☕ **Java 17+** (OpenJDK o Oracle)
- 📦 **Maven 3.6+** para gestión de dependencias
- 🌐 **Conexión a Internet** (PostgreSQL en Railway)
- 🐳 **Docker** (opcional para containerización)

### ⚙️ Variables de Entorno
```properties
# 🎯 Configuración del Servicio
spring.application.name=course-service
server.port=8082

# 🗄️ Base de Datos PostgreSQL (Configurar según tu entorno)
spring.datasource.url=${DATABASE_URL:jdbc:postgresql://localhost:5432/coursedb}
spring.datasource.username=${DATABASE_USERNAME:postgres}
spring.datasource.password=${DATABASE_PASSWORD:your_password_here}

# 🚀 Configuración JPA Optimizada
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=false  # Optimizado para producción
spring.jpa.properties.hibernate.format_sql=true
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.PostgreSQLDialect
```

### 🔐 Configuración de Seguridad

#### 🌐 Entornos de Despliegue

**🚀 Producción (Railway/Heroku/AWS):**
```bash
# Variables de entorno del sistema
DATABASE_URL=jdbc:postgresql://your-host:port/database
DATABASE_USERNAME=your_username
DATABASE_PASSWORD=your_secure_password
```

**💻 Desarrollo Local:**
```bash
# Crear archivo .env (incluido en .gitignore)
DATABASE_URL=jdbc:postgresql://localhost:5432/coursedb_dev
DATABASE_USERNAME=postgres
DATABASE_PASSWORD=admin123
```

**🐳 Docker Compose:**
```yaml
# docker-compose.yml
services:
  course-service:
    environment:
      - DATABASE_URL=jdbc:postgresql://postgres:5432/coursedb
      - DATABASE_USERNAME=postgres
      - DATABASE_PASSWORD=postgres123
  postgres:
    image: postgres:16
    environment:
      - POSTGRES_DB=coursedb
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=postgres123
```
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=false  # Optimizado para producción
spring.jpa.properties.hibernate.format_sql=true
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.PostgreSQLDialect
```

### 🏃‍♂️ Instrucciones de Instalación

#### 🚀 Inicio Rápido

**🖥️ En macOS/Linux:**
```bash
# Opción 1: Script completo con validaciones
./run.sh

# Opción 2: Inicio rápido
./start.sh

# Opción 3: Comando directo
mvn spring-boot:run
```

**🪟 En Windows:**
```cmd
REM Opción 1: Script completo con validaciones
run.bat

REM Opción 2: Inicio rápido  
start.bat

REM Opción 3: Comando directo
mvn spring-boot:run
```

#### 🔧 Instalación Manual Paso a Paso
```bash
# 1️⃣ Clonar el repositorio
git clone [https://github.com/feliplvz/edutech-course-service]
cd course-service

# 2️⃣ Compilar el proyecto
mvn clean compile

# 3️⃣ Ejecutar tests
mvn test

# 4️⃣ Empaquetar para producción
mvn clean package -DskipTests

# 5️⃣ Ejecutar el servicio
mvn spring-boot:run
# O directamente: java -jar target/course-service-0.0.1-SNAPSHOT.jar
```

#### 🐳 Despliegue con Docker
```bash
# Crear imagen Docker
docker build -t course-service .

# Ejecutar contenedor
docker run -p 8082:8082 course-service
```

### 🌐 Verificación del Despliegue
- **🏠 URL Base**: `http://localhost:8082`
- **📊 Health Check**: `http://localhost:8082/health`
- **🏷️ Categorías**: `http://localhost:8082/api/categories`
- **📚 Cursos**: `http://localhost:8082/api/courses`

### 📜 Scripts de Inicio Incluidos

| Script | Plataforma | Descripción | Uso |
|--------|------------|-------------|-----|
| `run.sh` | macOS/Linux | Script completo con validaciones | `./run.sh` |
| `run.bat` | Windows | Script completo con validaciones | `run.bat` |
| `start.sh` | macOS/Linux | Inicio rápido para evaluadores | `./start.sh` |
| `start.bat` | Windows | Inicio rápido para evaluadores | `start.bat` |

**🔧 Características de los Scripts:**
- ✅ Verificación automática de Java 17+ y Maven
- ✅ Compilación automática del proyecto
- ✅ Carga de variables de entorno (.env)
- ✅ URLs de acceso mostradas al inicio
- ✅ Instrucciones claras para el evaluador

---

## 📊 API Endpoints

### 🏥 Health Check & Monitoring

| Método | Endpoint | Descripción | Respuesta |
|--------|----------|-------------|-----------|
| `GET` | `/health` | Estado general del microservicio | `200 OK` |
| `GET` | `/health/db` | Estado de conexión a PostgreSQL | `200 OK` |

### 🏷️ Gestión de Categorías

| Método | Endpoint | Descripción | Respuesta |
|--------|----------|-------------|-----------|
| `GET` | `/api/categories` | Listar categorías con contador de cursos | `200 OK` |
| `GET` | `/api/categories/{id}` | Obtener categoría específica | `200 OK` |
| `GET` | `/api/categories/name/{name}` | Buscar categoría por nombre | `200 OK` |
| `POST` | `/api/categories` | Crear nueva categoría | `201 Created` |
| `PUT` | `/api/categories/{id}` | Actualizar categoría existente | `200 OK` |
| `DELETE` | `/api/categories/{id}` | Eliminar categoría (validación automática) | `204 No Content` |
| `GET` | `/api/categories/exists/{name}` | Verificar existencia de nombre | `200 OK` |

### 📚 Gestión de Cursos

| Método | Endpoint | Descripción | Respuesta |
|--------|----------|-------------|-----------|
| `GET` | `/api/courses` | Listar todos los cursos | `200 OK` |
| `GET` | `/api/courses/paginated` | Cursos con paginación avanzada | `200 OK` |
| `GET` | `/api/courses/{id}` | Obtener curso específico | `200 OK` |
| `GET` | `/api/courses/category/{categoryId}` | Cursos por categoría | `200 OK` |
| `GET` | `/api/courses/instructor/{instructorId}` | Cursos por instructor | `200 OK` |
| `GET` | `/api/courses/level/{level}` | Cursos por nivel de dificultad | `200 OK` |
| `GET` | `/api/courses/featured` | Cursos destacados | `200 OK` |
| `GET` | `/api/courses/premium` | Cursos premium | `200 OK` |
| `GET` | `/api/courses/search?keyword={term}` | Búsqueda inteligente | `200 OK` |
| `POST` | `/api/courses` | Crear nuevo curso | `201 Created` |
| `PUT` | `/api/courses/{id}` | Actualizar curso completo | `200 OK` |
| `PATCH` | `/api/courses/{id}/publish` | Publicar curso | `200 OK` |
| `PATCH` | `/api/courses/{id}/archive` | Archivar curso | `200 OK` |
| `DELETE` | `/api/courses/{id}` | Eliminar curso | `204 No Content` |

### 📝 Ejemplos de Uso

#### 🏷️ Crear Categoría
```bash
curl -X POST http://localhost:8082/api/categories \
  -H "Content-Type: application/json" \
  -d '{
    "name": "🤖 Inteligencia Artificial",
    "description": "Cursos avanzados de IA y Machine Learning para empresas"
  }'
```

#### 📚 Crear Curso
```bash
curl -X POST http://localhost:8082/api/courses \
  -H "Content-Type: application/json" \
  -d '{
    "title": "🐍 Machine Learning con Python - Nivel Empresarial",
    "description": "Curso completo de ML para aplicaciones corporativas",
    "objectives": "Dominar algoritmos de ML para casos de uso empresariales",
    "requirements": "Python intermedio y estadística básica",
    "durationHours": 60,
    "price": 299.99,
    "level": "INTERMEDIATE",
    "status": "PUBLISHED",
    "featured": true,
    "premium": true,
    "categoryId": 1
  }'
```

#### 🔍 Búsquedas Avanzadas
```bash
# Búsqueda por palabra clave
curl "http://localhost:8082/api/courses/search?keyword=Python"

# Obtener cursos destacados
curl http://localhost:8082/api/courses/featured

# Obtener cursos premium
curl http://localhost:8082/api/courses/premium

# Cursos por categoría
curl http://localhost:8082/api/courses/category/1
```

---

## 🏗️ Arquitectura del Proyecto

### 📁 Estructura del Proyecto
```
📦 course-service/
├── 📄 pom.xml                          # Configuración Maven empresarial
├── 📄 README.md                        # Documentación profesional
├── 📄 postman-collection.json          # Colección de pruebas API
└── 📂 src/main/java/com/edutech/courseservice/
    ├── 🚀 CourseServiceApplication.java # Punto de entrada principal
    ├── 📂 config/                       # Configuraciones empresariales
    │   ├── 🎯 DataInitializer.java     # Inicialización automática
    │   └── 🌐 WebConfig.java           # Configuración CORS/Web
    ├── 📂 controller/                   # Controladores REST
    │   ├── 🏷️ CategoryController.java  # API de categorías
    │   ├── 📚 CourseController.java    # API de cursos
    │   └── 🏥 HealthController.java    # Monitoreo de salud
    ├── 📂 service/                     # Lógica de negocio
    │   ├── 🏷️ CategoryService.java    # Servicios de categorías
    │   ├── 📚 CourseService.java       # Servicios de cursos
    │   └── 📂 impl/                    # Implementaciones
    ├── 📂 repository/                  # Acceso a datos (JPA)
    ├── 📂 model/                       # Entidades de dominio
    ├── 📂 dto/                         # Objetos de transferencia
    └── 📂 exception/                   # Manejo de excepciones
```

### 🗄️ Modelo de Base de Datos
```sql
-- 📊 Esquema Empresarial Optimizado
Categories (
  id BIGINT PRIMARY KEY,
  name VARCHAR(255) UNIQUE NOT NULL,
  description TEXT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
)

Courses (
  id BIGINT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  objectives TEXT,
  requirements TEXT,
  duration_hours INTEGER,
  price DECIMAL(10,2),
  discount_percentage INTEGER,
  image_url VARCHAR(500),
  instructor_id BIGINT,
  level VARCHAR(50),
  status VARCHAR(50),
  featured BOOLEAN DEFAULT FALSE,
  premium BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  published_at TIMESTAMP,
  category_id BIGINT REFERENCES Categories(id)
)
```

### 🏛️ Arquitectura del Sistema

```
                    🌐 CLIENT REQUESTS
                           │
                           ▼
    ┌─────────────────────────────────────────────────────────────┐
    │                    🎯 CONTROLLER LAYER                      │
    │  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────┐ │
    │  │ CategoryController│  │ CourseController │  │HealthController│ │
    │  │   (Categories)   │  │    (Courses)    │  │  (Monitor)  │ │
    │  └─────────┬───────┘  └─────────┬───────┘  └─────────────┘ │
    └────────────┼──────────────────────┼──────────────────────────┘
                 │                      │
                 ▼                      ▼
    ┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
    │       DTO       │◄──►│   Validation    │◄──►│   Exception     │
    │  (CategoryDTO)  │    │   (Jakarta)     │    │   (Handlers)    │
    │   (CourseDTO)   │    │ Bean Validation │    │ GlobalException │
    └─────────────────┘    └─────────────────┘    └─────────────────┘
                 │
                 ▼
    ┌─────────────────────────────────────────────────────────────┐
    │                    ⚡ SERVICE LAYER                          │
    │  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────┐ │
    │  │ CategoryService │  │  CourseService  │  │   Config    │ │
    │  │ (Business Logic)│  │ (Business Logic)│  │ (WebConfig) │ │
    │  └─────────┬───────┘  └─────────┬───────┘  └─────────────┘ │
    └────────────┼──────────────────────┼──────────────────────────┘
                 │                      │
                 ▼                      ▼
    ┌─────────────────────────────────────────────────────────────┐
    │                  🗄️ REPOSITORY LAYER                        │
    │  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────┐ │
    │  │CategoryRepository│  │CourseRepository │  │   JPA/ORM   │ │
    │  │  (Data Access)  │  │  (Data Access)  │  │  (Hibernate)│ │
    │  └─────────┬───────┘  └─────────┬───────┘  └─────────────┘ │
    └────────────┼──────────────────────┼──────────────────────────┘
                 │                      │
                 ▼                      ▼
    ┌─────────────────────────────────────────────────────────────┐
    │                    📊 MODEL LAYER                           │
    │  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────┐ │
    │  │    Category     │  │     Course      │  │   Related   │ │
    │  │   (Entity)      │◄─┤   (Entity)      │  │  Entities   │ │
    │  │     @Entity     │  │     @Entity     │  │(Module/etc) │ │
    │  └─────────────────┘  └─────────────────┘  └─────────────┘ │
    └─────────────────────────┼───────────────────────────────────┘
                              │
                              ▼
    ┌─────────────────────────────────────────────────────────────┐
    │                🐘 DATABASE LAYER                            │
    │                                                             │
    │        PostgreSQL 16.8 (Railway Cloud Production)          │
    │                                                             │
    │  Tables: Categories, Courses, Modules, Lessons, Resources  │
    └─────────────────────────────────────────────────────────────┘
```

### 🔗 Flujo de Datos del Course Service

1. **🌐 HTTP Request** → Controller Layer
2. **🎯 Controller** → DTO Validation & Exception Handling
3. **⚡ Service** → Business Logic Processing
4. **🗄️ Repository** → JPA/Hibernate ORM
5. **📊 Model** → Entity Mapping
6. **🐘 Database** → PostgreSQL Storage

### 🛠️ Componentes Clave

| Capa | Componentes | Responsabilidad |
|------|-------------|-----------------|
| **🎯 Controller** | CategoryController, CourseController, HealthController | Manejo de requests HTTP y responses |
| **📋 DTO** | CategoryDTO, CourseDTO | Transferencia y validación de datos |
| **⚡ Service** | CategoryService, CourseService | Lógica de negocio y reglas empresariales |
| **🗄️ Repository** | CategoryRepository, CourseRepository | Acceso a datos y operaciones CRUD |
| **📊 Model** | Category, Course, Module, Lesson, Resource | Entidades del dominio |
| **🐘 Database** | PostgreSQL en Railway | Persistencia de datos |

---

## 🧪 Testing y Validación

### 📋 Colección de Postman
Este proyecto incluye una **colección completa de Postman** con 35+ requests profesionales:

```bash
📁 postman-collection.json          # Colección principal (35+ requests)
📁 POSTMAN_GUIDE.md                # Guía detallada de uso empresarial
📁 validate_service.sh              # Script de validación automática
```

### 🗂️ Estructura de Tests
- 🏥 **Health Check & Monitoring** (2 requests)
- 🏷️ **Categories Management** (9 requests) - CRUD completo
- 📚 **Courses Management** (15 requests) - Gestión avanzada
- ❌ **Error Handling Tests** (4 requests) - Casos edge
- 🧪 **Performance & Load Tests** (2 requests) - Rendimiento
- 🔄 **Integration & Workflow Tests** (1 request) - Flujos completos
- 🔐 **Security & Validation Tests** (3 requests) - Seguridad

### 🚀 Uso de Tests
```bash
# Importar en Postman
File > Import > postman-collection.json

# Variables preconfiguradas
baseUrl: http://localhost:8082
categoryId: 1 | courseId: 1 | testInstructorId: 123
```

### ✅ Validaciones Automáticas
- Validaciones automáticas de respuesta
- Tests de códigos de estado HTTP
- Verificación de estructura JSON
- Manejo dinámico de variables
- Scripts de pre/post procesamiento

---

## 📈 Métricas y Monitoreo

### 📊 Datos de Demostración
#### 🏷️ Categorías Preconfiguradas
| ID | Categoría | Descripción | Cursos |
|----|-----------|-------------|--------|
| 1 | **💻 Programación** | Desarrollo de software empresarial | 2 |
| 2 | **🎨 Diseño** | UX/UI y diseño gráfico profesional | 2 |
| 3 | **📊 Ciencia de Datos** | Analytics y Machine Learning | 0 |
| 4 | **📈 Marketing Digital** | Estrategias digitales corporativas | 0 |

#### 📚 Cursos de Ejemplo
1. **☕ Introducción a la Programación con Java**
   - 👨‍🎓 Nivel: Principiante | ⏱️ Duración: 30 horas
   - 💰 Precio: $49.99 | ⭐ Destacado: Sí

2. **🎨 Diseño UX/UI Avanzado**
   - 👨‍🎓 Nivel: Avanzado | ⏱️ Duración: 45 horas
   - 💰 Precio: $69.99 | 💎 Premium: Sí

### 🎯 Métricas de Calidad
- **🔍 Cobertura de Funcionalidades**: 100%
- **⚡ Performance de API**: Optimizada
- **🛡️ Manejo de Errores**: Empresarial
- **📊 Calidad de Código**: Alta
- **🌐 Preparación para Producción**: Completa

### 🏥 Health Monitoring
- **📊 Health Checks**: Endpoints de salud para servicio y base de datos
- **📝 Logging Estructurado**: Logs informativos para debugging
- **🔍 Error Tracking**: Respuestas de error consistentes y detalladas
- **🗄️ Database Monitoring**: Validación automática de conexiones

---

<div align="center">

**🌟 ¡Gracias por usar EduTech Course Service! 🌟**

*Desarrollado por **Felipe López**

Para más información, visita nuestra [documentación completa](https://github.com/feliplvz/course-service)

[![API Status](https://img.shields.io/badge/API-Online-brightgreen.svg)](http://localhost:8082/)
[![Last Updated](https://img.shields.io/badge/Updated-Junio%202025-blue.svg)](https://github.com/feliplvz/course-service)
[![Developer](https://img.shields.io/badge/Developer-Felipe%20López-purple.svg)](https://github.com/feliplvz)

</div>

## 🔒 Seguridad

### 🛡️ Validaciones y Protección
- ✅ **Validación de Entrada**: Bean Validation con mensajes personalizados
- ✅ **Manejo de Excepciones**: GlobalExceptionHandler empresarial
- ✅ **Prevención de Duplicados**: Validación de nombres únicos
- ✅ **Integridad Referencial**: Validación de eliminaciones en cascada

### 🔐 Gestión de Credenciales
- ✅ **Variables de Entorno**: Credenciales nunca en código fuente
- ✅ **Archivo .env.example**: Template para configuración local
- ✅ **GitIgnore Seguro**: Archivos sensibles excluidos del repositorio
- ✅ **Separación de Entornos**: Configuraciones por ambiente

### 🌐 Configuración CORS
- ✅ **CORS Empresarial**: Configuración avanzada para integración
- ✅ **Headers Permitidos**: Content-Type, Authorization
- ✅ **Métodos HTTP**: GET, POST, PUT, PATCH, DELETE
- ✅ **Orígenes Configurables**: Para desarrollo y producción

### 🔐 Mejores Prácticas Implementadas
- ✅ **Validación Robusta**: Datos de entrada siempre validados
- ✅ **Error Handling**: Respuestas consistentes y seguras
- ✅ **SQL Injection**: Protección mediante JPA/Hibernate
- ✅ **XSS Prevention**: Validación de contenido HTML
- ✅ **Secrets Management**: Variables de entorno para credenciales
- ✅ **Environment Separation**: Configuraciones por entorno


**🔧 Configuración Segura:**
```bash
# 1. Copia el template
cp .env.example .env

# 2. Edita con tus credenciales reales
nano .env

# 3. ¡El archivo .env nunca se commitea!
```

---

### 📊 **100% DE FUNCIONALIDADES IMPLEMENTADAS**

</div>

### 🎯 Características del Microservicio
| ✅ Funcionalidad | 🎯 Estado | 📊 Cobertura |
|------------------|-----------|--------------|
| **🏷️ CRUD Categorías** | ✅ Completo | 100% |
| **📚 CRUD Cursos** | ✅ Completo | 100% |
| **🔍 Búsqueda Avanzada** | ✅ Completo | 100% |
| **⭐ Sistema de Destacados** | ✅ Completo | 100% |
| **💎 Cursos Premium** | ✅ Completo | 100% |
| **🏥 Health Monitoring** | ✅ Completo | 100% |
| **🛡️ Manejo de Errores** | ✅ Completo | 100% |
| **📄 Paginación** | ✅ Completo | 100% |
| **🗄️ Base de Datos** | ✅ Conectada | 100% |
| **🌐 CORS** | ✅ Configurado | 100% |

### 🎯 Casos de Uso Empresariales

#### 🏢 Para Empresas de E-Learning
- **📚 Gestión de Catálogo**: Administración completa de cursos corporativos
- **🏷️ Categorización**: Organización por departamentos o competencias
- **⭐ Promoción**: Sistema de cursos destacados y premium
- **🔍 Búsqueda**: Localización rápida de contenido específico

#### 🎓 Para Instituciones Educativas
- **📊 Organización Académica**: Estructura de cursos por carreras
- **👨‍🏫 Gestión Docente**: Asignación de instructores a cursos
- **📈 Analytics**: Contadores y métricas de cursos por categoría
- **🎯 Niveles**: Clasificación por dificultad académica

#### 🚀 Para Startups de EdTech
- **⚡ Desarrollo Rápido**: API lista para integración inmediata
- **🔄 Escalabilidad**: Arquitectura preparada para crecimiento
- **🌐 Cloud-Ready**: Desplegable en cualquier plataforma cloud
- **📱 API-First**: Diseño pensado para aplicaciones móviles
