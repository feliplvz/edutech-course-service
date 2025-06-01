package com.edutech.courseservice.controller;

import com.edutech.courseservice.dto.CourseDTO;
import com.edutech.courseservice.service.CourseService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/courses")
public class CourseController {

    private final CourseService courseService;

    @Autowired
    public CourseController(CourseService courseService) {
        this.courseService = courseService;
    }

    @GetMapping
    public ResponseEntity<List<CourseDTO>> getAllCourses() {
        return ResponseEntity.ok(courseService.getAllCourses());
    }

    @GetMapping("/paginated")
    public ResponseEntity<Page<CourseDTO>> getCoursesPaginated(
            @PageableDefault(size = 10, sort = {"createdAt"}) Pageable pageable) {
        return ResponseEntity.ok(courseService.getCoursesPaginated(pageable));
    }

    @GetMapping("/{id}")
    public ResponseEntity<CourseDTO> getCourseById(@PathVariable Long id) {
        return ResponseEntity.ok(courseService.getCourseById(id));
    }

    @GetMapping("/category/{categoryId}")
    public ResponseEntity<List<CourseDTO>> getCoursesByCategory(@PathVariable Long categoryId) {
        return ResponseEntity.ok(courseService.getCoursesByCategory(categoryId));
    }

    @GetMapping("/instructor/{instructorId}")
    public ResponseEntity<List<CourseDTO>> getCoursesByInstructor(@PathVariable Long instructorId) {
        return ResponseEntity.ok(courseService.getCoursesByInstructor(instructorId));
    }

    @GetMapping("/level/{level}")
    public ResponseEntity<List<CourseDTO>> getCoursesByLevel(@PathVariable String level) {
        return ResponseEntity.ok(courseService.getCoursesByLevel(level));
    }

    @GetMapping("/featured")
    public ResponseEntity<List<CourseDTO>> getFeaturedCourses() {
        return ResponseEntity.ok(courseService.getFeaturedCourses());
    }

    @GetMapping("/premium")
    public ResponseEntity<List<CourseDTO>> getPremiumCourses() {
        return ResponseEntity.ok(courseService.getPremiumCourses());
    }

    @GetMapping("/search")
    public ResponseEntity<Page<CourseDTO>> searchCourses(
            @RequestParam String keyword,
            @PageableDefault(size = 10) Pageable pageable) {
        return ResponseEntity.ok(courseService.searchCourses(keyword, pageable));
    }

    @PostMapping
    public ResponseEntity<CourseDTO> createCourse(@Valid @RequestBody CourseDTO courseDTO) {
        return new ResponseEntity<>(courseService.createCourse(courseDTO), HttpStatus.CREATED);
    }

    @PutMapping("/{id}")
    public ResponseEntity<CourseDTO> updateCourse(
            @PathVariable Long id,
            @Valid @RequestBody CourseDTO courseDTO) {
        return ResponseEntity.ok(courseService.updateCourse(id, courseDTO));
    }

    @PatchMapping("/{id}/publish")
    public ResponseEntity<CourseDTO> publishCourse(@PathVariable Long id) {
        return ResponseEntity.ok(courseService.publishCourse(id));
    }

    @PatchMapping("/{id}/archive")
    public ResponseEntity<CourseDTO> archiveCourse(@PathVariable Long id) {
        return ResponseEntity.ok(courseService.archiveCourse(id));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteCourse(@PathVariable Long id) {
        courseService.deleteCourse(id);
        return ResponseEntity.noContent().build();
    }
}
