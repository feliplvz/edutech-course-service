package com.edutech.courseservice.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ResourceDTO {

    private Long id;

    @NotBlank(message = "El nombre del recurso es obligatorio")
    @Size(min = 3, max = 100, message = "El nombre debe tener entre 3 y 100 caracteres")
    private String name;

    private String description;

    @NotBlank(message = "La URL del recurso es obligatoria")
    private String resourceUrl;

    private String fileType;

    private Long fileSizeKb;

    private boolean downloadable;

    private LocalDateTime createdAt;

    private LocalDateTime updatedAt;

    private Long lessonId;

    private String lessonTitle;
}
