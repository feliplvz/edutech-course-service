package com.edutech.courseservice.repository;

import com.edutech.courseservice.model.Course;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CourseRepository extends JpaRepository<Course, Long> {

    List<Course> findByCategoryId(Long categoryId);

    List<Course> findByInstructorId(Long instructorId);

    List<Course> findByLevel(String level);

    List<Course> findByStatus(String status);

    List<Course> findByFeaturedTrue();

    List<Course> findByPremiumTrue();

    @Query("SELECT c FROM Course c WHERE LOWER(c.title) LIKE LOWER(CONCAT('%', :keyword, '%')) OR LOWER(c.description) LIKE LOWER(CONCAT('%', :keyword, '%'))")
    Page<Course> searchByKeyword(@Param("keyword") String keyword, Pageable pageable);

    @Query("SELECT c FROM Course c WHERE c.category.id = :categoryId AND c.status = 'PUBLISHED'")
    List<Course> findPublishedByCategoryId(@Param("categoryId") Long categoryId);
}
