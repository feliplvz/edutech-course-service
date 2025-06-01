package com.edutech.courseservice.repository;

import com.edutech.courseservice.model.Resource;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ResourceRepository extends JpaRepository<Resource, Long> {

    List<Resource> findByLessonId(Long lessonId);

    List<Resource> findByFileType(String fileType);

    List<Resource> findByDownloadableTrue();
}
