package com.edutech.courseservice.service.impl;

import com.edutech.courseservice.dto.CategoryDTO;
import com.edutech.courseservice.exception.ResourceNotFoundException;
import com.edutech.courseservice.model.Category;
import com.edutech.courseservice.repository.CategoryRepository;
import com.edutech.courseservice.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class CategoryServiceImpl implements CategoryService {

    private final CategoryRepository categoryRepository;

    @Autowired
    public CategoryServiceImpl(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @Override
    public List<CategoryDTO> getAllCategories() {
        return categoryRepository.findAll().stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }

    @Override
    public CategoryDTO getCategoryById(Long id) {
        Category category = categoryRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Categoría", "id", id));
        return convertToDTO(category);
    }

    @Override
    public CategoryDTO getCategoryByName(String name) {
        Category category = categoryRepository.findByName(name)
                .orElseThrow(() -> new ResourceNotFoundException("Categoría", "nombre", name));
        return convertToDTO(category);
    }

    @Override
    public CategoryDTO createCategory(CategoryDTO categoryDTO) {
        if (categoryRepository.existsByName(categoryDTO.getName())) {
            throw new IllegalArgumentException("Ya existe una categoría con este nombre");
        }

        Category category = new Category();
        category.setName(categoryDTO.getName());
        category.setDescription(categoryDTO.getDescription());

        Category savedCategory = categoryRepository.save(category);
        return convertToDTO(savedCategory);
    }

    @Override
    public CategoryDTO updateCategory(Long id, CategoryDTO categoryDTO) {
        Category category = categoryRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Categoría", "id", id));

        // Verificar si ya existe otra categoría con ese nombre
        if (!category.getName().equals(categoryDTO.getName()) &&
            categoryRepository.existsByName(categoryDTO.getName())) {
            throw new IllegalArgumentException("Ya existe otra categoría con este nombre");
        }

        category.setName(categoryDTO.getName());
        category.setDescription(categoryDTO.getDescription());

        Category updatedCategory = categoryRepository.save(category);
        return convertToDTO(updatedCategory);
    }

    @Override
    public void deleteCategory(Long id) {
        Category category = categoryRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Categoría", "id", id));

        // Verificar si la categoría tiene cursos asociados antes de eliminarla
        if (!category.getCourses().isEmpty()) {
            throw new IllegalStateException("No se puede eliminar una categoría con cursos asociados");
        }

        categoryRepository.delete(category);
    }

    @Override
    public boolean existsByName(String name) {
        return categoryRepository.existsByName(name);
    }

    private CategoryDTO convertToDTO(Category category) {
        CategoryDTO categoryDTO = new CategoryDTO();
        categoryDTO.setId(category.getId());
        categoryDTO.setName(category.getName());
        categoryDTO.setDescription(category.getDescription());
        
        // Usar consulta específica para obtener el contador de cursos
        Long courseCount = categoryRepository.countCoursesByCategoryId(category.getId());
        categoryDTO.setCourseCount(courseCount != null ? courseCount.intValue() : 0);
        
        return categoryDTO;
    }
}
