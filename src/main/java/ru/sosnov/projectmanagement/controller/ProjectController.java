package ru.sosnov.projectmanagement.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.sosnov.projectmanagement.dto.ProjectDTO;
import ru.sosnov.projectmanagement.model.Project;
import ru.sosnov.projectmanagement.model.Task;
import ru.sosnov.projectmanagement.model.User;
import ru.sosnov.projectmanagement.model.enums.ProjectStatus;
import ru.sosnov.projectmanagement.model.enums.TaskStatus;
import ru.sosnov.projectmanagement.service.ProjectService;
import ru.sosnov.projectmanagement.service.TaskService;
import ru.sosnov.projectmanagement.util.SecurityContextUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class ProjectController {

    private final ProjectService projectService;
    private final TaskService taskService;

    @GetMapping("/dashboard")
    public String boardOfProjects(Model model) {
        User current = SecurityContextUtil.getAuthUser();
        model.addAttribute("current", current);
        List<Project> all = projectService.getAll();
        model.addAttribute("projects", all);

        for (Project project : all) {
            int allT = project.getTasks().size();
            int done = (int) project.getTasks().stream()
                    .filter(task -> task.getStatus().equals(TaskStatus.DONE))
                    .count();
            if (allT == 0) {
                project.setProgress(0);
            } else {
                project.setProgress((int)(((double) done/allT) * 100));
            }
        }
        return "project/dashboard";
    }

    @GetMapping("/project/manage")
    public String allProjectsPage(Model model) {
        User current = SecurityContextUtil.getAuthUser();
        model.addAttribute("current", current);
        List<Project> projects = projectService.getAll();

        for (Project project : projects) {
            int allT = project.getTasks().size();
            int done = (int) project.getTasks().stream()
                    .filter(task -> task.getStatus().equals(TaskStatus.DONE))
                    .count();
            if (allT == 0) {
                project.setProgress(0);
            } else {
                project.setProgress((int)(((double) done/allT) * 100));
            }
        }

        model.addAttribute("projects", projects);
        return "project/manage";
    }


    @GetMapping("/project/new")
    public String addProjectPage(Model model) {
        User current = SecurityContextUtil.getAuthUser();
        model.addAttribute("current", current);
        return "project/add";
    }


    @PostMapping("/project/add")
    public String addProject(Model model, ProjectDTO projectDTO, HttpServletRequest request) throws IOException {
        User current = SecurityContextUtil.getAuthUser();
        model.addAttribute("current", current);
        projectService.save(projectDTO);
        return "redirect:/project/manage";
    }

    @DeleteMapping("/project/{id}")
    @ResponseBody
    public ResponseEntity deleteProject(@PathVariable Long id) {
        projectService.delete(id);
        return ResponseEntity.ok().build();
    }


    @RequestMapping(value = "/files/download")
    public ResponseEntity getFile(
            @RequestParam("filename") String fileName,
            HttpServletResponse response) throws FileNotFoundException {
        Resource resource = new InputStreamResource(new FileInputStream(fileName));
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + new File(fileName).getName() + "\"")
                .body(resource);

    }

    @GetMapping("/project/{id}")
    public String showProjectDetail(@PathVariable Long id, Model model) {
        User current = SecurityContextUtil.getAuthUser();
        model.addAttribute("current", current);
        Project one = projectService.findOne(id);
        model.addAttribute("project", one);
        List<Task> tasks = taskService.getProjects(one);
        model.addAttribute("tasks", tasks);
        return "/project/detail";
    }

    @GetMapping("/project/{id}/update")
    public String showUpdate(Model model, @PathVariable Long id) {
        User current = SecurityContextUtil.getAuthUser();
        model.addAttribute("current", current);
        Project project = projectService.findOne(id);
        model.addAttribute("project", project);
        model.addAttribute("startDate", new SimpleDateFormat("MM/dd/yyyy").format(project.getStartDate()));
        return "/project/update";
    }

    @PostMapping("/project/{id}/update")
    public String update(Model model, @PathVariable Long id, ProjectDTO projectDTO) {
        projectDTO.setId(id);
        User current = SecurityContextUtil.getAuthUser();
        model.addAttribute("current", current);
        projectService.update(projectDTO);
        return "redirect:/project/manage";
    }
    /*
     * Просмотр:
     * + Редактирование
     * Статус
     * Название проекта
     * опписание проекта
     * Дата создания
     * Дата старта
     * Файл скачать
     * Заметки
     * Создатель todo
     */


    /**
     *
     */
}