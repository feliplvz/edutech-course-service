package com.edutech.courseservice.repository;

import com.edutech.courseservice.model.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {
    Optional<Category> findByName(String name);
    boolean existsByName(String name);
    
    @Query("SELECT COUNT(c) FROM Course c WHERE c.category.id = :categoryId")
    Long countCoursesByCategoryId(@Param("categoryId") Long categoryId);
}
