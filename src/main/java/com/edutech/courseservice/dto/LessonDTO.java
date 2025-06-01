package com.edutech.courseservice.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.PositiveOrZero;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LessonDTO {

    private Long id;

    @NotBlank(message = "El título de la lección es obligatorio")
    @Size(min = 3, max = 100, message = "El título debe tener entre 3 y 100 caracteres")
    private String title;

    private String content;

    @PositiveOrZero
    private Integer orderIndex;

    private Integer durationMinutes;

    private String videoUrl;

    private boolean published;

    private String type;

    private LocalDateTime createdAt;

    private LocalDateTime updatedAt;

    private Long moduleId;

    private String moduleTitle;

    private Long courseId;

    private int resourceCount;
}
