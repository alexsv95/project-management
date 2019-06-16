<#import "../index.ftl" as base>
<@base.layout>
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>Пользователи <small></small></h3>
            </div>
        </div>

        <div class="clearfix"></div>

        <div class="row">
            <div class="col-md-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Пользователи</h2>
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
                                <th style="width: 20%">Email</th>
                                <th>Роль</th>
                            </tr>
                            </thead>
                            <tbody>
                            <#list users as user>
                                <tr>
                                    <td>#${user.id}</td>
                                    <td>
                                        ${user.email}
                                    </td>
                                    <td>
                                        ${user.role}
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