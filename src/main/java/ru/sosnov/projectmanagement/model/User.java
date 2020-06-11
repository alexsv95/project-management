package ru.sosnov.projectmanagement.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import lombok.*;
import ru.sosnov.projectmanagement.model.enums.RoleType;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "users")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@JsonIdentityInfo(
        generator = ObjectIdGenerators.PropertyGenerator.class,
        property = "id")
@ToString(exclude = "projects")
@EqualsAndHashCode(exclude = "projects")
public class User {

    @Id
    @GeneratedValue
    private Long id;

    @Column(name = "role")
    @Enumerated(EnumType.STRING)
    private RoleType role;

    @Column(name = "email")
    private String email;

    @Column(name = "position")
    private String position;

    @Column(name = "fio")
    private String fio;

    @Column(name = "password")
    private String password;

    @Column(name = "salt")
    private String salt;

    @JsonBackReference
    @OneToMany(mappedBy = "owner", fetch = FetchType.EAGER)
    private List<Project> projects;

    @JsonBackReference
    @OneToMany(mappedBy = "assignee", fetch = FetchType.EAGER)
    private List<Task> tasks;


}
