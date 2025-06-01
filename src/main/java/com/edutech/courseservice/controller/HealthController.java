package com.edutech.courseservice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.sql.DataSource;
import java.sql.Connection;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/health")
public class HealthController {

    @Autowired
    private DataSource dataSource;

    @GetMapping
    public ResponseEntity<Map<String, Object>> health() {
        Map<String, Object> healthStatus = new HashMap<>();
        
        healthStatus.put("service", "course-service");
        healthStatus.put("status", "UP");
        healthStatus.put("timestamp", LocalDateTime.now());
        healthStatus.put("version", "1.0.0");
        
        return ResponseEntity.ok(healthStatus);
    }

    @GetMapping("/db")
    public ResponseEntity<Map<String, Object>> databaseHealth() {
        Map<String, Object> dbStatus = new HashMap<>();
        
        try (Connection connection = dataSource.getConnection()) {
            if (connection.isValid(2)) {
                dbStatus.put("database", "PostgreSQL");
                dbStatus.put("status", "UP");
                dbStatus.put("connection", "OK");
            } else {
                dbStatus.put("database", "PostgreSQL");
                dbStatus.put("status", "DOWN");
                dbStatus.put("connection", "INVALID");
            }
        } catch (Exception e) {
            dbStatus.put("database", "PostgreSQL");
            dbStatus.put("status", "DOWN");
            dbStatus.put("error", e.getMessage());
        }
        
        dbStatus.put("timestamp", LocalDateTime.now());
        
        return ResponseEntity.ok(dbStatus);
    }
}
