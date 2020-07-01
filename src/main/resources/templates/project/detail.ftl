<#import "../index.ftl" as base>
<@base.layout>
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>Детали проекта
                    <small></small>
                </h3>
            </div>

        </div>

        <div class="clearfix"></div>

        <div class="row">
            <div class="col-md-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 class="blue"><i class="fa fa-list-alt"></i> ${project.name}</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <a href="/project/${project.id}/update" class="btn btn-info btn-sm"><i
                                        class="fa fa-pencil"></i> Редактировать </a>
                        </ul>
<#--                        <ul class="nav navbar-right panel_toolbox">-->
<#--                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>-->
<#--                            </li>-->
<#--                            <li><a class="close-link"><i class="fa fa-close"></i></a>-->
<#--                            </li>-->
<#--                        </ul>-->
                        <div class="clearfix"></div>
                    </div>

                    <div class="x_content">

                        <div class="col-md-9 col-sm-9 col-xs-12">

                            <ul class="stats-overview">
                                <li>
                                    <span class="name"> Дата создания</span>
                                    <span class="value text-success"> ${project.created} </span>
                                </li>
                                <li>
                                    <span class="name"> Дата старта</span>
                                    <span class="value text-success"> ${project.startDate}</span>
                                </li>
                                <li class="hidden-phone">
                                    <span class="name">Статус</span>
                                    <span class="value text-success">${project.status}</span>
                                </li>
                            </ul>
                            <br/>

                            <div>
                                <section class="panel">
                                    <div class="x_title">
                                        <h2>Описание проекта</h2>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="panel-body">

                                        <h4>${project.description}</h4>
                                        <br/>

                                        <#--<div class="project_detail">-->

                                        <#--<p class="title">Client Company</p>-->
                                        <#--<p>Deveint Inc</p>-->
                                        <#--<p class="title">Project Leader</p>-->
                                        <#--<p>Tony Chicken</p>-->
                                        <#--</div>-->

<#--                                        <br/>-->
<#--                                        <h5>Файлы проекта</h5>-->
<#--                                        <ul class="list-unstyled project_files">-->
<#--                                            <li>-->
<#--                                                <form action="/files/download" method="post">-->
<#--                                                    <input type="hidden" name="filename"-->
<#--                                                           value="${project.attachmentPath}">-->
<#--                                                    <button class="btn btn-default" type="submit"><i-->
<#--                                                                class="fa fa-file-o"></i> Скачать-->
<#--                                                    </button>-->
<#--                                                </form>-->
<#--                                            </li>-->
<#--                                        </ul>-->
<#--                                        <br/>-->

                                    </div>

                                </section>
                                <div>
                                    <section class="panel">
                                        <div class="x_title">
                                            <h2>Список задач</h2>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="panel-body">




                                        </div>

                                    </section>
                                </div>


                                <!--<h4>Список задач</h4>-->

                                <!-- end of user messages -->
                                <ul class="messages">
                                    <#list tasks as task>
                                        <li>
                                            <div class="message_date">
                                                <h4 class="date text-info">${task.endDate?date}</h4>
                                                <p class="message">${task.assignee.fio}</p>
                                                <p class="month">${task.status}</p>
                                            </div>
                                            <div class="message_wrapper">
                                                <a href="/task/${task.id}"><h4 class="heading">${task.name}</h4></a>
                                                <blockquote class="message"><h5>${task.description}</h5></blockquote>
                                                <br/>
<#--                                                <p class="message">${task.assignee.fio}</p>-->
                                                <br/>
                                            </div>
                                        </li>
                                    </#list>
                                    <a class="btn btn-primary" href="/task/new" role="button"><i
                                                class="fa fa-plus"></i> Добавить задачу</a>
                                </ul>
                                <#--<!-- end of user messages &ndash;&gt;-->


                            </div>


                        </div>

                        <!-- start project-detail sidebar -->
                        <div class="col-md-3 col-sm-3 col-xs-12">

                            <div class="row">
                                <img src="/images/user.png " class="avatar" alt="Avatar">
                            </div>
                            <div class="row">
                                <p><span class="name">Руководитель: </span>
                                    <span class="value text-success"> ${project.owner.fio}</span></p>
                                <p><span class="name">Должность: </span>
                                    <span class="value text-success"> ${project.owner.position}</span></p>
                                <p><span class="name">Email: </span>
                                    <span class="value text-success"> ${project.owner.email}</span></p>
                                <br/>
                                <hr/>
                            </div>

                            <section class="panel">
                                <div class="x_title">
                                    <h2>Заметка</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="panel-body">

                                    <p class="word">${project.note}</p>
                                    <br/>

                                </div>

                            </section>

<#--                            <a href="/project/${project.id}/update" class="btn btn-info btn-sm"><i-->
<#--                                        class="fa fa-pencil"></i> Редактировать </a>-->

<#--                            <br/>-->
<#--                            <hr/>-->





                        </div>
                        <!-- end project-detail sidebar -->

                    </div>
                </div>
            </div>
        </div>
    </div>
</@base.layout>