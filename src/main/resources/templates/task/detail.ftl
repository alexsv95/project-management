<#import "../index.ftl" as base>
<@base.layout>
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>Детали задачи
                    <small> ${task.name}</small>
                </h3>
            </div>

        </div>

        <div class="clearfix"></div>

        <div class="row">
            <div class="col-md-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>${task.name}</h2>
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
                                    <span class="name"> Дата дедлайна</span>
                                    <span class="value text-success"> ${task.endDate?date} </span>
                                </li>
                                <li>
                                    <span class="name"> Исполнитель</span>
                                    <span class="value text-success"> ${task.assignee.email}</span>
                                </li>
                                <li class="hidden-phone">
                                    <span class="name">Статус</span>
                                    <span class="value text-success">${task.status}</span>
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
                                        <h3 class="green"><i class="fa fa-paint-brush"></i> ${task.name}</h3>

                                        <p>${task.description}</p>
                                        <br/>

                                        <#--<div class="project_detail">-->

                                        <#--<p class="title">Client Company</p>-->
                                        <#--<p>Deveint Inc</p>-->
                                        <#--<p class="title">Project Leader</p>-->
                                        <#--<p>Tony Chicken</p>-->
                                        <#--</div>-->

                                        <br/>

                                    </div>

                                </section>



                            </div>


                        </div>

                        <!-- start project-detail sidebar -->
                        <div class="col-md-3 col-sm-3 col-xs-12">


                            <a href="/task/${task.id}/update" class="btn btn-info btn-default"><i
                                        class="fa fa-pencil"></i> Редактировать </a>


                        </div>
                        <!-- end project-detail sidebar -->

                    </div>
                </div>
            </div>
        </div>
    </div>
</@base.layout>