package ru.sosnov.projectmanagement.service.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import ru.sosnov.projectmanagement.dto.TaskDTO;
import ru.sosnov.projectmanagement.model.Project;
import ru.sosnov.projectmanagement.model.Task;
import ru.sosnov.projectmanagement.model.User;
import ru.sosnov.projectmanagement.repository.ProjectRepository;
import ru.sosnov.projectmanagement.repository.TaskRepository;
import ru.sosnov.projectmanagement.repository.UserRepository;
import ru.sosnov.projectmanagement.service.TaskService;
import ru.sosnov.projectmanagement.service.UserService;

import java.util.List;

@Service
@RequiredArgsConstructor
public class TaskServiceImpl implements TaskService {

    private final UserRepository userRepository;
    private final ProjectRepository projectRepository;
    private final TaskRepository taskRepository;

    @Override
    public List<Task> getAll() {
        return taskRepository.findAll();
    }

    @Override
    public Task findOne(Long id) {
        return taskRepository.getOne(id);
    }

    @Override
    public Task save(TaskDTO taskDTO) {
        Task task = new Task();
        User user = userRepository.getOne(taskDTO.getUserId());
        Project project = projectRepository.getOne(taskDTO.getProjectId());
        task.setAssignee(user);
        task.setDescription(taskDTO.getDescription());
        task.setEndDate(taskDTO.getEndDate());
        task.setName(taskDTO.getName());
        task.setProject(project);
        task.setStatus(taskDTO.getStatus());
        return taskRepository.save(task);
    }

    @Override
    public void delete(Long id) {

    }

    @Override
    public Task update(TaskDTO taskDTO) {
        Task task = taskRepository.getOne(taskDTO.getId());
        task.setStatus(taskDTO.getStatus());
        task.setName(taskDTO.getName());
        task.setEndDate(taskDTO.getEndDate());
        task.setDescription(taskDTO.getDescription());
        task.setAssignee(userRepository.getOne(taskDTO.getUserId()));
        return taskRepository.save(task);
    }

    @Override
    public List<Task> getMy(User current) {
        return taskRepository.getAllByAssignee(current);
    }

    @Override
    public List<Task> getProjects(Project project) {
        return taskRepository.getAllByProject(project);
    }
}
