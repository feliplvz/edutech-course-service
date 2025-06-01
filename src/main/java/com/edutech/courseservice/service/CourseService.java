package com.edutech.courseservice.service;

import com.edutech.courseservice.dto.CourseDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface CourseService {

    List<CourseDTO> getAllCourses();

    Page<CourseDTO> getCoursesPaginated(Pageable pageable);

    CourseDTO getCourseById(Long id);

    List<CourseDTO> getCoursesByCategory(Long categoryId);

    List<CourseDTO> getCoursesByInstructor(Long instructorId);

    List<CourseDTO> getCoursesByLevel(String level);

    List<CourseDTO> getFeaturedCourses();

    List<CourseDTO> getPremiumCourses();

    Page<CourseDTO> searchCourses(String keyword, Pageable pageable);

    CourseDTO createCourse(CourseDTO courseDTO);

    CourseDTO updateCourse(Long id, CourseDTO courseDTO);

    CourseDTO publishCourse(Long id);

    CourseDTO archiveCourse(Long id);

    void deleteCourse(Long id);
}
