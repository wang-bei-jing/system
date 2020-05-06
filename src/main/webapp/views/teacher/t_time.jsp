<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">

    <link href="${pageContext.request.contextPath}/static/cork/assets/css/loader.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/static/cork/assets/js/loader.js"></script>

    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/cork/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/static/cork/assets/css/plugins.css" rel="stylesheet" type="text/css" />
    <title>申报课题时间管理</title>
</head>
<body>

<!-- BEGIN LOADER -->
<div id="load_screen"> <div class="loader"> <div class="loader-content"> <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 792 723" style="enable-background:new 0 0 792 723;" xml:space="preserve"> <g> <g> <path class="st0" d="M213.9,584.4c-47.4-25.5-84.7-60.8-111.8-106.1C75,433.1,61.4,382,61.4,324.9c0-57,13.6-108.1,40.7-153.3 S166.5,91,213.9,65.5s100.7-38.2,159.9-38.2c49.9,0,95,8.8,135.3,26.3s74.1,42.8,101.5,75.7l-85.5,78.9 c-38.9-44.9-87.2-67.4-144.7-67.4c-35.6,0-67.4,7.8-95.4,23.4s-49.7,37.4-65.4,65.4c-15.6,28-23.4,59.8-23.4,95.4 s7.8,67.4,23.4,95.4s37.4,49.7,65.4,65.4c28,15.6,59.7,23.4,95.4,23.4c57.6,0,105.8-22.7,144.7-68.2l85.5,78.9 c-27.4,33.4-61.4,58.9-102,76.5c-40.6,17.5-85.8,26.3-135.7,26.3C314.3,622.7,261.3,809.9,213.9,584.4z"/> </g> <circle class="st1" cx="375.4" cy="322.9" r="100"/> </g> <g> <circle class="st2" cx="275.4" cy="910" r="65"></circle> <circle class="st4" cx="475.4" cy="910" r="65"></circle> </g> </svg> </div></div></div>
<!--  END LOADER -->

<!-- 修改弹框 -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">修改时间</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <div class="col-sm-10">
                            <input type="text" name="id" class="form-control" style="display: none" id="id_update">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">开始时间</label>
                        <div class="col-sm-10">
                            <input type="datetime-local" name="tiBegin" class="form-control" id="tiBegin_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">结束时间</label>
                        <div class="col-sm-10">
                            <input type="datetime-local" name="tiEnd" class="form-control" id="tiEnd_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>

<!-- 添加弹框 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">添加</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">开始时间</label>
                        <div class="col-sm-10">
                            <input type="datetime-local" min="1970-01-01" max="2099-12-31" value="2020-01-01T00:00" id="tiBegin_add">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">结束时间</label>
                        <div class="col-sm-10">
                            <input type="datetime-local" min="1970-01-01T00:00" max="2099-12-31T00:00" value="2020-01-01T00:00" id="tiEnd_add">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<div class="layout-px-spacing">
    <div class="row layout-top-spacing">
        <div class="col-xl-12 col-lg-12 col-sm-12  layout-spacing">
            <div class="widget-content widget-content-area br-6">
                <div class="modal-header">
                    <h1>课题申报时间管理</h1>
                    <div class="row">
                        <div>
                            <button id="add_btn" class="btn btn-s btn-primary">新增</button>
                        </div>
                    </div>
                </div>
                <div class="table-responsive mb-4 mt-4">
                    <table class="table table-hover" id="time_table" >
                        <thead>
                        <tr>
                            <th>开始时间</th>
                            <th>结束时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
<script src="${pageContext.request.contextPath}/static/cork/assets/js/libs/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/cork/bootstrap/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/static/cork/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/cork/plugins/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/static/cork/assets/js/app.js"></script>

<script src="${pageContext.request.contextPath}/static/cork/assets/js/custom.js"></script>
<!-- END GLOBAL MANDATORY SCRIPTS -->

<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="${pageContext.request.contextPath}/static/cork/plugins/table/datatable/datatables.js"></script>
<!-- BEGIN THEME GLOBAL STYLE -->
<script src="${pageContext.request.contextPath}/static/cork/assets/js/scrollspyNav.js"></script>
<script src="${pageContext.request.contextPath}/static/cork/plugins/sweetalerts/sweetalert2.min.js"></script>
<script src="${pageContext.request.contextPath}/static/cork/plugins/sweetalerts/custom-sweetalert.js"></script>
<!-- END PAGE LEVEL SCRIPTS -->

