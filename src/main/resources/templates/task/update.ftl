<#import "../index.ftl" as base>
<@base.layout>
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>Обновите задачу</h3>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Форма редактирования<small>инфа тут</small></h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <br />
                        <form id="demo-form2" method="post" data-parsley-validate class="form-horizontal form-label-left">

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Название задачи <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" value="${task.name}" name="name" id="name" required="required" class="form-control col-md-7 col-xs-12">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="description">Описание <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <textarea id="description" class="form-control" rows="5" name="description"  >${task.description}</textarea>
                                    <#--<input type="text" id="last-name" name="last-name" required="required" class="form-control col-md-7 col-xs-12">-->
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="endDate" class="control-label col-md-3 col-sm-3 col-xs-12">Дата завершения</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <fieldset>
                                        <div class="control-group">
                                            <div class="controls">
                                                <div class="col-md-5 xdisplay_inputx form-group has-feedback">
                                                    <input value="${endDate}" type="text" required name="endDate" class="form-control has-feedback-left" id="enddate" placeholder="Выбери дату" aria-describedby="inputSuccess2Status4">
                                                    <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span>
                                                    <span id="inputSuccess2Status4" class="sr-only">(success)</span>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                    <#--<input id="startdate" class="date-picker form-control col-md-7 col-xs-12" name="startDate" required="required" type="date">-->
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="user" class="control-label col-md-3 col-sm-3 col-xs-12">Исполнитель</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div id="user" class="btn-group" data-toggle="buttons">
                                        <select class="select2_single form-control" id="user" required name="userId">
                                            <#list users as user>
                                                <option value="${user.id}">${user.email}</option>
                                            </#list>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <input name="projectId" type="hidden" value="${task.project.id}">
                            <div class="form-group">
                                <label for="status" class="control-label col-md-3 col-sm-3 col-xs-12">Статус</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div id="status" class="btn-group" data-toggle="buttons">
                                        <select class="select2_single form-control" id="status" name="status">
                                            <option <#if task.status=='PROGRESS'>selected="selected"</#if> value="PROGRESS">Зарегистрирован</option>
                                            <option <#if task.status=='DONE'>selected="selected"</#if> value="DONE">Завершен</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="ln_solid"></div>
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                    <button class="btn btn-primary" type="reset">Очистить</button>
                                    <button type="submit" class="btn btn-success">Сохранить</button>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>




    </div>
</@base.layout>