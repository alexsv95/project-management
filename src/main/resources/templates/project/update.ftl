<#import "../index.ftl" as base>
<@base.layout>
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>Создать новый проект</h3>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Форма создания проекта <small>инфа тут</small></h2>
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
                        <form enctype="multipart/form-data" id="demo-form2" action="/project/add" method="post" data-parsley-validate class="form-horizontal form-label-left">

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Название проекта <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input value="${project.name}" type="text" name="name" id="name" required="required" class="form-control col-md-7 col-xs-12">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="description">Описание <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <textarea id="description" class="form-control" rows="5" name="description"  >${project.description}</textarea>
                                    <#--<input type="text" id="last-name" name="last-name" required="required" class="form-control col-md-7 col-xs-12">-->
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="startdate" class="control-label col-md-3 col-sm-3 col-xs-12">Дата старта</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <fieldset>
                                        <div class="control-group">
                                            <div class="controls">
                                                <div class="col-md-5 xdisplay_inputx form-group has-feedback">
                                                    <input value="${startDate}" type="text" required name="startDate" class="form-control has-feedback-left" id="startdate" placeholder="Выбери дату" aria-describedby="inputSuccess2Status4">
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
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">Заметка
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <textarea id="note" class="form-control" rows="5" name="note"  >${project.note}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">Файл
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="file" id="file" type="file">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="status" class="control-label col-md-3 col-sm-3 col-xs-12">Статус</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div id="status" class="btn-group" data-toggle="buttons">
                                        <select class="select2_single form-control" id="status" name="status">
                                            <option <#if project.status=='REGISTERED'>selected="selected"</#if> value="REGISTERED">Зарегистрирован</option>
                                            <option <#if project.status=='PROGRESS'>selected="selected"</#if> value="PROGRESS">В Работе</option>
                                            <option <#if project.status=='DONE'>selected="selected"</#if> value="DONE">Завершен</option>
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