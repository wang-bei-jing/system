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
    <title>期中检查记录</title>
</head>
<body>

<!-- BEGIN LOADER -->
<div id="load_screen"> <div class="loader"> <div class="loader-content"> <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 792 723" style="enable-background:new 0 0 792 723;" xml:space="preserve"> <g> <g> <path class="st0" d="M213.9,584.4c-47.4-25.5-84.7-60.8-111.8-106.1C75,433.1,61.4,382,61.4,324.9c0-57,13.6-108.1,40.7-153.3 S166.5,91,213.9,65.5s100.7-38.2,159.9-38.2c49.9,0,95,8.8,135.3,26.3s74.1,42.8,101.5,75.7l-85.5,78.9 c-38.9-44.9-87.2-67.4-144.7-67.4c-35.6,0-67.4,7.8-95.4,23.4s-49.7,37.4-65.4,65.4c-15.6,28-23.4,59.8-23.4,95.4 s7.8,67.4,23.4,95.4s37.4,49.7,65.4,65.4c28,15.6,59.7,23.4,95.4,23.4c57.6,0,105.8-22.7,144.7-68.2l85.5,78.9 c-27.4,33.4-61.4,58.9-102,76.5c-40.6,17.5-85.8,26.3-135.7,26.3C314.3,622.7,261.3,809.9,213.9,584.4z"/> </g> <circle class="st1" cx="375.4" cy="322.9" r="100"/> </g> <g> <circle class="st2" cx="275.4" cy="910" r="65"></circle> <circle class="st4" cx="475.4" cy="910" r="65"></circle> </g> </svg> </div></div></div>
<!--  END LOADER -->

<!-- 修改弹框 -->
<div class="modal fade" id="midtermUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">修改期中检查记录</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <div class="col-sm-10">
                            <input type="hidden" name="mId" class="form-control" disabled="disabled" id="mId_update_input">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">学生姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="sName" class="form-control" disabled="disabled" id="sName_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">课题名</label>
                        <div class="col-sm-10">
                            <input type="text" name="tpName" class="form-control" disabled="disabled" id="tpName_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">有无报告</label>
                        <div class="col-sm-10">
                            <select name="presentation" id="presentation_update_input" class="form-control">
                                <option value="1">有</option>
                                <option value="2">无</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">进度</label>
                        <div class="col-sm-10">
                            <input type="text" name="speed" class="form-control" id="speed_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">存在问题</label>
                        <div class="col-sm-10">
                            <input type="text" name="problem" class="form-control" id="problem_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">结论</label>
                        <div class="col-sm-10">
                            <input type="text" name="comment" class="form-control" id="comment_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">grId</label>
                        <div class="col-sm-10">
                            <input type="text" name="grId" class="form-control" disabled="disabled" id="grId_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">成绩</label>
                        <div class="col-sm-10">
                            <input type="number" name="grGrade_upd" class="form-control" id="grGrade_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="midterm_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>

<!-- 详情弹框 -->
<div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">期中记录详情</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <div class="col-sm-10">
                            <input type="hidden" name="id" class="form-control" disabled="disabled" id="id">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">学生姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="sName" class="form-control" disabled="disabled" id="sName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">课题名</label>
                        <div class="col-sm-10">
                            <input type="text" name="tpName" class="form-control" disabled="disabled" id="tpName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">有无文档</label>
                        <div class="col-sm-10">
                            <input type="text" name="presentation" class="form-control" disabled="disabled" id="presentation">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">进度</label>
                        <div class="col-sm-10">
                            <input type="text" name="speed" class="form-control" disabled="disabled" id="speed">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">存在问题</label>
                        <div class="col-sm-10">
                            <input type="text" name="problem" class="form-control" disabled="disabled" id="problem">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">结论</label>
                        <div class="col-sm-10">
                            <input type="text" name="comment" class="form-control" disabled="disabled" id="comment">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">得分</label>
                        <div class="col-sm-10">
                            <input type="number" name="grGrade" class="form-control" disabled="disabled" id="grGrade">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- 添加弹框 -->
