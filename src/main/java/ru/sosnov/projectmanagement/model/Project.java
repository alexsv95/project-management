package ru.sosnov.projectmanagement.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import ru.sosnov.projectmanagement.model.enums.ProjectStatus;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "projects")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Project {

    @Id
    @GeneratedValue
    private Long id;

    private String name;

    private String description;

    @Column(name = "start_date")
    private Date startDate;

    @Enumerated(EnumType.STRING)
    private ProjectStatus status;

    private String note;
}
