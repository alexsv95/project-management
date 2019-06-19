<#import "../index.ftl" as base>
<@base.layout>
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>Управление таксами<small></small></h3>
            </div>
        </div>

        <div class="clearfix"></div>

        <div class="row">
            <div class="col-md-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Таски</h2>
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
                                <th style="width: 1%">#</th>
                                <th style="width: 20%">Имя таска</th>
                                <th>Исполнитель</th>
                                <th>Статус</th>
                                <th style="width: 20%">#Управление</th>
                            </tr>
                            </thead>
                            <tbody>
                            <#list tasks as task>
                                <tr>
                                    <td>#${task.id}</td>
                                    <td>
                                        <a href="/task/${task.id}">${task.name}</a>
                                        <br />
                                    </td>
                                    <td>
                                        ${task.assignee.email}
                                    </td>

                                    <td>
                                        <button type="button" class="btn btn-success btn-xs">${task.status}</button>
                                    </td>
                                    <td>
                                        <a href="/task/${task.id}" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> Просмотр </a>
                                        <a href="/task/${task.id}/update" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Редактировать </a>
                                        <a href="#" data-id="${task.id}" class="btn btn-danger btn-xs deleteTask"><i class="fa fa-trash-o"></i> Удалить </a>
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