package com.edutech.courseservice.repository;

import com.edutech.courseservice.model.Module;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ModuleRepository extends JpaRepository<Module, Long> {

    List<Module> findByCourseId(Long courseId);

    List<Module> findByCourseIdOrderByOrderIndexAsc(Long courseId);

    List<Module> findByCourseIdAndPublishedTrue(Long courseId);
}
