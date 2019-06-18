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


                        <div class="col-md-4">
                            <h2>Зарегистрированые</h2>
                            <hr>

                            <#list projects as project>
                                <#if project.status == 'Зарегистрирован'>
                                    <div class="alert alert-warning alert-dismissible fade in" role="alert">
                                        <strong>${project.name}</strong> ${project.description}
                                    </div>
                                </#if>
                            </#list>
                        </div>


                        <div class="col-md-4">
                            <h2>В работе</h2>
                            <hr>

                            <#list projects as project>
                                <#if project.status == 'В работе'>
                                    <div class="alert alert-success alert-dismissible fade in" role="alert">
                                        <strong>${project.name}</strong> ${project.description}
                                    </div>
                                </#if>
                            </#list>
                        </div>


                        <div class="col-md-4">
                            <h2>Завершенные</h2>
                            <hr>

                            <#list projects as project>
                                <#if project.status == 'Завершен'>
                                    <div class="alert alert-danger alert-dismissible fade in" role="alert">
                                        <strong>${project.name}</strong> ${project.description}
                                    </div>
                                </#if>
                            </#list>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

</@base.layout>