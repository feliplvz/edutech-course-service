# 🚀 EduTech - Guía de Testing de la API Course Service

<div align="center">

[![Java](https://img.shields.io/badge/Java-17-orange.svg)](https://openjdk.java.net/projects/jdk/17/)
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.5.0-brightgreen.svg)](https://spring.io/projects/spring-boot)
[![Postman](https://img.shields.io/badge/Postman-35%2B%20Tests-orange.svg)](./postman-collection.json)
[![Status](https://img.shields.io/badge/Status-✅%20Verified-success.svg)](http://localhost:8082/)
[![Tests](https://img.shields.io/badge/Tests-✅%20Passed-success.svg)](./postman-collection.json)

**🎯 Guía Empresarial de Testing para Microservicio Course Service**

*Desarrollado por **Felipe López** 🌟

</div>

---

## 🎯 Descripción

Esta **guía de testing empresarial** documenta la colección completa de Postman con **35+ requests profesionales** para validar el microservicio Course Service de EduTech. Incluye casos de prueba positivos, negativos, tests de seguridad, performance y flujos de integración completos.

### 🎯 Propósito de la Guía

- **🧪 Testing Empresarial**: Validación completa de API REST con estándares corporativos
- **🔄 Automatización**: Tests automatizados con scripts de validación  
- **📊 Cobertura Completa**: 100% de endpoints con casos edge incluidos
- **🏢 Casos Reales**: Escenarios de uso empresarial y corporativo

### 📊 Estadísticas de Testing

- ✅ **35+ Requests** completamente validados
- ✅ **15+ Endpoints** con cobertura 100%
- ✅ **7 Categorías** de testing organizadas
- ✅ **100% Automatización** con validaciones
- ✅ **Security Tests** incluidos
- ✅ **Performance Tests** integrados

---

## ✨ Características de la Colección

### 🏢 Testing Empresarial
- **🧪 Validaciones Automáticas**: Scripts de validación en cada request
- **📊 Cobertura Completa**: 100% de endpoints API cubiertos
- **🔄 Flujos Integrados**: Tests de workflows empresariales completos
- **🎯 Variables Dinámicas**: Gestión automática de IDs y datos de prueba

### 🛠️ Características Técnicas
- **🏥 Health Monitoring**: Tests de monitoreo de salud del servicio y BD
- **🛡️ Security Testing**: Validación contra SQL injection, XSS y ataques comunes
- **⚡ Performance Testing**: Tests de tiempo de respuesta y carga
- **❌ Error Handling**: Validación de manejo de errores y casos edge

### 🚀 Infraestructura de Testing
- **📋 Postman Collection**: Archivo JSON completamente configurado
- **🎯 Environment Variables**: Variables preconfiguradas para diferentes entornos
- **🔄 Test Scripts**: Scripts automatizados de pre/post procesamiento
- **📊 Reporting**: Validaciones detalladas con mensajes descriptivos

---

## 🗂️ Estructura de la Colección

### 🏥 1. Health Check & Monitoring (2 Requests)
- **🔍 Service Health Status**: Verificar estado general del microservicio
- **🗄️ Database Health Check**: Comprobar conexión a PostgreSQL en Railway

### 🏷️ 2. Categories Management (9 Requests)
- **📋 Get All Categories**: Listar todas las categorías con contador de cursos
- **🔍 Get Category by ID**: Obtener categoría específica por ID
- **🔤 Get Category by Name**: Buscar categoría por nombre exacto
- **✅ Check Category Name Exists**: Verificar existencia de nombre
- **➕ Create New Category**: Crear categoría con validaciones completas
- **❌ Create Category - Duplicate Name**: Test de error para nombres duplicados
- **🚫 Create Category - Invalid Data**: Test de validación de datos
- **✏️ Update Category**: Actualizar categoría existente
- **🗑️ Delete Category**: Eliminar categoría con validación automática

### 📚 3. Courses Management (15 Requests)
- **📋 Get All Courses**: Listar todos los cursos disponibles
- **📄 Get Courses Paginated**: Paginación avanzada con ordenamiento
- **🔍 Get Course by ID**: Obtener curso específico por ID
- **🏷️ Get Courses by Category**: Filtrar cursos por categoría
- **👨‍🏫 Get Courses by Instructor**: Filtrar cursos por instructor
- **📊 Get Courses by Level**: Filtrar por nivel de dificultad
- **⭐ Get Featured Courses**: Obtener cursos destacados
- **💎 Get Premium Courses**: Obtener cursos premium
- **🔍 Search Courses**: Búsqueda inteligente con paginación
- **➕ Create New Course**: Crear curso completo con validaciones
- **🚫 Create Course - Invalid Data**: Test de validación de datos
- **✏️ Update Course**: Actualizar curso existente completo
- **📤 Publish Course**: Cambiar estado a PUBLISHED
- **📦 Archive Course**: Cambiar estado a ARCHIVED
- **🗑️ Delete Course**: Eliminar curso con validaciones

### ❌ 4. Error Handling Tests (4 Requests)
- **🚫 Get Non-existent Category**: Test 404 para categoría inexistente
- **🚫 Get Non-existent Course**: Test 404 para curso inexistente
- **⚠️ Delete Category with Courses**: Test de restricción de integridad
- **🔧 Invalid JSON Format**: Test de JSON malformado

### 🧪 5. Performance & Load Tests (2 Requests)
- **⚡ Load Test - Get All Categories**: Test de tiempo de respuesta
- **🔍 Load Test - Search Courses**: Test de performance de búsqueda

### 🔄 6. Integration & Workflow Tests (1 Request)
- **🔄 Complete Course Lifecycle**: Flujo completo de CRUD empresarial

### 🔐 7. Security & Validation Tests (3 Requests)
- **🛡️ SQL Injection Prevention**: Test de seguridad contra SQL injection
- **🚫 XSS Prevention**: Test de prevención de Cross-Site Scripting
- **📦 Large Payload Test**: Test de manejo de payloads grandes

---

## 📊 Endpoints Cubiertos (100% Cobertura)

### 🏥 Health Check & Monitoring

| Método | Endpoint | Descripción | Respuesta Esperada |
|--------|----------|-------------|--------------------|
| `GET` | `/health` | Estado general del microservicio | `200 OK` |
| `GET` | `/health/db` | Estado de conexión a PostgreSQL | `200 OK` |

### 🏷️ Gestión de Categorías

| Método | Endpoint | Descripción | Respuesta Esperada |
|--------|----------|-------------|--------------------|
| `GET` | `/api/categories` | Listar categorías con contador de cursos | `200 OK` |
| `GET` | `/api/categories/{id}` | Obtener categoría específica | `200 OK` |
| `GET` | `/api/categories/name/{name}` | Buscar categoría por nombre | `200 OK` |
| `GET` | `/api/categories/exists/{name}` | Verificar existencia de nombre | `200 OK` |
| `POST` | `/api/categories` | Crear nueva categoría | `201 Created` |
| `PUT` | `/api/categories/{id}` | Actualizar categoría existente | `200 OK` |
| `DELETE` | `/api/categories/{id}` | Eliminar categoría (validación automática) | `204 No Content` |

### 📚 Gestión de Cursos

| Método | Endpoint | Descripción | Respuesta Esperada |
|--------|----------|-------------|--------------------|
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

---

## 🚀 Configuración y Uso

### 📋 Prerrequisitos de Testing
- 🔥 **Microservicio Course Service** ejecutándose en `http://localhost:8082`
- 📦 **Postman Desktop App** v9.0+ instalado
- 🗄️ **PostgreSQL Database** (Railway Cloud) conectada y funcional
- 🌐 **Conexión a Internet** para validar integraciones

### ⚙️ Variables de Entorno Configuradas

| Variable | Valor por Defecto | Descripción Empresarial |
|----------|-------------------|------------------------|
| `baseUrl` | `http://localhost:8082` | URL base del microservicio Course Service |
| `categoryId` | `1` | ID de categoría para pruebas (Programación) |
| `courseId` | `1` | ID de curso para pruebas (Java Course) |
| `newCategoryId` | (dinámico) | ID de categoría creada durante tests |
| `newCourseId` | (dinámico) | ID de curso creado durante tests |
| `testInstructorId` | `123` | ID de instructor para pruebas de filtrado |
| `searchKeyword` | `Java` | Palabra clave para tests de búsqueda |

### 🚀 Instrucciones de Despliegue

#### 1. Preparación del Entorno
```bash
# Clonar el repositorio del microservicio
git clone [repository-url]
cd course-service

# Instalar dependencias y compilar
mvn clean install

# Iniciar el microservicio
mvn spring-boot:run

# Verificar que esté funcionando
curl http://localhost:8082/health
```

#### 2. Importación de la Colección en Postman
1. **Abrir Postman Desktop**
2. **Import Collection**: Hacer clic en "Import" en la interfaz principal
3. **Seleccionar Archivo**: Elegir `postman-collection.json` del directorio del proyecto
4. **Verificar Importación**: La colección aparecerá con todas las carpetas organizadas
5. **Variables Pre-configuradas**: Todas las variables de entorno se importarán automáticamente

#### 3. Ejecución de Pruebas Empresariales

##### 🎯 Ejecutar Suite Completa (Recomendado para QA)
1. Hacer clic derecho en "Course Service API Collection"
2. Seleccionar "Run collection"
3. Configurar:
   - **Iterations**: 1 (para testing funcional)
   - **Delay**: 100ms (para evitar sobrecarga)
   - **Data**: Ninguno (usa variables predefinidas)
4. Hacer clic en "Run Course Service API"
5. **Resultado Esperado**: 35+ tests pasando exitosamente

##### 🏢 Ejecutar por Categorías Específicas
- **🚀 Para Desarrollo (Dev)**: Health Check + Categories Management
- **🧪 Para Control de Calidad (QA)**: Error Handling + Security Tests
- **⚡ Para DevOps (Ops)**: Performance Tests + Health Monitoring
- **🔄 Para Integración**: Workflow Tests + Complete Lifecycle

---

## 📊 Validaciones Automáticas Empresariales

### ✅ Tipos de Validaciones Implementadas

Cada request incluye **scripts de validación automática** que verifican:

- **🎯 Códigos de Estado HTTP**: Validación correcta de response codes (200, 201, 204, 400, 404, 409, 500)
- **📋 Estructura de Respuesta JSON**: Verificación de schemas y propiedades esperadas
- **🔢 Tipos de Datos**: Validación de integers, strings, booleans, arrays según especificación
- **⚡ Tiempos de Respuesta**: Control de performance con límites aceptables (< 2000ms)
- **🌐 Headers HTTP**: Verificación de Content-Type, CORS headers y configuraciones
- **🏢 Validaciones de Negocio**: Reglas específicas del dominio Course Service

### 🎯 Scripts de Validación por Categoría

#### 🏥 Health Check Tests
- Verificación de estado `UP` del microservicio
- Validación de conexión exitosa a PostgreSQL
- Control de tiempo de respuesta < 500ms

#### 🏷️ Categories Management Tests  
- Validación de estructura CategoryDTO completa
- Verificación de contador de cursos automático
- Tests de duplicación de nombres (409 Conflict)
- Validación de eliminación con restricciones de integridad

#### 📚 Courses Management Tests
- Validación de estructura CourseDTO con todas las propiedades
- Tests de estados (DRAFT, PUBLISHED, ARCHIVED)
- Verificación de campos featured y premium
- Validación de relaciones con categorías

#### ❌ Error Handling Tests
- Validación de responses 404 con mensajes descriptivos
- Tests de JSON malformado (400 Bad Request)
- Verificación de restricciones de base de datos

#### 🔐 Security & Performance Tests
- Validación contra SQL Injection attempts
- Tests de XSS prevention en campos de texto
- Control de performance con payloads grandes
- Verificación de CORS configuration

---

## 🎯 Casos de Uso Empresariales

### 🏢 Para Equipos de Desarrollo (DEV)
```bash
# Ejecutar tests básicos de funcionalidad diaria
Carpetas recomendadas:
✅ Health Check & Monitoring
✅ Categories Management (CRUD básico)
✅ Courses Management (funcionalidades core)

Tiempo estimado: 3-5 minutos
```

### 🧪 Para Control de Calidad (QA)
```bash
# Ejecutar suite completa incluyendo edge cases
Carpetas recomendadas:
✅ Toda la colección (35+ requests)
✅ Enfoque especial en Error Handling Tests
✅ Security & Validation Tests completos

Tiempo estimado: 8-12 minutos
```

### ⚡ Para DevOps y Monitoreo (OPS)
```bash
# Ejecutar tests de health check y performance
Carpetas recomendadas:
✅ Health Check & Monitoring
✅ Performance & Load Tests
✅ Integration & Workflow Tests

Tiempo estimado: 2-3 minutos
```

### 🔄 Para Testing de Integración (INTEGRATION)
```bash
# Ejecutar flujos completos end-to-end
Carpetas recomendadas:
✅ Complete Course Lifecycle
✅ Integration & Workflow Tests
✅ Validación de dependencias entre módulos

Tiempo estimado: 5-7 minutos
```

---

## 🚨 Códigos de Estado y Respuestas Esperadas

### 📊 Matriz de Códigos de Estado por Endpoint

| Endpoint Type | Método | Success Code | Error Codes Comunes | Casos Especiales |
|---------------|--------|--------------|---------------------|------------------|
| **Health Endpoints** | `GET` | `200 OK` | `500 Internal Server Error` | BD desconectada |
| **Categories List** | `GET` | `200 OK` | `500 Internal Server Error` | Error de BD |
| **Categories Create** | `POST` | `201 Created` | `400 Bad Request`, `409 Conflict` | Nombre duplicado |
| **Categories by ID** | `GET` | `200 OK` | `404 Not Found` | ID inexistente |
| **Categories Update** | `PUT` | `200 OK` | `400 Bad Request`, `404 Not Found` | Datos inválidos |
| **Categories Delete** | `DELETE` | `204 No Content` | `400 Bad Request`, `404 Not Found` | Con cursos asociados |
| **Courses List** | `GET` | `200 OK` | `500 Internal Server Error` | Error de BD |
| **Courses Create** | `POST` | `201 Created` | `400 Bad Request` | Validación fallida |
| **Courses by ID** | `GET` | `200 OK` | `404 Not Found` | ID inexistente |
| **Courses Search** | `GET` | `200 OK` | `400 Bad Request` | Parámetros inválidos |
| **Courses Publish/Archive** | `PATCH` | `200 OK` | `404 Not Found`, `400 Bad Request` | Estado inválido |

### 🎯 Validaciones de Negocio Específicas

#### 🏷️ Categorías
- **Nombres únicos**: No permitir duplicados (409 Conflict)
- **Longitud válida**: Entre 2 y 100 caracteres  
- **Eliminación segura**: Solo si no tiene cursos asociados
- **Contador automático**: courseCount calculado dinámicamente

#### 📚 Cursos
- **Estados válidos**: DRAFT, PUBLISHED, ARCHIVED
- **Relación con categoría**: categoryId debe existir
- **Campos opcionales**: featured, premium con defaults
- **Validación de precio**: Decimal positivo o null
- **Búsqueda inteligente**: Keyword en title y description

---

## 🔧 Troubleshooting y Resolución de Problemas

### 🚨 Problemas Comunes y Soluciones

#### ❌ Error: Connection Refused (ECONNREFUSED)
**Síntoma**: Tests fallan con error de conexión
```
Error: connect ECONNREFUSED 127.0.0.1:8082
```
**Soluciones**:
1. ✅ Verificar que el microservicio esté ejecutándose: `curl http://localhost:8082/health`
2. ✅ Revisar logs de Spring Boot para errores de inicio: `mvn spring-boot:run`
3. ✅ Verificar puerto correcto en `server.port=8082` en `application.properties`
4. ✅ Comprobar que no hay conflictos de puerto: `netstat -an | grep 8082`

#### 🗄️ Error: Database Connection Failed
**Síntoma**: Health check de DB falla, requests con error 500
```
Health check /health/db returns 500 Internal Server Error
```
**Soluciones**:
1. ✅ Verificar credenciales PostgreSQL en `application.properties`
2. ✅ Comprobar conectividad a Railway Cloud: `telnet yamabiko.proxy.rlwy.net 41638`
3. ✅ Validar configuración de datasource en logs de aplicación
4. ✅ Verificar que las tablas estén creadas correctamente

#### ⚡ Tests Fallan Intermitentemente
**Síntoma**: Tests pasan algunas veces, fallan otras
```
Timeout error or sporadic failures
```
**Soluciones**:
1. ✅ Aumentar delay entre requests a 200-500ms en Collection Runner
2. ✅ Verificar timeouts en scripts de validación: `pm.response.responseTime`
3. ✅ Revisar concurrencia en tests que crean/eliminan datos
4. ✅ Ejecutar tests individualmente para identificar conflicts

#### 📋 Validaciones Fallan Incorrectamente
**Síntoma**: Tests reportan fallos en validaciones correctas
```
AssertionError: expected response to have property 'id'
```
**Soluciones**:
1. ✅ Verificar estructura de respuesta JSON en Postman Console
2. ✅ Comprobar que variables dinámicas se están estableciendo correctamente
3. ✅ Validar que datos de prueba existen (categorías, cursos)
4. ✅ Revisar scripts de test por typos en nombres de propiedades

### 🛠️ Comandos de Diagnóstico

#### Verificación Rápida del Sistema
```bash
# 1. Verificar microservicio
curl -i http://localhost:8082/health

# 2. Verificar endpoint de categorías
curl -i http://localhost:8082/api/categories

# 3. Verificar endpoint de cursos  
curl -i http://localhost:8082/api/courses

# 4. Test de búsqueda
curl -i "http://localhost:8082/api/courses/search?keyword=Java"
```

#### Logs y Debugging
```bash
# Logs de aplicación en tiempo real
tail -f logs/course-service.log

# Verificar configuración de base de datos
grep -i "datasource" src/main/resources/application.properties

# Verificar puerto configurado
grep -i "server.port" src/main/resources/application.properties
```

---

## 📈 Métricas y Monitoreo de Testing

### 🎯 Métricas de Calidad de la Colección

La colección está diseñada para mantener estos estándares empresariales:

- **⚡ Tiempo de Respuesta**: < 2 segundos para operaciones complejas de búsqueda
- **🏥 Health Check**: < 500ms para endpoints de monitoreo
- **🎯 Tasa de Éxito**: 100% de requests deben pasar en entorno estable  
- **🛡️ Cobertura de Seguridad**: Tests específicos para vulnerabilidades comunes
- **📊 Validación de Datos**: 100% de endpoints con validación de estructura JSON
- **🔄 Flujos E2E**: Cobertura completa de workflows empresariales

### 📊 Datos de Monitoreo Recomendados

#### 🏢 Para Entornos de Desarrollo
- **Ejecución diaria**: Health checks + CRUD básico
- **Tiempo objetivo**: < 5 minutos de ejecución completa
- **Alertas**: Fallos en health checks o operaciones core

#### 🧪 Para Entornos de QA/Staging  
- **Ejecución por deployment**: Suite completa (35+ tests)
- **Tiempo objetivo**: < 15 minutos incluyendo tests de carga
- **Alertas**: Cualquier fallo en validaciones o performance

#### 🚀 Para Entornos de Producción
- **Ejecución continua**: Health monitoring + smoke tests
- **Tiempo objetivo**: < 2 minutos para tests críticos
- **Alertas**: Inmediatas para fallos de conectividad o performance

---

## 🤝 Contribuciones y Mejoras

### ➕ Cómo Agregar Nuevos Tests

Para extender la colección con nuevos casos de prueba:

#### 1. **Identificar el Caso de Uso**
- Determinar categoría apropiada (CRUD, Error Handling, Security, etc.)
- Definir objetivo específico del test
- Identificar datos de entrada y respuesta esperada

#### 2. **Crear el Request en Postman**
```javascript
// Estructura básica de test script
pm.test('Test description', function () {
    // Validaciones de response code
    pm.response.to.have.status(200);
    
    // Validaciones de contenido JSON
    const response = pm.response.json();
    pm.expect(response).to.have.property('expectedProperty');
    
    // Validaciones de performance
    pm.expect(pm.response.responseTime).to.be.below(2000);
});
```

#### 3. **Documentar en esta Guía**
- Agregar descripción del nuevo test en la sección correspondiente
- Actualizar tabla de endpoints si corresponde
- Incluir casos de error específicos si aplica
- Actualizar contadores de tests totales

#### 4. **Validar Integración**
- Ejecutar el nuevo test individualmente
- Ejecutar toda la carpeta correspondiente
- Verificar que no rompe flujos existentes
- Probar con datos de diferentes escenarios

### 🎯 Estándares de Calidad para Nuevos Tests

- ✅ **Nombrado Descriptivo**: Usar emojis y descripción clara del propósito
- ✅ **Validaciones Múltiples**: Status code + estructura JSON + tiempo de respuesta  
- ✅ **Manejo de Variables**: Usar variables de entorno y dinámicas apropiadamente
- ✅ **Documentación**: Agregar descripción en request y actualizar guía
- ✅ **Casos Edge**: Incluir validaciones para casos límite y errores

---

<div align="center">

**🌟 ¡Gracias por usar la Guía de Testing de EduTech Course Service! 🌟**

*Desarrollado por **Felipe López***

Para más información sobre el microservicio, consulta la [documentación completa del README](./README.md)

[![API Status](https://img.shields.io/badge/API-Online-brightgreen.svg)](http://localhost:8082/)
[![Collection](https://img.shields.io/badge/Postman-35%2B%20Tests-orange.svg)](./postman-collection.json)
[![Documentation](https://img.shields.io/badge/Docs-Complete-blue.svg)](./README.md)
[![Last Updated](https://img.shields.io/badge/Updated-Junio%202025-blue.svg)](https://github.com/feliplvz/course-service)
[![Developer](https://img.shields.io/badge/Developer-Felipe%20López-purple.svg)](https://github.com/feliplvz)

</div>

---