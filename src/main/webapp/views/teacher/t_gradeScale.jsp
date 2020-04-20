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
    <title>成绩比例</title>
</head>
<body>

    <!-- BEGIN LOADER -->
    <div id="load_screen"> <div class="loader"> <div class="loader-content"> <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 792 723" style="enable-background:new 0 0 792 723;" xml:space="preserve"> <g> <g> <path class="st0" d="M213.9,584.4c-47.4-25.5-84.7-60.8-111.8-106.1C75,433.1,61.4,382,61.4,324.9c0-57,13.6-108.1,40.7-153.3 S166.5,91,213.9,65.5s100.7-38.2,159.9-38.2c49.9,0,95,8.8,135.3,26.3s74.1,42.8,101.5,75.7l-85.5,78.9 c-38.9-44.9-87.2-67.4-144.7-67.4c-35.6,0-67.4,7.8-95.4,23.4s-49.7,37.4-65.4,65.4c-15.6,28-23.4,59.8-23.4,95.4 s7.8,67.4,23.4,95.4s37.4,49.7,65.4,65.4c28,15.6,59.7,23.4,95.4,23.4c57.6,0,105.8-22.7,144.7-68.2l85.5,78.9 c-27.4,33.4-61.4,58.9-102,76.5c-40.6,17.5-85.8,26.3-135.7,26.3C314.3,622.7,261.3,809.9,213.9,584.4z"/> </g> <circle class="st1" cx="375.4" cy="322.9" r="100"/> </g> <g> <circle class="st2" cx="275.4" cy="910" r="65"></circle> <circle class="st4" cx="475.4" cy="910" r="65"></circle> </g> </svg> </div></div></div>
    <!--  END LOADER -->

    <!-- 课题修改弹框 -->
    <div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">修改课题</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <div class="col-sm-10">
                                <input type="hidden" name="id" class="form-control" disabled="disabled" id="id_update">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">名称</label>
                            <div class="col-sm-10">
                                <input type="text" name="name" class="form-control" id="name_update_input">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">简介</label>
                            <div class="col-sm-10">
                                <input type="text" name="contents" class="form-control" id="contents_update_input">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">类型</label>
                            <div class="col-sm-10">
                                <input type="text" name="type" class="form-control" id="type_update_input">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">来源</label>
                            <div class="col-sm-10">
                                <input type="text" name="source" class="form-control" id="source_update_input">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">难易程度</label>
                            <div class="col-sm-10">
                                <select id="difficulty_update_input" name="difficulty" class="form-control">
                                    <option value="易">易</option>
                                    <option value="中">中</option>
                                    <option value="难">难</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">是否需要支持</label>
                            <div class="col-sm-10">
                                <select id="support_update_input" name="support" class="form-control">
                                    <option value="是">是</option>
                                    <option value="否">否</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">审核教研室</label>
                            <div class="col-sm-10">
                                <select id="department_update_input" name="department" class="form-control">
                                    <option value="计算机科学与技术">计算机科学与技术</option>
                                    <option value="软件工程">软件工程</option>
                                    <option value="网络工程">网络工程</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">选题人数</label>
                            <div class="col-sm-10">
                                <select id="num_update_input" name="num" class="form-control">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                </select>
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

    <!-- 课题添加弹框 -->
    <div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">申报课题</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">课题名称</label>
                            <div class="col-sm-10">
                                <input type="text" name="name" class="form-control" id="name_add_input">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">简介</label>
                            <div class="col-sm-10">
                                <input type="text" name="contents" class="form-control" id="contents_add_input">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">类型</label>
                            <div class="col-sm-10">
                                <input type="text" name="type" class="form-control" id="type_add_input">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">来源</label>
                            <div class="col-sm-10">
                                <input type="text" name="source" class="form-control" id="source_add_input">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">难易程度</label>
                            <div class="col-sm-10">
                                <select id="difficulty_add_input" name="difficulty" class="form-control">
                                    <option value="易">易</option>
                                    <option value="中">中</option>
                                    <option value="难">难</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">是否需要扶持</label>
                            <div class="col-sm-10">
                                <select id="support_add_input" name="support" class="form-control">
                                    <option value="是">是</option>
                                    <option value="否">否</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">审题教研室</label>
                            <div class="col-sm-10">
                                <select id="department_add_input" name="department" class="form-control">
                                    <option value="计算机科学与技术">计算机科学与技术</option>
                                    <option value="网络工程">网络工程</option>
                                    <option value="软件工程">软件工程</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">选题人数</label>
                            <div class="col-sm-10">
                                <select id="num_add_input" name="num" class="form-control">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                </select>
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
                                <th>比例编号</th>
                                <th>平时成绩</th>
                                <th>期中验收</th>
                                <th>验收</th>
                                <th>报告</th>
                                <th>状态</th>
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
    var pageNum,total;
    var tno = ${teacher.tno};
    $(function(){
        to_page(1);
    });
    $("#topic_btn").click(function () {
        to_page(1);
    });
    function to_page(pn){
        $.ajax({
            url:"${pageContext.request.contextPath}/teacher/topic/"+tno,
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
        $("#topic_add_btn").attr("add-id",tno);
        $("#topic_table tbody").empty();
        for(var i=0;i<topics.length;i++){
            var topicIdTd = $("<td></td>").append(topics[i].id);
            var topicNameTd = $("<td></td>").append(topics[i].name);
            var topicDepartmentTd = $("<td></td>").append(topics[i].department);
            var statusTd = $("<td></td>");
            var viewBtn = $("<button></button>").addClass("btn btn-primary btn-sm view_btn")
                .append($("<span></span>").addClass("glyphicon"))
                .append("详情");
            //为详情按钮添加一个自定义的属性，来表示当前课题id
            viewBtn.attr("view-id",topics[i].id);
            var applyBtn = $("<button></button>").addClass("btn btn-primary btn-sm apply_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                .append("申请");
            //为申请按钮添加一个自定义的属性，来表示当前课题id
            applyBtn.attr("apply-id",topics[i].id);
            var reApplyBtn = $("<button></button>").addClass("btn btn-primary btn-sm reApply_Btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                .append("重新申请");
            //为重新申请按钮添加一个自定义的属性，来表示当前课题id
            reApplyBtn.attr("reApply-id",topics[i].id);
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
            var viewBtnTd = $("<td></td>").append(viewBtn);
            var btnTd = $("<td></td>");
            var btn1Td = $("<td></td>");
            if (topics[i].status==0)
            {
                statusTd.append("未处理");
                btnTd.append("已申请");
                btn1Td.append("已申请");
            }
            if (topics[i].status==1)
            {
                statusTd.append("已同意");
                btnTd.append("已同意");
                btn1Td.append("已同意");
            }
            if (topics[i].status==2)
            {
                statusTd.append("已拒绝");
                btnTd.append(reApplyBtn);
                btn1Td.append(editBtn).append(delBtn);
            }
            if (topics[i].status==3)
            {
                statusTd.append("已重新申请");
                btnTd.append(reApplyBtn);
                btn1Td.append(editBtn).append(delBtn);
            }
            if (topics[i].status==4)
            {
                statusTd.append("未申请");
                btnTd.append(applyBtn);
                btn1Td.append(editBtn).append(delBtn);
            }
            $("<tr></tr>").append(topicIdTd)
                .append(topicNameTd)
                .append(topicDepartmentTd)
                .append(statusTd)
                .append(viewBtnTd)
                .append(btnTd)
                .append(btn1Td)
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
    //点击保存，添加课题。
    $("#emp_save_btn").click(function(){
        $.ajax({
            url:"${pageContext.request.contextPath}/teacher/addTopic/"+$("#topic_add_btn").attr("add-id"),
            type:"POST",
            data:$("#empAddModal form").serialize(),
            success:function(result){
                if(result.code == 100){
                    $("#empAddModal").modal('hide');
                    to_page(total);
                }else{
                    alert("添加失败！");
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
                $("#id_update").val(topic.id);
                $("#name_update_input").val(topic.name);
                $("#contents_update_input").val(topic.contents);
                $("#type_update_input").val(topic.type);
                $("#source_update_input").val(topic.source);
                $("#difficulty_update_input").val(topic.difficulty);
                $("#support_update_input").val(topic.support);
                $("#department_update_input").val(topic.department);
                $("#num_update_input").val(topic.num);
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
    //点击更新，更新课题信息
    $("#emp_update_btn").click(function(){
        $.ajax({
            url:"${pageContext.request.contextPath}/teacher/updTopic/"+$(this).attr("upd-id"),
            type:"PUT",
            data:$("#empUpdateModal form").serialize(),
            success:function(result){
                alert(result.msg);
                //1、关闭对话框
                $("#empUpdateModal").modal("hide");
                //2、回到本页面
                to_page(pageNum);
            }
        });
    });
    //获得课题信息
    function view(topicId){
        $.ajax({
            url:"${pageContext.request.contextPath}/teacher/topicDetails/"+topicId,
            type:"GET",
            success:function(result){
                var topic = result.extend.topic;
                $("#id").val(topic.id);
                $("#name").val(topic.name);
                $("#contents").val(topic.contents);
                $("#type").val(topic.type);
                $("#source").val(topic.source);
                $("#difficulty").val(topic.difficulty);
                $("#support").val(topic.support);
                $("#department").val(topic.department);
                $("#num").val(topic.num);
            }
        });
    }
    //点击详情，弹出详情弹窗
    $(document).on("click",".view_btn",function(){
        view($(this).attr("view-id"));
        $("#detailModal").modal({
            backdrop:"static"
        });
    });
    //点击申请
    $(document).on("click",".apply_btn",function(){
        var name = $(this).parents("tr").find("td:eq(2)").text();
        var topicId = $(this).attr("apply-id");
        if(confirm("确认申请课题"+name+"吗？")){
            $.ajax({
                url:"${pageContext.request.contextPath}/teacher/applyTopic/"+topicId,
                type:"PUT",
                success:function(result){
                    alert(result.msg);
                    to_page(pageNum);
                }
            });
        }
    });
    //点击重新申请
    $(document).on("click",".reApply_Btn",function(){
        var name = $(this).parents("tr").find("td:eq(2)").text();
        var topicId = $(this).attr("reApply-id");
        if(confirm("确认重新申请课题"+name+"吗？")){
            $.ajax({
                url:"${pageContext.request.contextPath}/teacher/reApplyTopic/"+topicId,
                type:"PUT",
                success:function(result){
                    alert(result.msg);
                    to_page(pageNum);
                }
            });
        }
    });
    //单个删除
    $(document).on("click",".delete_btn",function(){
        var ename = $(this).parents("tr").find("td:eq(2)").text();
        var topicId = $(this).attr("del-id");
        if(confirm("确认删除【"+ename+"】吗？")){
            $.ajax({
                url:"${pageContext.request.contextPath}/teacher/delTopic/"+topicId,
                type:"DELETE",
                success:function(result){
                    alert(result.msg);
                    to_page(pageNum);
                }
            });
        }
    });
</script>
</body>
</html>

