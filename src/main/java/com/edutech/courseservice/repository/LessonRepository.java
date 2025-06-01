package com.edutech.courseservice.repository;

import com.edutech.courseservice.model.Lesson;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LessonRepository extends JpaRepository<Lesson, Long> {

    List<Lesson> findByModuleId(Long moduleId);

    List<Lesson> findByModuleIdOrderByOrderIndexAsc(Long moduleId);

    List<Lesson> findByModuleIdAndPublishedTrue(Long moduleId);

    List<Lesson> findByType(String type);
}
