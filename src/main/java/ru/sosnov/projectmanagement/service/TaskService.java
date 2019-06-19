package ru.sosnov.projectmanagement.service;

import ru.sosnov.projectmanagement.dto.TaskDTO;
import ru.sosnov.projectmanagement.model.Project;
import ru.sosnov.projectmanagement.model.Task;
import ru.sosnov.projectmanagement.model.User;

import java.util.List;

public interface TaskService {

    List<Task> getAll();
    Task findOne(Long id);
    Task save(TaskDTO taskDTO);
    void delete(Long id);
    Task update(TaskDTO taskDTO);

    List<Task> getMy(User current);
    List<Task> getProjects(Project project);
}
