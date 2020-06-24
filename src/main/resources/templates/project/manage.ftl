<#import "../index.ftl" as base>
<@base.layout>
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>Управление проектами<small></small></h3>
            </div>
        </div>

        <div class="clearfix"></div>

        <div class="row">
            <div class="col-md-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Проекты</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">


                        <!-- start project list -->
                        <table class="table table-striped projects">
                            <thead>
                            <tr>
<#--                                <th style="width: 1%">#</th>-->
                                <th style="width: 20%">Проект</th>
                                <th>Команда</th>
                                <th>Прогресс проекта</th>
                                <th>Статус</th>
                                <th style="width: 20%">#Управление</th>
                            </tr>
                            </thead>
                            <tbody>
                            <#list projects as project>
                                <tr>
<#--                                    <td>#${project.id}</td>-->
                                    <td>
                                        <a href="/project/${project.id}">${project.name}</a>
                                        <br />
                                        <small>Создан ${project.created}</small>
                                    </td>
                                    <td>
                                        <ul class="list-inline">
                                            <li>
                                                <img src="/images/user.png" class="avatar" alt="Avatar">
                                            </li>
                                            <li>
                                                <img src="/images/user.png" class="avatar" alt="Avatar">
                                            </li>
                                            <li>
                                                <img src="/images/user.png" class="avatar" alt="Avatar">
                                            </li>
                                            <li>
                                                <img src="/images/user.png" class="avatar" alt="Avatar">
                                            </li>
                                        </ul>
                                    </td>
                                    <td class="project_progress">
                                        <div class="progress progress_sm">
                                            <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="${project.progress}"></div>
                                        </div>
                                        <small>${project.progress}%</small>
                                    </td>
                                    <td>
                                        ${project.status}
<#--                                        <button type="button" class="btn btn-success btn-xs">${project.status}</button>-->
                                    </td>
                                    <td>
                                        <#--<a href="/project/${project.id}" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> Просмотр </a>-->
                                        <a href="/project/${project.id}/update" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Редактировать </a>
                                        <a href="#" data-id="${project.id}" class="btn btn-danger btn-xs deleteProject"><i class="fa fa-trash-o"></i> Удалить </a>
                                    </td>
                                </tr>
                            </#list>
                            </tbody>
                        </table>
                        <!-- end project list -->

                    </div>
                </div>
            </div>
        </div>

    </div>

</@base.layout>