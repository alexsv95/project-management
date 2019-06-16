package ru.sosnov.projectmanagement.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;
import ru.sosnov.projectmanagement.model.enums.ProjectStatus;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProjectDTO {

    private Long id;

    private String name;

    private String description;

    private Date startDate;

    private String note;

    private ProjectStatus status;

    private MultipartFile file;
}
