# 🚀 EduTech - Guía de Testing de la API Course Service

<div align="center">

[![Java](https://img.shields.io/badge/Java-17-orange.svg)](https://openjdk.java.net/projects/jdk/17/)
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.5.0-brightgreen.svg)](https://spring.io/projects/spring-boot)
[![Postman](https://img.shields.io/badge/Postman-37%2B%20Tests-orange.svg)](./postman-collection.json)
[![Status](https://img.shields.io/badge/Status-✅%20Verified-success.svg)](http://localhost:8082/)
[![Tests](https://img.shields.io/badge/Tests-✅%20Passed-success.svg)](./postman-collection.json)

**🎯 Guía Empresarial de Testing para Microservicio Course Service**

*Colección con 37+ tests automatizados*

*Desarrollado por **Felipe López** 🌟

</div>

---

## 🎯 Descripción

Esta **guía de testing empresarial** documenta la colección completa de Postman con **37+ requests profesionales** para validar el microservicio Course Service de EduTech. Incluye casos de prueba positivos, negativos, tests de seguridad, performance y flujos de integración completos. **Completamente traducida al español** con emojis profesionales para equipos de desarrollo hispanohablantes.

### 🎯 Propósito de la Guía

- **🧪 Testing Empresarial**: Validación completa de API REST con estándares corporativos
- **🔄 Automatización**: Tests automatizados con scripts de validación  
- **📊 Cobertura Completa**: 100% de endpoints con casos edge incluidos
- **🏢 Casos Reales**: Escenarios de uso empresarial y corporativo

### 📊 Estadísticas de Testing

- ✅ **37+ Requests** completamente validados
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
- **🏥 Monitoreo de Salud**: Tests de monitoreo de salud del servicio y BD
- **🛡️ Testing de Seguridad**: Validación contra SQL injection, XSS y ataques comunes
- **⚡ Testing de Performance**: Tests de tiempo de respuesta y carga
- **❌ Manejo de Errores**: Validación de manejo de errores y casos edge
- **🎯 Emojis Profesionales**: Identificación visual clara de cada tipo de test

### 🚀 Infraestructura de Testing
- **📋 Postman Collection**: Archivo JSON completamente configurado
- **🎯 Environment Variables**: Variables preconfiguradas para diferentes entornos
- **🔄 Test Scripts**: Scripts automatizados de pre/post procesamiento
- **📊 Reporting**: Validaciones detalladas con mensajes descriptivos

---

## 🗂️ Estructura de la Colección

### 🏥 1. Monitoreo de Salud (2 Requests)
- **📊 Estado del Servicio**: Verificar estado general del microservicio
- **🗄️ Estado de la Base de Datos**: Comprobar conexión a PostgreSQL en Railway

### 🏷️ 2. Gestión de Categorías (9 Requests)
- **📋 Listar Todas las Categorías**: Listar todas las categorías con contador de cursos
- **🔍 Obtener Categoría por ID**: Obtener categoría específica por ID
- **🏷️ Obtener Categoría por Nombre**: Buscar categoría por nombre exacto
- **✅ Verificar Existencia de Nombre de Categoría**: Verificar existencia de nombre
- **➕ Crear Nueva Categoría**: Crear categoría con validaciones completas
- **❌ Crear Categoría - Nombre Duplicado**: Test de error para nombres duplicados
- **❌ Crear Categoría - Datos Inválidos**: Test de validación de datos
- **✏️ Actualizar Categoría**: Actualizar categoría existente
- **🗑️ Eliminar Categoría**: Eliminar categoría con validación automática

### 📚 3. Gestión de Cursos (15 Requests)
- **📚 Listar Todos los Cursos**: Listar todos los cursos disponibles
- **📄 Obtener Cursos Paginados**: Paginación avanzada con ordenamiento
- **🔍 Obtener Curso por ID**: Obtener curso específico por ID
- **🏷️ Obtener Cursos por Categoría**: Filtrar cursos por categoría
- **👨‍🏫 Obtener Cursos por Instructor**: Filtrar cursos por instructor
- **📊 Obtener Cursos por Nivel**: Filtrar por nivel de dificultad
- **⭐ Obtener Cursos Destacados**: Obtener cursos destacados
- **💎 Obtener Cursos Premium**: Obtener cursos premium
- **🔍 Buscar Cursos por Palabra Clave**: Búsqueda inteligente con paginación
- **➕ Crear Nuevo Curso**: Crear curso completo con validaciones
- **❌ Crear Curso - Datos Inválidos**: Test de validación de datos
- **✏️ Actualizar Curso**: Actualizar curso existente completo
- **📢 Publicar Curso**: Cambiar estado a PUBLISHED
- **📦 Archivar Curso**: Cambiar estado a ARCHIVED
- **🗑️ Eliminar Curso**: Eliminar curso con validaciones

### ❌ 4. Pruebas de Manejo de Errores (4 Requests)
- **🔍 Obtener Categoría Inexistente**: Test 404 para categoría inexistente
- **🔍 Obtener Curso Inexistente**: Test 404 para curso inexistente
- **❌ Eliminar Categoría con Cursos**: Test de restricción de integridad
- **❌ Formato JSON Inválido**: Test de JSON malformado

### 🧪 5. Pruebas de Rendimiento y Carga (2 Requests)
- **⚡ Test de Carga - Obtener Todas las Categorías**: Test de tiempo de respuesta
- **⚡ Test de Carga - Búsqueda de Cursos**: Test de performance de búsqueda

### 🔄 6. Pruebas de Integración y Flujos de Trabajo (2 Requests)
- **🎯 Ciclo de Vida Completo del Curso**: Flujo completo de CRUD empresarial
- **🔄 Verificación de Consistencia de Base de Datos**: Verificar integridad de datos

### 🔐 7. Pruebas de Seguridad y Validación (3 Requests)
- **🚫 Prevención de Inyección SQL**: Test de seguridad contra SQL injection
- **🛡️ Validación de Entrada - Prevención XSS**: Test de prevención de Cross-Site Scripting
- **📊 Test de Payload Grande**: Test de manejo de payloads grandes

---

## 📊 Endpoints Cubiertos (100% Cobertura)

### 🏥 Monitoreo de Salud

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
1. Hacer clic derecho en "🎓 Course Service API - Suite de Pruebas"
2. Seleccionar "Run collection"
3. Configurar:
   - **Iterations**: 1 (para testing funcional)
   - **Delay**: 100ms (para evitar sobrecarga)
   - **Data**: Ninguno (usa variables predefinidas)
4. Hacer clic en "Run Course Service API"
5. **Resultado Esperado**: 37+ tests pasando exitosamente

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

#### 🏥 Tests de Monitoreo de Salud
- Verificación de estado `UP` del microservicio
- Validación de conexión exitosa a PostgreSQL
- Control de tiempo de respuesta < 500ms

#### 🏷️ Tests de Gestión de Categorías  
- Validación de estructura CategoryDTO completa
- Verificación de contador de cursos automático
- Tests de duplicación de nombres (409 Conflict)
- Validación de eliminación con restricciones de integridad

#### 📚 Tests de Gestión de Cursos
- Validación de estructura CourseDTO con todas las propiedades
- Tests de estados (DRAFT, PUBLISHED, ARCHIVED)
- Verificación de campos featured y premium
- Validación de relaciones con categorías

#### ❌ Tests de Manejo de Errores
- Validación de responses 404 con mensajes descriptivos
- Tests de JSON malformado (400 Bad Request)
- Verificación de restricciones de base de datos

#### 🔐 Tests de Seguridad y Performance
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
✅ Monitoreo de Salud
✅ Gestión de Categorías (CRUD básico)
✅ Gestión de Cursos (funcionalidades core)

Tiempo estimado: 3-5 minutos
```

### 🧪 Para Control de Calidad (QA)
```bash
# Ejecutar suite completa incluyendo edge cases
Carpetas recomendadas:
✅ Toda la colección (37+ requests)
✅ Enfoque especial en Pruebas de Manejo de Errores
✅ Pruebas de Seguridad y Validación completas

Tiempo estimado: 8-12 minutos
```

### ⚡ Para DevOps y Monitoreo (OPS)
```bash
# Ejecutar tests de health check y performance
Carpetas recomendadas:
✅ Monitoreo de Salud
✅ Pruebas de Rendimiento y Carga
✅ Pruebas de Integración y Flujos de Trabajo

Tiempo estimado: 2-3 minutos
```

### 🔄 Para Testing de Integración (INTEGRATION)
```bash
# Ejecutar flujos completos end-to-end
Carpetas recomendadas:
✅ Ciclo de Vida Completo del Curso
✅ Pruebas de Integración y Flujos de Trabajo
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
- **Ejecución por deployment**: Suite completa (37+ tests)
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
[![Collection](https://img.shields.io/badge/Postman-37%2B%20Tests-orange.svg)](./postman-collection.json)
[![Documentation](https://img.shields.io/badge/Docs-Complete-blue.svg)](./README.md)
[![Last Updated](https://img.shields.io/badge/Updated-Junio%202025-blue.svg)](https://github.com/feliplvz/course-service)
[![Developer](https://img.shields.io/badge/Developer-Felipe%20López-purple.svg)](https://github.com/feliplvz)

</div>

---