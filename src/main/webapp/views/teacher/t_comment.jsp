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
<style>
    table{
        table-layout:fixed;/* 只有定义了表格的布局算法为fixed，下面td的定义才能起作用。 */
    }
    .peace{
        width:100%;
        word-break:keep-all;/* 不换行 */
        white-space:pre-line;/* 不换行 */
        overflow:hidden;/* 内容超出宽度时隐藏超出部分的内容 */
        text-overflow:ellipsis;/* 当对象内文本溢出时显示省略标记(...) ；需与overflow:hidden;一起使用。*/
    }
</style>
<body>

<!-- BEGIN LOADER -->
<div id="load_screen"> <div class="loader"> <div class="loader-content"> <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 792 723" style="enable-background:new 0 0 792 723;" xml:space="preserve"> <g> <g> <path class="st0" d="M213.9,584.4c-47.4-25.5-84.7-60.8-111.8-106.1C75,433.1,61.4,382,61.4,324.9c0-57,13.6-108.1,40.7-153.3 S166.5,91,213.9,65.5s100.7-38.2,159.9-38.2c49.9,0,95,8.8,135.3,26.3s74.1,42.8,101.5,75.7l-85.5,78.9 c-38.9-44.9-87.2-67.4-144.7-67.4c-35.6,0-67.4,7.8-95.4,23.4s-49.7,37.4-65.4,65.4c-15.6,28-23.4,59.8-23.4,95.4 s7.8,67.4,23.4,95.4s37.4,49.7,65.4,65.4c28,15.6,59.7,23.4,95.4,23.4c57.6,0,105.8-22.7,144.7-68.2l85.5,78.9 c-27.4,33.4-61.4,58.9-102,76.5c-40.6,17.5-85.8,26.3-135.7,26.3C314.3,622.7,261.3,809.9,213.9,584.4z"/> </g> <circle class="st1" cx="375.4" cy="322.9" r="100"/> </g> <g> <circle class="st2" cx="275.4" cy="910" r="65"></circle> <circle class="st4" cx="475.4" cy="910" r="65"></circle> </g> </svg> </div></div></div>
<!--  END LOADER -->

<!-- 修改弹框 -->
<div class="modal fade" id="midtermUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">修改回复</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">学生姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="student" disabled="disabled" class="form-control" id="student_upd">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">课题名称</label>
                        <div class="col-sm-10">
                            <input type="text" name="topic" disabled="disabled" class="form-control" id="topic_upd">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">提问内容</label>
                        <div class="col-sm-10">
                            <textarea id="scContent_upd" disabled="disabled" class="form-control"></textarea>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">提问时间</label>
                        <div class="col-sm-10">
                            <input type="text" name="studentTime" disabled="disabled" class="form-control" id="studentTime_upd">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">回复内容</label>
                        <div class="col-sm-10">
                            <textarea name="tcContent"  id="tcContent_upd" class="form-control"></textarea>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">是否置顶</label>
                        <div class="col-sm-10">
                            <select id="all_upd" name="tcAll" class="form-control">
                                <option value="0">否</option>
                                <option value="1">是</option>
                            </select>
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

<!-- 回复弹框 -->
<div class="modal fade" id="replyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">回复</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">学生姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="student" disabled="disabled" class="form-control" id="student_add">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">课题名称</label>
                        <div class="col-sm-10">
                            <input type="text" name="topic" disabled="disabled" class="form-control" id="topic_add">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">提问内容</label>
                        <div class="col-sm-10">
                            <textarea id="scContent_add" disabled="disabled" class="form-control"></textarea>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">提问时间</label>
                        <div class="col-sm-10">
                            <input type="text" name="studentTime" disabled="disabled" class="form-control" id="studentTime_add">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">回复内容</label>
                        <div class="col-sm-10">
                            <textarea  name="tcContent"  id="tcContent_add" class="form-control"></textarea>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">是否置顶</label>
                        <div class="col-sm-10">
                            <select id="all_add" name="tcAll" class="form-control">
                                <option value="0">否</option>
                                <option value="1">是</option>
                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-reply" id="reply_btn">回复</button>
            </div>
        </div>
    </div>
