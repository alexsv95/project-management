package ru.sosnov.projectmanagement.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import ru.sosnov.projectmanagement.dto.ProjectDTO;
import ru.sosnov.projectmanagement.model.Project;
import ru.sosnov.projectmanagement.service.ProjectService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class ProjectController {

    private final ProjectService projectService;

    @GetMapping("/project/manage")
    public String allProjectsPage(Model model) {
        List<Project> all = projectService.getAll();
        model.addAttribute("projects", all);
        return "project/manage";
    }

    @GetMapping("/project/new")
    public String addProjectPage(Model model) {
        return "project/add";
    }


    @PostMapping("/project/add")
    public String addProject(Model model, ProjectDTO projectDTO) {
        Project project = projectService.save(projectDTO);
        return "redirect:/project/manage";
    }
}