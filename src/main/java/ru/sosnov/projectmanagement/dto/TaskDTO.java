package ru.sosnov.projectmanagement.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import ru.sosnov.projectmanagement.model.enums.ProjectStatus;
import ru.sosnov.projectmanagement.model.enums.TaskStatus;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TaskDTO {
    private Long id;

    private String name;

    private String description;

    private Date endDate;

    private Long projectId;

    private TaskStatus status;

    private Long userId;
}
