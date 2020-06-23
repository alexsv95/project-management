package ru.sosnov.projectmanagement.service.impl;

import lombok.RequiredArgsConstructor;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import ru.sosnov.projectmanagement.dto.ProjectDTO;
import ru.sosnov.projectmanagement.model.Project;
import ru.sosnov.projectmanagement.model.User;
import ru.sosnov.projectmanagement.repository.ProjectRepository;
import ru.sosnov.projectmanagement.service.ProjectService;
import ru.sosnov.projectmanagement.util.SecurityContextUtil;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ProjectServiceImpl implements ProjectService {

    private final ProjectRepository projectRepository;
    private final ServletContext servletContext;
    private final Logger LOG = LoggerFactory.getLogger(ProjectServiceImpl.class);

    @Override
    public List<Project> getAll() {
        return projectRepository.findAll();
    }

    @Override
    public Project findOne(Long id) {
        return projectRepository.getOne(id);
    }

    @Override
    public Project save(ProjectDTO projectDTO) {
        User current = SecurityContextUtil.getAuthUser();
        Project project = new Project();
        project.setName(projectDTO.getName());
        project.setDescription(projectDTO.getDescription());
        project.setNote(projectDTO.getNote());
        project.setStartDate(projectDTO.getStartDate());
        project.setStatus(projectDTO.getStatus());
        project.setCreated(new Date());
        project.setOwner(current);
//        String uploadFile = uploadFile(projectDTO.getFile());
//        project.setAttachmentPath(uploadFile);
        return projectRepository.save(project);
    }

    @Override
    public void delete(Long id) {
        projectRepository.delete(findOne(id));
    }

    @Override
    public Project update(ProjectDTO projectDTO) {
        Project project = projectRepository.getOne(projectDTO.getId());
        project.setStatus(projectDTO.getStatus());
        project.setStartDate(projectDTO.getStartDate());
        project.setNote(projectDTO.getNote());
        project.setDescription(projectDTO.getDescription());
        project.setName(projectDTO.getName());
        if (projectDTO.getFile() != null) {
            project.setAttachmentPath(uploadFile(projectDTO.getFile()));
        }
        return projectRepository.save(project);
    }

    private String uploadFile(MultipartFile file) {
        String uploadsDir = "/uploads/";
        String realPathtoUploads =  servletContext.getRealPath(uploadsDir);
        if(! new File(realPathtoUploads).exists())
        {
            new File(realPathtoUploads).mkdir();
        }

        String orgName = file.getOriginalFilename();
        String ext = FilenameUtils.getExtension(orgName);
        String filename = String.format("%s.%s", RandomStringUtils.randomAlphanumeric(8), ext);
        String filePath = realPathtoUploads + filename;
        File dest = new File(filePath);
        try {
            file.transferTo(dest);
        } catch (IOException e) {
            e.printStackTrace(); //todo
            LOG.error("Cannot upload file {}", e.getMessage());
        }
        return realPathtoUploads + filename;
    }
}