</div>

<!-- 详情弹框 -->
<div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">提问详情</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <div class="col-sm-10">
                            <input type="text" name="scId" class="form-control" disabled="disabled" id="scId">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">学生姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="student" disabled="disabled" class="form-control" id="student">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">课题名称</label>
                        <div class="col-sm-10">
                            <input type="text" name="contents" disabled="disabled" class="form-control" id="topic">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">提问内容</label>
                        <div class="col-sm-10">
                            <textarea id="scContent" disabled="disabled" class="form-control"></textarea>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">提问时间</label>
                        <div class="col-sm-10">
                            <input type="text" name="studentTime" disabled="disabled" class="form-control" id="studentTime">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">回复内容</label>
                        <div class="col-sm-10">
                            <textarea id="tcContent" disabled="disabled" class="form-control"></textarea>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">回复时间</label>
                        <div class="col-sm-10">
                            <input type="text" name="teacherTime" disabled="disabled"  class="form-control" id="teacherTime">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">是否置顶</label>
                        <div class="col-sm-10">
                            <input type="text" name="tcAll" disabled="disabled"  class="form-control" id="all">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="layout-px-spacing">
    <div class="row layout-top-spacing">
        <div class="col-xl-12 col-lg-12 col-sm-12  layout-spacing">
            <div class="widget-content widget-content-area br-6">
                <div class="modal-header">
                    <div style="text-align: center">
                        <h1>学生提问</h1>
                    </div>
                </div>
                <div class="table-responsive mb-4 mt-4">
                    <table class="table table-hover" id="time_table" >
                        <thead>
                        <tr>
                            <th>学生姓名</th>
                            <th>课题名称</th>
                            <th>提问内容</th>
                            <th>提问时间</th>
                            <th>回复内容</th>
                            <th>是否置顶</th>
                            <th>回复时间</th>
                            <th>详情</th>
                            <th>操作</th>
                            <th>置顶操作</th>
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
    function timeStamp2String (time){
        var datetime = new Date();
        datetime.setTime(time);
        var year = datetime.getFullYear();
        var month = datetime.getMonth() + 1;
        var date = datetime.getDate();
        var hour = datetime.getHours();
        if(hour<=9){
            hour="0"+hour;
        }
        var minute = datetime.getMinutes();
        if(minute<=9){
            minute="0"+minute;
        }
        var second = datetime.getSeconds();
        if(second<=9){
            second="0"+second;
        }
        return year + "-" + month + "-" + date+" "+hour+":"+minute+":"+second;
    }
    $(function(){
        to_page(1);
    });
    //去第几页
    function to_page(pn){
        $.ajax({
            url:"${pageContext.request.contextPath}/comment/select/"+tno,
            data:"pn="+pn,
            type:"GET",
            success:function(result){
                build_time_table(result.extend.pageInfo.list);
                build_page_info(result.extend.pageInfo);
                build_page_nav(result.extend.pageInfo);
            }
        });
    }
    //解析显示数据
    function build_time_table(studentCommentList){
        $("#time_table tbody").empty();
        for(var i=0;i<studentCommentList.length;i++) {
            var studentTd = $("<td></td>").append(studentCommentList[i].student.name);
            var topicTd = $("<td></td>").append(studentCommentList[i].topic.name);
            var contentTd = $("<td class='peace'></td>").attr("title", studentCommentList[i].scContent).append(studentCommentList[i].scContent);
            var studentTime = timeStamp2String(studentCommentList[i].scTime);
            var studentTimeTd = $("<td></td>").append(studentTime);
            var tcContent;
            var teacherTime;
            var resultTd = $("<td></td>");
            var teacherTimeTd = $("<td></td>");
            var allTd = $("<td></td>");
            var btnTd2 = $("<td></td>");

            var topBtn = $("<button></button>").addClass("btn btn-primary btn-sm top_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                .append("置顶");

            var notTopBtn = $("<button></button>").addClass("btn btn-primary btn-sm notTop_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                .append("取消置顶");

            var viewBtn = $("<button></button>").addClass("btn btn-primary btn-sm view_btn")
                .append($("<span></span>").addClass("glyphicon"))
                .append("详情");
            viewBtn.attr("view-id",studentCommentList[i].scId);

            var viewTd = $("<td></td>");
            viewTd.append(viewBtn);

            if (studentCommentList[i].teacherComment != null) {
                var editBtn2 = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn2")
                    .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                    .append("编辑");
                editBtn2.attr("edit2-id",studentCommentList[i].scId).attr("edit-id",studentCommentList[i].teacherComment.tcId);

                var delBtn2 =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn2")
                    .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
                    .append("删除");
                delBtn2.attr("del-id",studentCommentList[i].teacherComment.tcId);

                btnTd2.append(editBtn2).append(delBtn2);
                topBtn.attr("top-id", studentCommentList[i].teacherComment.tcId);
                notTopBtn.attr("notTop-id", studentCommentList[i].teacherComment.tcId);
                tcContent = studentCommentList[i].teacherComment.tcContent;
                teacherTime = timeStamp2String(studentCommentList[i].teacherComment.tcTime);
                teacherTimeTd.append(teacherTime);
                if(studentCommentList[i].teacherComment.tcAll === 1){
                    resultTd= $("<td class='peace' style='color: red'></td>").attr("title", tcContent).append(tcContent);
                    allTd= $("<td style='color: red'></td>").append("是");
                }
                else {
                    resultTd= $("<td class='peace'></td>").attr("title", tcContent).append(tcContent);
                    allTd= $("<td></td>").append("否");
                }
            }

            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                .append("回复");
            editBtn.attr("edit-id", studentCommentList[i].scId);



            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
                .append("");

            delBtn.attr("del-id", studentCommentList[i].scId);
            var btnTd = $("<td></td>");
            if (studentCommentList[i].teacherComment === null) {
                btnTd.append("未回复");
                btnTd2.append(editBtn);
            }
            else {
                if(studentCommentList[i].teacherComment.tcAll === 1){
                    btnTd.append(notTopBtn);
                }
                else {
                    btnTd.append(topBtn);
                }
            }
            $("<tr></tr>").append(studentTd)
                .append(topicTd)
                .append(contentTd)
                .append(studentTimeTd)
                .append(resultTd)
                .append(allTd)
                .append(teacherTimeTd)
                .append(viewTd)
                .append(btnTd2)
                .append(btnTd)
                .appendTo("#time_table tbody");
        }
    }
    //解析显示分页信
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

    function getMidterm(scId){
        $.ajax({
            url:"${pageContext.request.contextPath}/comment/detail/"+scId,
            type:"GET",
            success:function(result){
                var studentComment = result.extend.studentComment;
                $("#scId_upd").val(studentComment.scId);
                $("#topic_upd").val(studentComment.topic.name);
                $("#student_upd").val(studentComment.student.name);
                $("#scContent_upd").val(studentComment.scContent);
                var studentTime = timeStamp2String(studentComment.scTime);
                $("#studentTime_upd").val(studentTime);
                $("#tcContent_upd").val(studentComment.teacherComment.tcContent);
                if(studentComment.teacherComment.tcAll === 1 ){
                    $("#all_upd").val(1);
                }
                else {
                    $("#all_upd").val(0);
                }
            }
        });
    }
    //点击编辑，弹出编辑弹窗
    $(document).on("click",".edit_btn2",function(){
        getMidterm($(this).attr("edit2-id"));
        $("#midterm_update_btn").attr("upd-id",$(this).attr("edit-id"));
        $("#midtermUpdateModal").modal({
            backdrop:"static"
        });
    });
    //点击更新，更新记录信息
    $("#midterm_update_btn").click(function(){
        var tcId = $("#midterm_update_btn").attr("upd-id");
        var tcComment = $("#tcContent_upd").val();
        var tcAll = $("#all_upd").val();
        $.ajax({
            url:"${pageContext.request.contextPath}/comment/upd",
            type:"PUT",
            data:"tcId="+tcId+"&tcComment="+tcComment+"&tcAll="+tcAll,
            success:function(result){
                alert(result.msg);
                $("#midtermUpdateModal").modal("hide");
                to_page(pageNum);
            }
        });
    });

    $(document).on("click",".top_btn",function(){
        var name = $(this).parents("tr").find("td:eq(0)").text();
        var tcId = $(this).attr("top-id");
        if(confirm("确认置顶对"+name+"的回复吗？")){
            $.ajax({
                url:"${pageContext.request.contextPath}/comment/top",
                data:"tcId="+tcId+"&tcAll="+1,
                type:"PUT",
                success:function(result){
                    alert(result.msg);
                    to_page(pageNum);
                }
            });
        }
    });
    $(document).on("click",".notTop_btn",function(){
        var name = $(this).parents("tr").find("td:eq(0)").text();
        var tcId = $(this).attr("notTop-id");
        if(confirm("确认取消置顶对"+name+"的回复吗？")){
            $.ajax({
                url:"${pageContext.request.contextPath}/comment/top",
                data:"tcId="+tcId+"&tcAll="+0,
                type:"PUT",
                success:function(result){
                    alert(result.msg);
                    to_page(pageNum);
                }
            });
        }
    });
    //获得课题详情
    function view(scId){
        $.ajax({
            url:"${pageContext.request.contextPath}/comment/detail/"+scId,
            type:"GET",
            success:function(result){
                var studentComment = result.extend.studentComment;
                $("#scId").val(studentComment.scId);
                $("#topic").val(studentComment.topic.name);
                $("#student").val(studentComment.student.name);
                $("#scContent").val(studentComment.scContent);
                var studentTime = timeStamp2String(studentComment.scTime);
                $("#studentTime").val(studentTime);
                var teacherTime = timeStamp2String(studentComment.teacherComment.tcTime);
                $("#tcContent").val(studentComment.teacherComment.tcContent);
                if(studentComment.teacherComment.tcAll === 1 ){
                    $("#all").val("是");
                }
                else {
                    $("#all").val("否");
                }
                $("#teacherTime").val(teacherTime);
            }
        });
    }
    //点击详情，弹出详情弹窗
    $(document).on("click",".view_btn",function(){
        reset_form("#detailModal form");
        view($(this).attr("view-id"));
        $("#detailModal").modal({
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
    //获得
    function getEmp(scId){
        $.ajax({
            url:"${pageContext.request.contextPath}/comment/detail/"+scId,
            type:"GET",
            success:function(result){
                var studentComment = result.extend.studentComment;
                $("#topic_add").val(studentComment.topic.name);
                $("#student_add").val(studentComment.student.name);
                $("#scContent_add").val(studentComment.scContent);
                var studentTime = timeStamp2String(studentComment.scTime);
                $("#studentTime_add").val(studentTime);
            }
        });
    }
    //点击回复，弹出回复弹窗
    $(document).on("click",".edit_btn",function(){
        getEmp($(this).attr("edit-id"));
        $("#reply_btn").attr("reply-id",$(this).attr("edit-id"));
        $("#replyModal").modal({
            backdrop:"static"
        });
    });
    //点击保存，保存信息
    $("#reply_btn").click(function(){
        var scId = $(this).attr("reply-id");
        var tcContent = $("#tcContent_add").val();
        var tcAll = $("#all_add").val();
        $.ajax({
            url:"${pageContext.request.contextPath}/comment/reply/"+scId,
            type:"POST",
            data:"tcContent="+tcContent+"&tcAll="+tcAll,
            success:function(result){
                alert(result.msg);
                $("#replyModal").modal("hide");
                to_page(pageNum);
            }
        });
    });
    //单个删除
    $(document).on("click",".delete_btn2",function(){
        var name = $(this).parents("tr").find("td:eq(0)").text();
        var tcId = $(this).attr("del-id");
        if(confirm("确认删除对【"+name+"】的回复吗？")){
            $.ajax({
                url:"${pageContext.request.contextPath}/comment/del/"+tcId,
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

