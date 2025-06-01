package com.edutech.courseservice.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.PositiveOrZero;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CourseDTO {

    private Long id;

    @NotBlank(message = "El título del curso es obligatorio")
    @Size(min = 5, max = 100, message = "El título debe tener entre 5 y 100 caracteres")
    private String title;

    private String description;

    private String objectives;

    private String requirements;

    @NotNull
    private Integer durationHours;

    @PositiveOrZero(message = "El precio no puede ser negativo")
    private BigDecimal price;

    private Integer discountPercentage;

    private String imageUrl;

    private Long instructorId;

    private String instructorName;

    private String level;

    private String status;

    private boolean featured;

    private boolean premium;

    private LocalDateTime createdAt;

    private LocalDateTime updatedAt;

    private LocalDateTime publishedAt;

    private Long categoryId;

    private String categoryName;

    private int moduleCount;

    private int lessonCount;
}