<script type="text/javascript">
    var tno = ${teacher.tno};
    $(function(){
        to_page();
    });
    //去第几页
    function to_page(){
        $.ajax({
            url:"${pageContext.request.contextPath}/time/select",
            type:"GET",
            success:function(result){
                build_time_table(result.extend.timeMangers);
            }
        });
    }
    //解析显示数据
    function build_time_table(timeMangers){
        $("#time_table tbody").empty();
        for(var i=0;i<timeMangers.length;i++){
            var begin = timeMangers[i].tiBegin;
            var beginTd = $("<td></td>").append(begin);
            var endTd = $("<td></td>").append(timeMangers[i].tiEnd);
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                .append("编辑");
            //为同意按钮添加一个自定义的属性来表示当前同意的课题选择id
            editBtn.attr("edit-id",timeMangers[i].tiId);
            var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
                .append("删除");
            //为删除按钮添加一个自定义的属性来表示当前拒绝的课题选择id
            delBtn.attr("del-id",timeMangers[i].tiId);
            var btnTd = $("<td></td>");
            btnTd.append(editBtn).append(delBtn);
            $("<tr></tr>").append(beginTd)
                .append(endTd)
                .append(btnTd)
                .appendTo("#time_table tbody");
        }
    }
    //点击新增按钮弹出模态框。
    $("#add_btn").click(function(){
        //清除表单数据（表单完整重置（表单的数据，表单的样式））
        reset_form("#empAddModal form");
        //弹出模态框
        $("#empAddModal").modal({
            backdrop:"static"
        });
    });
    //清空表单样式及内容
    function reset_form(ele){
        $(ele)[0].reset();
        //清空表单样式
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }
    //点击保存
    $("#emp_save_btn").click(function(){
        var begin = $("#tiBegin_add").val().replace("T"," ");
        var end = $("#tiEnd_add").val().replace("T"," ");
        $.ajax({
            url:"${pageContext.request.contextPath}/time/add",
            type:"POST",
            data:$("#empAddModal form").serialize()+"begin="+begin+"&end="+end,
            success:function(result){
                if(result.code === 100){
                    $("#empAddModal").modal('hide');
                    to_page();
                }else{
                    alert(result.extend.message);
                }
            }
        });
    });
    //获得课题信息
    function getEmp(tiId){
        $.ajax({
            url:"${pageContext.request.contextPath}/time/detail/"+tiId,
            type:"GET",
            success:function(result){
                var timeManger = result.extend.timeManger;
                $("#id_update").val(timeManger.tiId);
                var begin = timeManger.tiBegin;
                $("#tiBegin_update_input").val(begin.replace(" ","T"));
                var end = timeManger.tiEnd;
                $("#tiEnd_update_input").val(end.replace(" ","T"));
            }
        });
    }
    //点击编辑，弹出编辑弹窗
    $(document).on("click",".edit_btn",function(){
        getEmp($(this).attr("edit-id"));
        $("#emp_update_btn").attr("upd-id",$(this).attr("edit-id"));
        $("#empUpdateModal").modal({
            backdrop:"static"
        });
    });
    //点击更新，更新信息
    $("#emp_update_btn").click(function(){
        var begin = $("#tiBegin_update_input").val().replace("T"," ");
        var end = $("#tiEnd_update_input").val().replace("T"," ");
        var tiId = $(this).attr("upd-id");
        $.ajax({
            url:"${pageContext.request.contextPath}/time/upd/"+$(this).attr("upd-id"),
            type:"PUT",
            data:"tiId="+tiId+"&begin="+begin+"&end="+end,
            success:function(result){
                alert(result.msg);
                $("#empUpdateModal").modal("hide");
                to_page();
            }
        });
    });
    //单个删除
    $(document).on("click",".delete_btn",function(){
        var tiId = $(this).attr("del-id");
        if(confirm("确认删除已有时间吗？")){
            $.ajax({
                url:"${pageContext.request.contextPath}/time/del/"+tiId,
                type:"DELETE",
                success:function(result){
                    alert(result.msg);
                    to_page();
                }
            });
        }
    });
</script>
</body>
</html>

