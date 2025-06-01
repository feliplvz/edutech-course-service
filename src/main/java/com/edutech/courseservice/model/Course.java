package com.edutech.courseservice.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.PositiveOrZero;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "courses")
public class Course {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "El título del curso es obligatorio")
    @Size(min = 5, max = 100, message = "El título debe tener entre 5 y 100 caracteres")
    @Column(nullable = false)
    private String title;

    @Column(columnDefinition = "TEXT")
    private String description;

    @Column(columnDefinition = "TEXT")
    private String objectives;

    @Column(columnDefinition = "TEXT")
    private String requirements;

    @NotNull
    @Column(name = "duration_hours", nullable = false)
    private Integer durationHours;

    @PositiveOrZero(message = "El precio no puede ser negativo")
    private BigDecimal price;

    @Column(name = "discount_percentage")
    private Integer discountPercentage;

    @Column(name = "image_url")
    private String imageUrl;

    @Column(name = "instructor_id")
    private Long instructorId;

    @Column(nullable = false)
    private String level = "BEGINNER"; // BEGINNER, INTERMEDIATE, ADVANCED

    @Column(nullable = false)
    private String status = "DRAFT"; // DRAFT, PUBLISHED, ARCHIVED

    @Column(name = "is_featured", nullable = false)
    private boolean featured = false;

    @Column(name = "is_premium", nullable = false)
    private boolean premium = false;

    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    @Column(name = "published_at")
    private LocalDateTime publishedAt;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "category_id")
    private Category category;

    @OneToMany(mappedBy = "course", cascade = CascadeType.ALL, orphanRemoval = true)
    @OrderBy("orderIndex")
    private List<Module> modules = new ArrayList<>();

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }
}
