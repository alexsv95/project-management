package ru.sosnov.projectmanagement.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import lombok.*;
import ru.sosnov.projectmanagement.model.enums.ProjectStatus;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "projects")
@Data
@AllArgsConstructor
@NoArgsConstructor
@JsonIdentityInfo(
        generator = ObjectIdGenerators.PropertyGenerator.class,
        property = "id")
@ToString(exclude = {"owner", "tasks" })
@EqualsAndHashCode(exclude = {"owner", "tasks"})
public class Project {

    @Id
    @GeneratedValue
    private Long id;

    private String name;

    @Column(length = 5000)
    private String description;

    @JsonManagedReference
    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User owner;

    @Column(name = "start_date")
    private Date startDate;

    @Enumerated(EnumType.STRING)
    private ProjectStatus status;

    @Column(length = 5000)
    private String note;

    private Date created;

    private String attachmentPath;

    @Transient
    private transient Integer progress;

    @JsonBackReference
    @OneToMany(mappedBy = "project", fetch = FetchType.EAGER)
    private List<Task> tasks;
}
