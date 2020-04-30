<%@ page import="edu.zzti.bean.TimeManger" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <link href="${pageContext.request.contextPath}/static/mainstatic/css/index.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/static/mainstatic/js/index.js"></script>
    <%--引入jquery--%>
    <script src="${pageContext.request.contextPath}/static/mainstatic/bootstrap/jquery/jquery-1.12.4.min.js"></script>
    <!-- 引入 Bootstrap样式-->
    <link href="${pageContext.request.contextPath}/static/mainstatic/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/static/mainstatic/bootstrap/js/bootstrap.min.js"></script>
    <c:set var="request" value="${pageContext.request.contextPath}"></c:set>


    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/mainstatic/bootstrap/css/bootstrap-theme.css">
    <script type="text/javascript">
        /*弹出添加模块框*/
        $(document).ready(function() {
            $("#add_modal", this).click(function () {

                $("#Add").modal({
                    backdrop: "static",
                });
            })
        });
        /*弹出修改模块框*/
        $(document).ready(function() {
            $("#edit_btn", this).click(function () {
                $("#Update").modal({

                    backdrop: "static",
                });
            })
        });
        /*删除确认*/
        $(document).on("click",".delete_btn",function(){
            if(confirm("确认删除此项吗?")){
                return true;
            }else{
                return false;
            }
        });
        $(document).ready(function(){
            $("tbody>tr:odd").css("background-color","#e4e4e4");
            $("tbody>tr:even").css("background-color","white");
        });
    </script>

    <style>


        .table-hover > tbody > tr:hover > td {
            color: red;
            cursor: pointer;
        }
        table{
            border-collapse: collapse;
            border-spacing: 0;
            border: 1px solid #404060;
            width: 500px;
            font-size: 10px;
            font-family: "微软雅黑";
        }
        th {
            text-align: center;
            vertical-align: middle;
            border: 1px solid #404060;
            padding: 10px;
            background-color: rgba(0, 56, 78, 0.74);
            font: bold 15px "微软雅黑";
            color: #fff;
        }
        td{
            text-align: center;
            vertical-align: middle;
            border: 1px solid #404060;
            padding: 10px;
        }
    </style>

    <style>
        .page-header{
            float: left;
            z-index: 0;
            height: 100%;
            width: 100%;
            border: 1px solid #DBDBDB;
            margin: 4.5% 2% 0% 1%;
            padding: 0% 0% 0% 0%;
        }
        .header{
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 3;
            color: white;
            font-size: 18px;
            height: 7%;
            background:#204d74;
        }
    </style>
</head>
<body>

<div id="main_page" class="page-header">
    <!-- 搭建显示页面 -->
    <div class="container" style="width: 100%">
        <div class="modal-header">
            <h2>学生选题时间管理</h2>
            <!-- 按钮 -->
            <div class="row">
                <div class="col-md-4 col-md-offset-10">
                    <button class="btn btn-success" id="add_modal" >添加时间范围</button>
                </div>
            </div>
        </div>
        <br>
        <!-- 显示表格数据 -->
        <div class="row">
            <div class="col-md-12" >
                <table id="time_table" class="table table-condensed table-striped  table-hover" style="text-align: center" >
                    <thead style="color: red">
                    <tr>
                        <th>起始时间</th>
                        <th>结束时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- 添加模态框 -->
        <div class="modal fade" id="Add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" >添加时间限制</h4>
                    </div>
                    <div class="modal-body">
                        <form action="${pageContext.request.contextPath}/timeMangerAdd" method="post" class="form-horizontal">
                            <input type="text" name="tiCategory" value="2" style="display: none">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">开始时间</label>
                                <div class="col-sm-10">
                                    <input type="datetime-local" min="1970-01-01 00:00" max="2099-12-31 00:00" value="2020-06-01T08:00" name="tiBegin">

                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">结束时间</label>
                                <div class="col-sm-10">
                                    <input type="datetime-local" min="1970-01-01 00:00" max="2099-12-31 00:00 " value="2020-06-03T00:00" name="tiEnd">
                                </div>
                            </div>


                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <button type="submit" class="btn btn-primary" >保存</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- 修改模态框 -->
        <div class="modal fade" id="Update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" >修改时间信息</h4>
                    </div>
                    <div class="modal-body">
                        <form action="${pageContext.request.contextPath}/timeMangerUpd" method="post" class="form-horizontal">
                            <input type="text" name="tiId" value="${tpsTimeManger.tiId}" style="display: none"/>
                            <input type="text" name="tiCategory" value="2" style="display: none">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">开始时间</label>
                                <div class="col-sm-10">
                                    <%
                                        Object obj=request.getSession().getAttribute("tpsTimeManger");
                                        if (obj!=null){
                                            TimeManger timeManger=(TimeManger)obj;
                                            Date begintime=timeManger.getTiBegin();
                                            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm");
                                            String begintimestr=dateFormat.format(begintime);
                                            begintimestr=begintimestr.replace(" ","T");
                                            request.getSession().setAttribute("begintimestr",begintimestr);
                                        }

                                    %>
                                    <input type="datetime-local" min="1970-01-01" max="2099-12-31" value="${begintimestr}" name="tiBegin">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">结束时间</label>
                                <div class="col-sm-10">
                                    <%
                                        Object obj2=request.getSession().getAttribute("tpsTimeManger");
                                        if (obj!=null){
                                            TimeManger timeManger2=(TimeManger)obj;
                                            Date endtime=timeManger2.getTiEnd();
                                            SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd hh:mm");
                                            String endtimestr=dateFormat2.format(endtime);
                                            endtimestr=endtimestr.replace(" ","T");
                                            request.getSession().setAttribute("endtimestr",endtimestr);
                                        }

                                    %>
                                    <input type="datetime-local" min="1970-01-01" max="2099-12-31" value="${endtimestr}" name="tiEnd">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <button type="submit" class="btn btn-primary" >保存</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var pageNum,total;
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
    //刷新
    $("#topic_btn").click(function () {
        to_page(1);
    });
    //去第几页
    function to_page(pn){
        $.ajax({
        url:"${pageContext.request.contextPath}/time/select",
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
    function build_time_table(times){
        $("#time_table tbody").empty();
        for(var i=0;i<times.length;i++){
            var beginTime = timeStamp2String(times[i].tiBegin);
            var beginTd = $("<td></td>").append(times[i].tiBegin);
            var endTime = timeStamp2String(times[i].tiEnd);
            var endTd = $("<td></td>").append(times[i].tiEnd);
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
            .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
            .append("编辑");
            //为同意按钮添加一个自定义的属性来表示当前同意的课题选择id
            editBtn.attr("edit-id",times[i].id);
            var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
            .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
            .append("删除");
            //为删除按钮添加一个自定义的属性来表示当前拒绝的课题选择id
            delBtn.attr("del-id",times[i].id);
            var btnTd = $("<td></td>");
            btnTd.append(editBtn).append(delBtn);
            $("<tr></tr>").append(beginTd)
            .append(endTd)
            .append(btnTd)
            .appendTo("#time_table tbody");
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
    //清空表单样式及内容
    function reset_form(ele){
        $(ele)[0].reset();
        //清空表单样式
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }
</script>
</body>
</html>
