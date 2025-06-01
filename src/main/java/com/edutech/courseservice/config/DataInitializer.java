package com.edutech.courseservice.config;

import com.edutech.courseservice.model.Category;
import com.edutech.courseservice.model.Course;
import com.edutech.courseservice.repository.CategoryRepository;
import com.edutech.courseservice.repository.CourseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;

@Component
public class DataInitializer implements CommandLineRunner {

    @Autowired
    private CategoryRepository categoryRepository;
    
    @Autowired
    private CourseRepository courseRepository;

    @Override
    public void run(String... args) throws Exception {
        // Solo crear datos si no existen categorías
        if (categoryRepository.count() == 0) {
            initializeData();
            System.out.println("✅ Datos de ejemplo inicializados correctamente");
        } else {
            System.out.println("ℹ️ Los datos de ejemplo ya existen, omitiendo inicialización");
        }
    }

    private void initializeData() {
        // Crear categorías
        Category programming = new Category();
        programming.setName("Programación");
        programming.setDescription("Cursos de desarrollo de software");
        programming = categoryRepository.save(programming);

        Category design = new Category();
        design.setName("Diseño");
        design.setDescription("Cursos de diseño gráfico y UX/UI");
        design = categoryRepository.save(design);

        Category dataSci = new Category();
        dataSci.setName("Ciencia de Datos");
        dataSci.setDescription("Cursos de análisis y ciencia de datos");
        dataSci = categoryRepository.save(dataSci);

        Category marketing = new Category();
        marketing.setName("Marketing Digital");
        marketing.setDescription("Cursos de marketing y estrategias digitales");
        marketing = categoryRepository.save(marketing);

        // Crear cursos de ejemplo
        Course javaCourse = new Course();
        javaCourse.setTitle("Introducción a la Programación con Java");
        javaCourse.setDescription("Curso básico para aprender Java desde cero");
        javaCourse.setObjectives("Aprender los conceptos básicos de programación y Java");
        javaCourse.setRequirements("Ningún conocimiento previo requerido");
        javaCourse.setDurationHours(30);
        javaCourse.setPrice(BigDecimal.valueOf(49.99));
        javaCourse.setImageUrl("https://example.com/java.jpg");
        javaCourse.setLevel("BEGINNER");
        javaCourse.setStatus("PUBLISHED");
        javaCourse.setFeatured(true);
        javaCourse.setCategory(programming);
        courseRepository.save(javaCourse);

        Course uxCourse = new Course();
        uxCourse.setTitle("Diseño UX/UI Avanzado");
        uxCourse.setDescription("Aprende técnicas avanzadas de diseño de experiencia de usuario");
        uxCourse.setObjectives("Dominar herramientas y metodologías de diseño UX/UI");
        uxCourse.setRequirements("Conocimientos básicos de diseño");
        uxCourse.setDurationHours(45);
        uxCourse.setPrice(BigDecimal.valueOf(69.99));
        uxCourse.setImageUrl("https://example.com/uxui.jpg");
        uxCourse.setLevel("ADVANCED");
        uxCourse.setStatus("PUBLISHED");
        uxCourse.setFeatured(true);
        uxCourse.setPremium(true);
        uxCourse.setCategory(design);
        courseRepository.save(uxCourse);
    }
}
