package ru.sosnov.projectmanagement.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.sosnov.projectmanagement.model.User;

public interface UserRepository extends JpaRepository<User, Long> {

    User findByEmail(String email);
}
