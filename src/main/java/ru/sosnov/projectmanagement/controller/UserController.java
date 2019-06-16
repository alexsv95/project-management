package ru.sosnov.projectmanagement.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ru.sosnov.projectmanagement.model.User;
import ru.sosnov.projectmanagement.service.UserService;
import ru.sosnov.projectmanagement.util.SecurityContextUtil;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

    @GetMapping("/users")
    public String usersPage(Model model) {
        User current = SecurityContextUtil.getAuthUser();
        model.addAttribute("current", current);
        List<User> users = userService.getAll();
        model.addAttribute("users", users);
        return "users/users";
    }

}
