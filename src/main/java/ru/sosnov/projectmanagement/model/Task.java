package ru.sosnov.projectmanagement.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import lombok.*;
import ru.sosnov.projectmanagement.model.enums.ProjectStatus;
import ru.sosnov.projectmanagement.model.enums.TaskStatus;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "tasks")
@Data
@AllArgsConstructor
@NoArgsConstructor
@JsonIdentityInfo(
        generator = ObjectIdGenerators.PropertyGenerator.class,
        property = "id")
@ToString(exclude = {"project", "assignee" })
@EqualsAndHashCode(exclude = {"project", "assignee"})
public class Task {


    @Id
    @GeneratedValue
    private Long id;

    private String name;


    @Column(length = 5000)
    private String description;

    @JsonManagedReference
    @ManyToOne
    @JoinColumn(name = "project_id", nullable = false)
    private Project project;

    @JsonManagedReference
    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User assignee;

    @Column(name = "end_date")
    private Date endDate;

    @Enumerated(EnumType.STRING)
    private TaskStatus status;
}
