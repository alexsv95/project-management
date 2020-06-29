<#import "../index.ftl" as base>
<@base.layout>
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>Доска проектов<small></small></h3>
            </div>
        </div>

        <div class="clearfix"></div>

        <div class="row">
            <div class="col-md-12">
                <div class="x_panel">
                    <div class="x_title">
<#--                        <h2>Проекты</h2>-->
                        <ul class="nav navbar-left panel_toolbox">
                            <a href="/project/new" class="btn btn-success btn-sm"><i
                                        class="fa fa-plus"></i> Создать проект </a>
                        </ul>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">


                        <div class="col-md-4">
                            <h2>Зарегистрированные</h2>
                            <hr>

                            <#list projects as project>
                                <#if project.status == 'Зарегистрирован'>
                                    <a href="/project/${project.id}">
                                        <div class="alert alert-warning alert-dismissible fade in" role="alert">
                                            <strong>${project.name}</strong>
                                            <hr>
                                            <p>${project.description}</p>
                                            <hr>
                                            <td class="project_progress">
                                                <div class="progress progress_sm">
                                                    <div class="progress-bar bg-primary" role="progressbar" data-transitiongoal="${project.progress}"></div>
                                                </div>
                                                <small>${project.progress}%</small>
                                            </td>
                                        </div>
                                    </a>
                                </#if>
                            </#list>
                        </div>


                        <div class="col-md-4">
                            <h2>В работе</h2>
                            <hr>

                            <#list projects as project>
                                <#if project.status == 'В работе'>
                                    <a href="/project/${project.id}">
                                        <div class="alert alert-info alert-dismissible fade in" role="alert">
                                            <strong>${project.name}</strong>
                                            <hr>
                                            <p>${project.description}</p>
                                            <hr>
                                            <td class="project_progress">
                                                <div class="progress progress_sm">
                                                    <div class="progress-bar bg-primary" role="progressbar" data-transitiongoal="${project.progress}"></div>
                                                </div>
                                                <small>${project.progress}%</small>
                                            </td>
                                        </div>
                                    </a>
                                </#if>
                            </#list>
                        </div>


                        <div class="col-md-4">
                            <h2>Завершенные</h2>
                            <hr>

                            <#list projects as project>
                                <#if project.status == 'Завершен'>
                                    <a href="/project/${project.id}">
                                        <div class="alert alert-success alert-dismissible fade in" role="alert">
                                            <strong>${project.name}</strong>
                                            <hr>
                                            <p>${project.description}</p>
                                            <hr>
                                            <td class="project_progress">
                                                <div class="progress progress_sm">
                                                    <div class="progress-bar bg-primary" role="progressbar" data-transitiongoal="${project.progress}"></div>
                                                </div>
                                                <small>${project.progress}%</small>
                                            </td>
                                        </div>
                                    </a>
                                </#if>
                            </#list>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

</@base.layout>