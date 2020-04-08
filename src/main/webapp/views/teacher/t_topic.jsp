<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">

    <link href="${pageContext.request.contextPath}/static/assets/css/loader.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/static/assets/js/loader.js"></script>

    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/static/assets/css/plugins.css" rel="stylesheet" type="text/css" />
    <title>我的课题</title>
</head>
<body>

    <!-- BEGIN LOADER -->
    <div id="load_screen"> <div class="loader"> <div class="loader-content"> <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 792 723" style="enable-background:new 0 0 792 723;" xml:space="preserve"> <g> <g> <path class="st0" d="M213.9,584.4c-47.4-25.5-84.7-60.8-111.8-106.1C75,433.1,61.4,382,61.4,324.9c0-57,13.6-108.1,40.7-153.3 S166.5,91,213.9,65.5s100.7-38.2,159.9-38.2c49.9,0,95,8.8,135.3,26.3s74.1,42.8,101.5,75.7l-85.5,78.9 c-38.9-44.9-87.2-67.4-144.7-67.4c-35.6,0-67.4,7.8-95.4,23.4s-49.7,37.4-65.4,65.4c-15.6,28-23.4,59.8-23.4,95.4 s7.8,67.4,23.4,95.4s37.4,49.7,65.4,65.4c28,15.6,59.7,23.4,95.4,23.4c57.6,0,105.8-22.7,144.7-68.2l85.5,78.9 c-27.4,33.4-61.4,58.9-102,76.5c-40.6,17.5-85.8,26.3-135.7,26.3C314.3,622.7,261.3,809.9,213.9,584.4z"/> </g> <circle class="st1" cx="375.4" cy="322.9" r="100"/> </g> <g> <circle class="st2" cx="275.4" cy="910" r="65"></circle> <circle class="st4" cx="475.4" cy="910" r="65"></circle> </g> </svg> </div></div></div>
    <!--  END LOADER -->

    <!-- 员工修改的模态框 -->
    <div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">课题修改</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">id</label>
                            <div class="col-sm-10">
                                <p class="form-control-static" id="id_update_static"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">cname</label>
                            <div class="col-sm-10">
                                <input type="text" name="cname" class="form-control" id="cname_update_input">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">ename</label>
                            <div class="col-sm-10">
                                <input type="text" name="ename" class="form-control" id="ename_update_input">
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
    <!-- 课题添加的模态框 -->
    <div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">申请课题</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">ecame</label>
                            <div class="col-sm-10">
                                <input type="text" name="ecame" class="form-control" id="ecame_add_input">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">department</label>
                            <div class="col-sm-10">
                                <input type="text" name="department" class="form-control" id="department_add_input">
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
                        <h1>我的课题</h1>
                        <div class="row">
                            <div>
                                <button id="topic_btn" class="btn btn-s btn-primary">刷新</button>
                                <button id="topic_add_btn" class="btn btn-s btn-primary">新增</button>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive mb-4 mt-4">
                        <table class="table table-hover" id="topic_table" >
                            <thead>
                            <tr>
                                <th>课题编号</th>
                                <th>课题名称</th>
                                <th>申报学院</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                    <!-- 显示分页信息 -->
                    <div class="row">
                        <!--分页文字信息  -->
                        <div class="col-md-6" id="page_info_area"></div>
                        <!-- 分页条信息 -->
                        <div class="paginating-container pagination-solid" id="page_nav_area"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
<script src="${pageContext.request.contextPath}/static/assets/js/libs/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/plugins/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/js/app.js"></script>

<script src="${pageContext.request.contextPath}/static/assets/js/custom.js"></script>
<!-- END GLOBAL MANDATORY SCRIPTS -->

<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="${pageContext.request.contextPath}/static/plugins/table/datatable/datatables.js"></script>
<!-- BEGIN THEME GLOBAL STYLE -->
<script src="${pageContext.request.contextPath}/static/assets/js/scrollspyNav.js"></script>
<script src="${pageContext.request.contextPath}/static/plugins/sweetalerts/sweetalert2.min.js"></script>
<script src="${pageContext.request.contextPath}/static/plugins/sweetalerts/custom-sweetalert.js"></script>
<!-- END PAGE LEVEL SCRIPTS -->

