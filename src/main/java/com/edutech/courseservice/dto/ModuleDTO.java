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
public class ModuleDTO {

    private Long id;

    @NotBlank(message = "El título del módulo es obligatorio")
    @Size(min = 3, max = 100, message = "El título debe tener entre 3 y 100 caracteres")
    private String title;

    private String description;

    @PositiveOrZero
    private Integer orderIndex;

    private boolean published;

    private LocalDateTime createdAt;

    private LocalDateTime updatedAt;

    private Long courseId;

    private String courseTitle;

    private int lessonCount;
}
