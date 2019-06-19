package ru.sosnov.projectmanagement.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import ru.sosnov.projectmanagement.dto.ProjectDTO;
import ru.sosnov.projectmanagement.dto.TaskDTO;
import ru.sosnov.projectmanagement.model.Project;
import ru.sosnov.projectmanagement.model.Task;
import ru.sosnov.projectmanagement.model.User;
import ru.sosnov.projectmanagement.service.ProjectService;
import ru.sosnov.projectmanagement.service.TaskService;
import ru.sosnov.projectmanagement.service.UserService;
import ru.sosnov.projectmanagement.util.SecurityContextUtil;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class TaskController {

    private final TaskService taskService;
    private final ProjectService projectService;
    private final UserService userService;


    @GetMapping("/task/new")
    public String addTaskPage(Model model) {
        User current = SecurityContextUtil.getAuthUser();
        List<Project> projects = projectService.getAll();
        List<User> users = userService.getAll();
        model.addAttribute("current", current);
        model.addAttribute("projects", projects);
        model.addAttribute("users", users);
        return "task/add";
    }


    @PostMapping("/task/add")
    public String addTask(Model model, TaskDTO taskDTO) throws IOException {
        User current = SecurityContextUtil.getAuthUser();
        model.addAttribute("current", current);
        taskService.save(taskDTO);
        return "redirect:/task/manage";
    }

    @GetMapping("/task/manage")
    public String myTasksPage(Model model) {
        User current = SecurityContextUtil.getAuthUser();
        model.addAttribute("current", current);
        List<Task> all = taskService.getMy(current);
        model.addAttribute("tasks", all);
        return "task/manage";
    }

    @GetMapping("/task/{id}/update")
    public String showUpdate(Model model, @PathVariable Long id) {
        User current = SecurityContextUtil.getAuthUser();
        model.addAttribute("current", current);
        List<User> users = userService.getAll();
        Task task = taskService.findOne(id);
        model.addAttribute("task", task);
        model.addAttribute("endDate", new SimpleDateFormat("MM/dd/yyyy").format(task.getEndDate()));
        model.addAttribute("users", users);
        return "/task/update";
    }

    @PostMapping("/task/{id}/update")
    public String update(Model model, @PathVariable Long id, TaskDTO taskDTO) {
        taskDTO.setId(id);
        User current = SecurityContextUtil.getAuthUser();
        model.addAttribute("current", current);
        taskService.update(taskDTO);
        return "redirect:/task/manage";
    }

    @GetMapping("/task/{id}")
    public String showTaskDetail(@PathVariable Long id, Model model) {
        User current = SecurityContextUtil.getAuthUser();
        model.addAttribute("current", current);
        Task one = taskService.findOne(id);
        model.addAttribute("task", one);
        return "/task/detail";
    }
}
