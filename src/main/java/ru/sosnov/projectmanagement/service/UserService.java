package ru.sosnov.projectmanagement.service;

import ru.sosnov.projectmanagement.model.User;

import java.util.List;

public interface UserService {
    User findByEmail(String email);

    List<User> getAll();
}
