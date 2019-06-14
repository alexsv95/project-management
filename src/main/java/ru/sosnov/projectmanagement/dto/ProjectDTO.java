package ru.sosnov.projectmanagement.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import ru.sosnov.projectmanagement.model.enums.ProjectStatus;

import java.time.LocalDate;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProjectDTO {

    private Long id;

    private String name;

    private String description;

    @DateTimeFormat(pattern ="yyyy-MM-dd")
    private LocalDate startDate;

    private String note;

    private ProjectStatus status;
}
