<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人信息</title>
    <link href="${pageContext.request.contextPath}/static/cork/assets/css/loader.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/static/cork/assets/js/loader.js"></script>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/cork/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/static/cork/assets/css/plugins.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->

    <!--  BEGIN CUSTOM STYLE FILE  -->
    <link href="${pageContext.request.contextPath}/static/cork/assets/css/scrollspyNav.css" rel="stylesheet" type="text/css" />
    <!--  END CUSTOM STYLE FILE  -->
</head>
<body>

    <!-- BEGIN LOADER -->
    <div id="load_screen"> <div class="loader"> <div class="loader-content"> <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 792 723" style="enable-background:new 0 0 792 723;" xml:space="preserve"> <g> <g> <path class="st0" d="M213.9,584.4c-47.4-25.5-84.7-60.8-111.8-106.1C75,433.1,61.4,382,61.4,324.9c0-57,13.6-108.1,40.7-153.3 S166.5,91,213.9,65.5s100.7-38.2,159.9-38.2c49.9,0,95,8.8,135.3,26.3s74.1,42.8,101.5,75.7l-85.5,78.9 c-38.9-44.9-87.2-67.4-144.7-67.4c-35.6,0-67.4,7.8-95.4,23.4s-49.7,37.4-65.4,65.4c-15.6,28-23.4,59.8-23.4,95.4 s7.8,67.4,23.4,95.4s37.4,49.7,65.4,65.4c28,15.6,59.7,23.4,95.4,23.4c57.6,0,105.8-22.7,144.7-68.2l85.5,78.9 c-27.4,33.4-61.4,58.9-102,76.5c-40.6,17.5-85.8,26.3-135.7,26.3C314.3,622.7,261.3,809.9,213.9,584.4z"/> </g> <circle class="st1" cx="375.4" cy="322.9" r="100"/> </g> <g> <circle class="st2" cx="275.4" cy="910" r="65"></circle> <circle class="st4" cx="475.4" cy="910" r="65"></circle> </g> </svg> </div></div></div>
    <!--  END LOADER -->

    <!-- 教师信息修改弹框 -->
    <div class="modal fade" id="personUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">教师个人信息修改</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label">教师编号</label>
                            <div class="col-sm-10">
                                <input type="text" name="tno" class="form-control" disabled="disabled" id="tno_update">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label">姓名</label>
                            <div class="col-sm-10">
                                <input type="text" name="name" class="form-control" id="name_update_input">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label">职称</label>
                            <div class="col-sm-10">
                                <input type="text" name="title" class="form-control" id="title_update_input">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label">专业</label>
                            <div class="col-sm-10">
                                <input type="text" name="department" class="form-control" id="department_update_input">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label">办公室</label>
                            <div class="col-sm-10">
                                <input type="text" name="office" class="form-control" id="office_update_input">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label">电话</label>
                            <div class="col-sm-10">
                                <input type="text" name="tel" class="form-control" id="tel_update_input">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label">电子邮箱</label>
                            <div class="col-sm-10">
                                <input type="email" name="email" class="form-control" id="email_update_input">
                                <span class="help-block"></span>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="person_update_btn">更新</button>
                </div>
            </div>
        </div>
    </div>

    <!-- BEGIN MAIN CONTAINER -->
    <div class="layout-px-spacing">
        <div class="row layout-top-spacing">
            <div class="col-xl-12 col-lg-12 col-sm-12  layout-spacing">
                <div class="widget-content widget-content-area br-6">
                    <div style="text-align: right">
                        <button type="button" class="btn btn-primary" id="edit_btn">修改</button>
                    </div>
                    <div style="margin-left:300px;width: 50%">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label class="control-label">教师编号</label>
                                <div class="col-sm-10">
                                    <input type="text" name="name" class="form-control" disabled="disabled" id="tno">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label">姓名</label>
                                <div class="col-sm-10">
                                    <input type="text" name="name" class="form-control" disabled="disabled" id="name">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label">职称</label>
                                <div class="col-sm-10">
                                    <input type="text" name="title" class="form-control" disabled="disabled" id="title">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label">专业</label>
                                <div class="col-sm-10">
                                    <input type="text" name="department" class="form-control" disabled="disabled" id="department">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label">办公室</label>
                                <div class="col-sm-10">
                                    <input type="text" name="office" class="form-control" disabled="disabled" id="office">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label">电话</label>
                                <div class="col-sm-10">
                                    <input type="text" name="tel" class="form-control" disabled="disabled" id="tel">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label">电子邮箱</label>
                                <div class="col-sm-10">
                                    <input type="email" name="email" class="form-control" disabled="disabled" id="email">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- END MAIN CONTAINER -->

    <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
    <script src="${pageContext.request.contextPath}/static/cork/assets/js/libs/jquery-3.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/cork/bootstrap/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/cork/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/cork/plugins/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/cork/assets/js/app.js"></script>

    <script src="${pageContext.request.contextPath}/static/cork/plugins/highlight/highlight.pack.js"></script>
    <script src="${pageContext.request.contextPath}/static/cork/assets/js/custom.js"></script>
    <!-- END GLOBAL MANDATORY SCRIPTS -->
    <script src="${pageContext.request.contextPath}/static/cork/assets/js/scrollspyNav.js"></script>
    <script type="text/javascript">
        var tno = ${teacher.tno};
        $(function(){
            $("#edit_btn").attr("edit-id",${teacher.tno});
            person(tno);
        });
        function person(tno){
            $.ajax({
                url:"${pageContext.request.contextPath}/teacher/person/"+tno,
                type:"GET",
                success:function(result){
                    var teacher = result.extend.teacher;
                    $("#tno").val(teacher.tno);
                    $("#name").val(teacher.name);
                    $("#sex").val(teacher.sex);
                    $("#department").val(teacher.department);
                    $("#title").val(teacher.title);
                    $("#office").val(teacher.office);
                    $("#tel").val(teacher.tel);
                    $("#email").val(teacher.email);
                }
            });
        }
        //获得课题信息
        function getTeacher(tno){
            $.ajax({
                url:"${pageContext.request.contextPath}/teacher/person/"+tno,
                type:"GET",
                success:function(result){
                    var teacher = result.extend.teacher;
                    $("#tno_update").val(teacher.tno);
                    $("#name_update_input").val(teacher.name);
                    $("#title_update_input").val(teacher.title);
                    $("#department_update_input").val(teacher.department);
                    $("#office_update_input").val(teacher.office);
                    $("#tel_update_input").val(teacher.tel);
                    $("#email_update_input").val(teacher.email);
                }
            });
        }
        //点击编辑，弹出编辑弹窗
        $("#edit_btn").click(function(){
            getTeacher($(this).attr("edit-id"));
            $("#person_update_btn").attr("upd-id",$(this).attr("edit-id"));
            $("#personUpdateModal").modal({
                backdrop:"static"
            });
        });
        //点击更新，更新个人信息
        $("#person_update_btn").click(function(){
            //2、发送ajax请求保存更新的员工数据
            $.ajax({
                url:"${pageContext.request.contextPath}/teacher/updPerson/"+$(this).attr("upd-id"),
                type:"PUT",
                data:$("#personUpdateModal form").serialize(),//表单数据序列化后的数据
                success:function(result){
                    alert(result.msg);
                    //1、关闭对话框
                    $("#personUpdateModal").modal("hide");
                    //2、回到本页面
                    person(tno);
                }
            });
        });
    </script>
</body>
</html>
