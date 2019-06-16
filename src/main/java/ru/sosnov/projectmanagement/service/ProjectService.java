package ru.sosnov.projectmanagement.service;

import ru.sosnov.projectmanagement.dto.ProjectDTO;
import ru.sosnov.projectmanagement.model.Project;

import java.util.List;

public interface ProjectService {

    List<Project> getAll();
    Project findOne(Long id);
    Project save(ProjectDTO projectDTO);
    void delete(Long id);
    Project update(ProjectDTO projectDTO);
}
