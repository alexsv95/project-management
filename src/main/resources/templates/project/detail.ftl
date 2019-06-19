<#import "../index.ftl" as base>
<@base.layout>
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>Детали проекта
                    <small> ${project.name}</small>
                </h3>
            </div>

        </div>

        <div class="clearfix"></div>

        <div class="row">
            <div class="col-md-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>${project.name}</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                            </li>
                        </ul>
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
                                        <h2>Описание</h2>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="panel-body">
                                        <h3 class="green"><i class="fa fa-paint-brush"></i> ${project.name}</h3>

                                        <p>${project.description}</p>
                                        <br/>

                                        <#--<div class="project_detail">-->

                                        <#--<p class="title">Client Company</p>-->
                                        <#--<p>Deveint Inc</p>-->
                                        <#--<p class="title">Project Leader</p>-->
                                        <#--<p>Tony Chicken</p>-->
                                        <#--</div>-->

                                        <br/>
                                        <h5>Файлы проекта</h5>
                                        <ul class="list-unstyled project_files">
                                            <li>
                                                <form action="/files/download" method="post">
                                                    <input type="hidden" name="filename"
                                                           value="${project.attachmentPath}">
                                                    <button class="btn btn-default" type="submit"><i
                                                                class="fa fa-file-o"></i> Скачать
                                                    </button>
                                                </form>
                                            </li>
                                        </ul>
                                        <br/>

                                    </div>

                                </section>


                                <div>
                                    <section class="panel">
                                        <div class="x_title">
                                            <h2>Задачи</h2>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="panel-body">
                                            <a class="btn btn-primary" href="/task/new" role="button"><i
                                                        class="fa fa-plus"></i> Добавить задачу</a>

                                            <br/>

                                        </div>

                                    </section>
                                </div>


                                <h4>Список задач</h4>

                                <!-- end of user messages -->
                                <ul class="messages">
                                    <#list tasks as task>
                                        <li>
                                            <div class="message_date">
                                                <h3 class="date text-info">${task.endDate?date}</h3>
                                                <p class="month">${task.status}</p>
                                            </div>
                                            <div class="message_wrapper">
                                                <a href="/task/${task.id}"><h4 class="heading">${task.name}</h4></a>
                                                <blockquote class="message">${task.description}</blockquote>
                                                <br/>
                                            </div>
                                        </li>
                                    </#list>
                                </ul>
                                <#--<!-- end of user messages &ndash;&gt;-->


                            </div>


                        </div>

                        <!-- start project-detail sidebar -->
                        <div class="col-md-3 col-sm-3 col-xs-12">

                            <section class="panel">
                                <div class="x_title">
                                    <h2>Заметка</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="panel-body">

                                    <p>${project.note}</p>
                                    <br/>

                                </div>

                            </section>

                            <a href="/project/${project.id}/update" class="btn btn-info btn-default"><i
                                        class="fa fa-pencil"></i> Редактировать </a>

                            <div class="row">
                                <li>
                                    <span class="name"> Руководитель</span>
                                    <span class="value text-success"> ${project.owner.email}</span>
                                </li>
                            </div>


                        </div>
                        <!-- end project-detail sidebar -->

                    </div>
                </div>
            </div>
        </div>
    </div>
</@base.layout>