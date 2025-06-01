package com.edutech.courseservice.service.impl;

import com.edutech.courseservice.dto.CourseDTO;
import com.edutech.courseservice.exception.ResourceNotFoundException;
import com.edutech.courseservice.model.Category;
import com.edutech.courseservice.model.Course;
import com.edutech.courseservice.repository.CategoryRepository;
import com.edutech.courseservice.repository.CourseRepository;
import com.edutech.courseservice.repository.ModuleRepository;
import com.edutech.courseservice.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class CourseServiceImpl implements CourseService {

    private final CourseRepository courseRepository;
    private final CategoryRepository categoryRepository;
    private final ModuleRepository moduleRepository;

    @Autowired
    public CourseServiceImpl(CourseRepository courseRepository,
                           CategoryRepository categoryRepository,
                           ModuleRepository moduleRepository) {
        this.courseRepository = courseRepository;
        this.categoryRepository = categoryRepository;
        this.moduleRepository = moduleRepository;
    }

    @Override
    public List<CourseDTO> getAllCourses() {
        return courseRepository.findAll().stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }

    @Override
    public Page<CourseDTO> getCoursesPaginated(Pageable pageable) {
        return courseRepository.findAll(pageable)
                .map(this::convertToDTO);
    }

    @Override
    public CourseDTO getCourseById(Long id) {
        Course course = courseRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Curso", "id", id));
        return convertToDTO(course);
    }

    @Override
    public List<CourseDTO> getCoursesByCategory(Long categoryId) {
        if (!categoryRepository.existsById(categoryId)) {
            throw new ResourceNotFoundException("Categoría", "id", categoryId);
        }
        return courseRepository.findByCategoryId(categoryId).stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }

    @Override
    public List<CourseDTO> getCoursesByInstructor(Long instructorId) {
        return courseRepository.findByInstructorId(instructorId).stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }

    @Override
    public List<CourseDTO> getCoursesByLevel(String level) {
        return courseRepository.findByLevel(level).stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }

    @Override
    public List<CourseDTO> getFeaturedCourses() {
        return courseRepository.findByFeaturedTrue().stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }

    @Override
    public List<CourseDTO> getPremiumCourses() {
        return courseRepository.findByPremiumTrue().stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }

    @Override
    public Page<CourseDTO> searchCourses(String keyword, Pageable pageable) {
        return courseRepository.searchByKeyword(keyword, pageable)
                .map(this::convertToDTO);
    }

    @Override
    @Transactional
    public CourseDTO createCourse(CourseDTO courseDTO) {
        Category category = null;
        if (courseDTO.getCategoryId() != null) {
            category = categoryRepository.findById(courseDTO.getCategoryId())
                    .orElseThrow(() -> new ResourceNotFoundException("Categoría", "id", courseDTO.getCategoryId()));
        }

        Course course = new Course();
        updateCourseFromDTO(course, courseDTO);
        course.setCategory(category);
        course.setStatus("DRAFT");

        Course savedCourse = courseRepository.save(course);
        return convertToDTO(savedCourse);
    }

    @Override
    @Transactional
    public CourseDTO updateCourse(Long id, CourseDTO courseDTO) {
        Course course = courseRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Curso", "id", id));

        Category category = null;
        if (courseDTO.getCategoryId() != null) {
            category = categoryRepository.findById(courseDTO.getCategoryId())
                    .orElseThrow(() -> new ResourceNotFoundException("Categoría", "id", courseDTO.getCategoryId()));
        }

        updateCourseFromDTO(course, courseDTO);
        course.setCategory(category);

        Course updatedCourse = courseRepository.save(course);
        return convertToDTO(updatedCourse);
    }

    @Override
    @Transactional
    public CourseDTO publishCourse(Long id) {
        Course course = courseRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Curso", "id", id));

        // Validación básica antes de publicar
        if (course.getTitle() == null || course.getDescription() == null || course.getCategory() == null) {
            throw new IllegalStateException("El curso no está listo para ser publicado. Faltan datos esenciales.");
        }

        course.setStatus("PUBLISHED");
        course.setPublishedAt(LocalDateTime.now());

        Course publishedCourse = courseRepository.save(course);
        return convertToDTO(publishedCourse);
    }

    @Override
    @Transactional
    public CourseDTO archiveCourse(Long id) {
        Course course = courseRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Curso", "id", id));

        course.setStatus("ARCHIVED");

        Course archivedCourse = courseRepository.save(course);
        return convertToDTO(archivedCourse);
    }

    @Override
    @Transactional
    public void deleteCourse(Long id) {
        Course course = courseRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Curso", "id", id));

        courseRepository.delete(course);
    }

    // Método privado para actualizar un curso a partir de un DTO
    private void updateCourseFromDTO(Course course, CourseDTO courseDTO) {
        course.setTitle(courseDTO.getTitle());
        course.setDescription(courseDTO.getDescription());
        course.setObjectives(courseDTO.getObjectives());
        course.setRequirements(courseDTO.getRequirements());
        course.setDurationHours(courseDTO.getDurationHours());
        course.setPrice(courseDTO.getPrice());
        course.setDiscountPercentage(courseDTO.getDiscountPercentage());
        course.setImageUrl(courseDTO.getImageUrl());
        course.setInstructorId(courseDTO.getInstructorId());
        course.setLevel(courseDTO.getLevel());
        course.setFeatured(courseDTO.isFeatured());
        course.setPremium(courseDTO.isPremium());
    }

    // Método para convertir una entidad Course a un DTO
    private CourseDTO convertToDTO(Course course) {
        CourseDTO courseDTO = new CourseDTO();
        courseDTO.setId(course.getId());
        courseDTO.setTitle(course.getTitle());
        courseDTO.setDescription(course.getDescription());
        courseDTO.setObjectives(course.getObjectives());
        courseDTO.setRequirements(course.getRequirements());
        courseDTO.setDurationHours(course.getDurationHours());
        courseDTO.setPrice(course.getPrice());
        courseDTO.setDiscountPercentage(course.getDiscountPercentage());
        courseDTO.setImageUrl(course.getImageUrl());
        courseDTO.setInstructorId(course.getInstructorId());
        courseDTO.setLevel(course.getLevel());
        courseDTO.setStatus(course.getStatus());
        courseDTO.setFeatured(course.isFeatured());
        courseDTO.setPremium(course.isPremium());
        courseDTO.setCreatedAt(course.getCreatedAt());
        courseDTO.setUpdatedAt(course.getUpdatedAt());
        courseDTO.setPublishedAt(course.getPublishedAt());

        if (course.getCategory() != null) {
            courseDTO.setCategoryId(course.getCategory().getId());
            courseDTO.setCategoryName(course.getCategory().getName());
        }

        // Contar módulos y lecciones
        courseDTO.setModuleCount(course.getModules().size());

        int lessonCount = course.getModules().stream()
                .mapToInt(module -> module.getLessons().size())
                .sum();
        courseDTO.setLessonCount(lessonCount);

        return courseDTO;
    }
}
