package ru.sosnov.projectmanagement.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.sosnov.projectmanagement.model.Task;
import ru.sosnov.projectmanagement.model.User;

import java.util.List;

public interface TaskRepository extends JpaRepository<Task, Long> {

    List<Task> getAllByAssignee(User assignee);
}