<div class="modal fade" id="midtermAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">添加中期检查记录</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">学生姓名</label>
                        <div class="col-sm-10">
                            <select id="student" name="tsId" class="form-control" onchange="getTopic()">
                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">课题名</label>
                        <div class="col-sm-10">
                            <select id="topic" class="form-control">
                                <option>---请选择课题---</option>
                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">有无报告</label>
                        <div class="col-sm-10">
                            <select name="presentation" id="presentation_add_input" class="form-control">
                                <option value="1">有</option>
                                <option value="2">无</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">进度</label>
                        <div class="col-sm-10">
                            <input type="text" name="speed" class="form-control" id="speed_add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">问题</label>
                        <div class="col-sm-10">
                            <input type="text" name="problem" class="form-control" id="problem_add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">评论</label>
                        <div class="col-sm-10">
                            <input type="text" name="comment" class="form-control" id="comment_add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">成绩</label>
                        <div class="col-sm-10">
                            <input type="number" name="grGrade_add" class="form-control" id="grGrade_add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="midterm_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<div class="layout-px-spacing">
    <div class="row layout-top-spacing">
        <div class="col-xl-12 col-lg-12 col-sm-12  layout-spacing">
            <div class="widget-content widget-content-area br-6">
                <div class="modal-header">
                    <h1>我的期中检查记录</h1>
                    <div class="row">
                        <div>
                            <button id="midterm_btn" class="btn btn-s btn-primary">刷新</button>
                            <button id="midterm_add_btn" class="btn btn-s btn-primary">新增</button>
                        </div>
                    </div>
                </div>
                <div class="table-responsive mb-4 mt-4">
                    <table class="table table-hover" id="midterm_table" >
                        <thead>
                        <tr>
                            <th>学生姓名</th>
                            <th>课题名</th>
                            <th>有无报告</th>
                            <th>进度</th>
                            <th>存在问题</th>
                            <th>结论</th>
                            <th>得分</th>
                            <th>详情</th>
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
    $("#midterm_btn").click(function () {
        to_page(1);
    });
    function to_page(pn){
        $.ajax({
            url:"${pageContext.request.contextPath}/teacher/midterm/"+tno,
            data:"pn="+pn,
            type:"GET",
            success:function(result){
                build_midterm_table(result.extend.pageInfo.list);
                build_page_info(result.extend.pageInfo);
                build_page_nav(result.extend.pageInfo);
                var grades = result.extend.pageInfo.list;
                for(var i=0;i<grades.length;i++){
                    calculate(grades[i].tsId);
                }
            }
        });
    }
    function calculate(gTsId){
        $.ajax({
            url:"${pageContext.request.contextPath}/grade/midterm/"+gTsId,
            type:"GET",
            success:function(){
            }
        });
    }
    //解析显示数据
    function build_midterm_table(midterms){
        $("#midterm_add_btn").attr("add-id",tno);
        $("#midterm_table tbody").empty();
        for(var i=0;i<midterms.length;i++){
            var midtermIdTd = $("<td></td>").append(midterms[i].mId);
            var midtermsNameTd = $("<td></td>").append(midterms[i].student.name);
            var midtermtpNameTd = $("<td></td>").append(midterms[i].topic.name);
            var midtermpresentationTd;
            if(midterms[i].presentation === 1){
                midtermpresentationTd = $("<td></td>").append("有");
            }
            else {
                midtermpresentationTd = $("<td></td>").append("没有");
            }
            var midtermspeedTd = $("<td></td>").append(midterms[i].speed);
            var midtermproblemTd = $("<td></td>").append(midterms[i].problem);
            var midtermcommentTd = $("<td></td>").append(midterms[i].comment);
            var midtermgradeTd = $("<td></td>").append(midterms[i].gradeRecord.grGrade);
            var viewBtn = $("<button></button>").addClass("btn btn-primary btn-sm view_btn")
                .append($("<span></span>").addClass("glyphicon"))
                .append("详情");
            //为详情按钮添加一个自定义的属性，来表示当前记录id
            viewBtn.attr("view-id",midterms[i].mId);
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                .append("编辑");
            //为编辑按钮添加一个自定义的属性，来表示当前记录id
            editBtn.attr("edit-id",midterms[i].mId);
            var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
                .append("删除");
            //为删除按钮添加一个自定义的属性来表示当前删除的记录id
            delBtn.attr("del-id",midterms[i].mId);
            var viewBtnTd = $("<td></td>").append(viewBtn);
            var btnTd = $("<td></td>").append(editBtn).append(delBtn);
            $("<tr></tr>").append(midtermsNameTd)
                .append(midtermtpNameTd)
                .append(midtermpresentationTd)
                .append(midtermspeedTd)
                .append(midtermproblemTd)
                .append(midtermcommentTd)
                .append(midtermgradeTd)
                .append(viewBtnTd)
                .append(btnTd)
                .appendTo("#midterm_table tbody");
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
        if(pageInfo.hasPreviousPage === false){
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
        if(pageInfo.hasNextPage === false){
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
            if(pageInfo.pageNum === item){
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

    //新增时显示学生姓名和课题
    function getTopicSelect(ele){
        //清空之前下拉列表的值
        $(ele).empty();
        $.ajax({
            url:"${pageContext.request.contextPath}/topicSelect",
            type:"GET",
            success:function(result){
                var optionEle = $("<option></option>").append("---请选择学生---");
                optionEle.appendTo(ele);
                $.each(result.extend.topicSelectList,function(){
                    var optionEle1 = $("<option></option>").append(this.student.name).attr("value",this.id);
                    optionEle1.appendTo(ele);
                });
            }
        });
    }
    //级联显示课题名
    function getTopic(){
        //清空之前下拉列表的值
        var id = $("#midtermAddModal #student").val();
        $("#midtermAddModal #topic").empty();
        var optionEle = $("<option></option>").append("---请选择课题---");
        optionEle.appendTo("#midtermAddModal #topic");
        $.ajax({
            url:"${pageContext.request.contextPath}/getTopic/"+id,
            type:"GET",
            success:function(result){
                var optionEle1 = $("<option></option>").append(result.extend.topicSelect.topic.name);
                optionEle1.appendTo("#midtermAddModal #topic");
            }
        });
    }
    //点击新增按钮弹出模态框。
    $("#midterm_add_btn").click(function(){
        //清除表单数据（表单完整重置（表单的数据，表单的样式））
        reset_form("#midtermAddModal form");
        getTopicSelect("#midtermAddModal #student");
        //弹出模态框
        $("#midtermAddModal").modal({
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
    //点击保存，添加记录。
    $("#midterm_save_btn").click(function(){
        $.ajax({
            url:"${pageContext.request.contextPath}/teacher/addMidterm/"+$("#midterm_add_btn").attr("add-id"),
            type:"POST",
            data:$("#midtermAddModal form").serialize(),
            success:function(result){
                if(result.code == 100){
                    $("#midtermAddModal").modal('hide');
                    to_page(total);
                }else{
                    alert("添加失败！");
                }
            }
        });
    });
    //获得课题信息
    function getMidterm(mId){
        $.ajax({
            url:"${pageContext.request.contextPath}/teacher/midtermDetails/"+mId,
            type:"GET",
            success:function(result){
                var midterm = result.extend.midterm;
                $("#mId_update_input").val(midterm.mId);
                $("#sName_update_input").val(midterm.student.name);
                $("#tpName_update_input").val(midterm.topic.name);
                $("#presentation_update_input").val(midterm.presentation);
                $("#speed_update_input").val(midterm.speed);
                $("#problem_update_input").val(midterm.problem);
                $("#comment_update_input").val(midterm.comment);
                $("#grId_update_input").val(midterm.grId);
                $("#grGrade_update_input").val(midterm.gradeRecord.grGrade);
            }
        });
    }
    //点击编辑，弹出编辑弹窗
    $(document).on("click",".edit_btn",function(){
        getMidterm($(this).attr("edit-id"));
        $("#midterm_update_btn").attr("upd-id",$(this).attr("edit-id"));
        $("#midtermUpdateModal").modal({
            backdrop:"static"
        });
    });
    //点击更新，更新记录信息
    $("#midterm_update_btn").click(function(){
        $.ajax({
            url:"${pageContext.request.contextPath}/teacher/updMidterm/"+$(this).attr("upd-id"),
            type:"PUT",
            data:$("#midtermUpdateModal form").serialize(),
            success:function(result){
                alert(result.msg);
                $("#midtermUpdateModal").modal("hide");
                to_page(pageNum);
            }
        });
    });
    //获得记录详细信息
    function view(mId){
        $.ajax({
            url:"${pageContext.request.contextPath}/teacher/midtermDetails/"+mId,
            type:"GET",
            success:function(result){
                var midterm = result.extend.midterm;
                $("#id").val(midterm.mId);
                $("#sName").val(midterm.student.name);
                $("#tpName").val(midterm.topic.name);
                if(midterm.presentation === 1){
                    $("#presentation").val("有");
                }
                else {
                    $("#presentation").val("没有");
                }
                $("#speed").val(midterm.speed);
                $("#problem").val(midterm.problem);
                $("#comment").val(midterm.comment);
                $("#grGrade").val(midterm.gradeRecord.grGrade);
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
    //单个删除
    $(document).on("click",".delete_btn",function(){
        var name = $(this).parents("tr").find("td:eq(0)").text();
        var mId = $(this).attr("del-id");
        if(confirm("确认删除【"+name+"】吗？")){
            $.ajax({
                url:"${pageContext.request.contextPath}/teacher/delMidterm/"+mId,
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