<script type="text/javascript">
    var pageNum,total;

    $(function(){
        to_page(1);
    });
    $("#topic_btn").click(function () {
        to_page(1);
    });
    function to_page(pn){
        $.ajax({
            url:"${pageContext.request.contextPath}/teacher/topic/"+${teacher.tno},
            data:"pn="+pn,
            type:"GET",
            success:function(result){
                build_topic_table(result.extend.pageInfo.list);
                build_page_info(result.extend.pageInfo);
                build_page_nav(result.extend.pageInfo);
            }
        });
    }
    //解析显示数据
    function build_topic_table(topics){
        $("#topic_add_btn").attr("add-id",topics[0].tno);
        $("#topic_table tbody").empty();
        for(var i=0;i<topics.length;i++){
            var topicIdTd = $("<td></td>").append(topics[i].id);
            var topicNameTd = $("<td></td>").append(topics[i].cname);
            var topicDepartmentTd = $("<td></td>").append(topics[i].department);
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                .append("编辑");
            //为编辑按钮添加一个自定义的属性，来表示当前课题id
            editBtn.attr("edit-id",topics[i].id);
            var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
                .append("删除");
            //为删除按钮添加一个自定义的属性来表示当前删除的课题id
            delBtn.attr("del-id",topics[i].id);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>").append(topicIdTd)
                .append(topicNameTd)
                .append(topicDepartmentTd)
                .append(btnTd)
                .appendTo("#topic_table tbody");
        }
    }
    //解析显示分页信息
    function build_page_info(pageInfo){
        $("#page_info_area").empty();
        $("#page_info_area").append("当前第"+pageInfo.pageNum+"页,总"+
            pageInfo.pages+"页,总"+
            pageInfo.total+"条记录");
        total = pageInfo.total;
        pageNum = pageInfo.pageNum;
    }
    //解析显示分页条
    function build_page_nav(pageInfo){
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");
        //构建元素
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("上一页"));
        if(pageInfo.hasPreviousPage == false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else{
            //为元素添加点击翻页的事件
            firstPageLi.click(function(){
                to_page(1);
            });
            prePageLi.click(function(){
                to_page(pageInfo.pageNum -1);
            });
        }
        var nextPageLi = $("<li></li>").append($("<a></a>").append("下一页"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        if(pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function(){
                to_page(pageInfo.pageNum +1);
            });
            lastPageLi.click(function(){
                to_page(pageInfo.pages);
            });
        }
        //添加首页和前一页 的提示
        ul.append(firstPageLi).append(prePageLi);
        //1,2，3遍历给ul中添加页码提示
        $.each(pageInfo.navigatepageNums,function(index,item){
            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if(pageInfo.pageNum == item){
                numLi.addClass("active");
            }
            numLi.click(function(){
                to_page(item);
            });
            ul.append(numLi);
        });
        //添加下一页和末页 的提示
        ul.append(nextPageLi).append(lastPageLi);
        //把ul加入到nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }
    //点击新增按钮弹出模态框。
    $("#topic_add_btn").click(function(){
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
    //点击保存，修改课题。
    $("#emp_save_btn").click(function(){
        $.ajax({
            url:"${pageContext.request.contextPath}/teacher/addTopic/"+$("#topic_add_btn").attr("add-id"),
            type:"POST",
            data:$("#empAddModal form").serialize(),//表单数据序列化，键值对儿提交，后台控制器直接解析
            success:function(result){
                if(result.code == 100){
                    //员工保存成功；
                    //1、关闭模态框
                    $("#empAddModal").modal('hide');
                    //2、来到最后一页，显示刚才保存的数据
                    //发送ajax请求显示最后一页数据即可
                    to_page(total);
                }else{
                    //显示失败信息
                    //有哪个字段的错误信息就显示哪个字段的；
                    alert("错误");
                    }
                }
        });
    });
    //获得课题信息
    function getEmp(topicId){
        $.ajax({
            url:"${pageContext.request.contextPath}/teacher/topicDetails/"+topicId,
            type:"GET",
            success:function(result){
                var topic = result.extend.topic;
                $("#id_update_static").val(topic.id);
                $("#cname_update_input").val(topic.cname);
                $("#ename_update_input").val(topic.ename);
                $("#department_update_input").val(topic.department);
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
    //点击更新，更新员工信息
    $("#emp_update_btn").click(function(){
        //2、发送ajax请求保存更新的员工数据
        $.ajax({
            url:"${pageContext.request.contextPath}/teacher/updTopic/"+$(this).attr("upd-id"),
            type:"PUT",
            data:$("#empUpdateModal form").serialize(),//表单数据序列化后的数据
            success:function(result){
                alert(result.msg);
                //1、关闭对话框
                $("#empUpdateModal").modal("hide");
                //2、回到本页面
                to_page(pageNum);
            }
        });
    });
    //单个删除
    $(document).on("click",".delete_btn",function(){
        //1、弹出是否确认删除对话框
        var ename = $(this).parents("tr").find("td:eq(2)").text();
        var topicId = $(this).attr("del-id");
        //alert($(this).parents("tr").find("td:eq(1)").text());
        if(confirm("确认删除【"+ename+"】吗？")){
            //确认，发送ajax请求删除即可
            $.ajax({
                url:"${pageContext.request.contextPath}/teacher/delTopic/"+topicId,
                type:"DELETE",
                success:function(result){
                    alert(result.msg);
                    //回到本页
                    to_page(pageNum);
                }
            });
        }
    });
</script>
</body>
</html>

