package ru.sosnov.projectmanagement.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.sosnov.projectmanagement.model.Project;

public interface ProjectRepository extends JpaRepository<Project, Long> {
}
