package ru.sosnov.projectmanagement.service.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import ru.sosnov.projectmanagement.dto.ProjectDTO;
import ru.sosnov.projectmanagement.model.Project;
import ru.sosnov.projectmanagement.repository.ProjectRepository;
import ru.sosnov.projectmanagement.service.ProjectService;

import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ProjectServiceImpl implements ProjectService {

    private final ProjectRepository projectRepository;

    @Override
    public List<Project> getAll() {
        return projectRepository.findAll();
    }

    @Override
    public Project findOne(Long id) {
        return null;
    }

    @Override
    public Project save(ProjectDTO projectDTO) {
        Project project = new Project();
        project.setName(projectDTO.getName());
        project.setDescription(projectDTO.getDescription());
        project.setNote(projectDTO.getNote());
        project.setStartDate(Date.from(projectDTO.getStartDate().atStartOfDay(ZoneId.systemDefault()).toInstant()));
        project.setStatus(projectDTO.getStatus());
        return projectRepository.save(project);
    }

    @Override
    public boolean delete(Long id) {
        return false;
    }

    @Override
    public Project update(ProjectDTO projectDTO) {
        return null;
    }
}
