<%@ page import="java.util.Date" %>
<%@ page import="edu.zzti.bean.TimeManger" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    java.util.Date date = new java.util.Date();
    java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm");
    String currenttimestr = dateFormat.format(date);
    System.out.println(currenttimestr);
    java.util.Date currenttime = dateFormat.parse(currenttimestr);
    System.out.println(currenttime);

    Object obj=request.getSession().getAttribute("tpsTimeManger");
    System.out.println(obj);
    TimeManger timeManger=(TimeManger)obj;
    System.out.println(timeManger.toString());
    Date begintime=timeManger.getTiBegin();
    Date endtime=timeManger.getTiEnd();
   /*  String btimestr = dateFormat.format(btime);
    String etimestr = dateFormat.format(etime);
    java.util.Date begintime = dateFormat.parse(btimestr);
    java.util.Date endtime = dateFormat.parse(etimestr);*/
    System.out.println(begintime);
    System.out.println(endtime);
    if(currenttime.after(begintime)&&currenttime.before(endtime)){
%>

<html>
<head>
    <title>全部课题页面</title>
    <link href="${pageContext.request.contextPath}/static/mainstatic/css/index.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/static/mainstatic/js/index.js"></script>
    <%--引入jquery--%>
    <script src="${pageContext.request.contextPath}/static/mainstatic/bootstrap/jquery/jquery-1.12.4.min.js"></script>
    <!-- 引入 Bootstrap样式-->
    <link href="${pageContext.request.contextPath}/static/mainstatic/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/static/mainstatic/bootstrap/js/bootstrap.min.js"></script>
    <c:set var="request" value="${pageContext.request.contextPath}"></c:set>

    <script type="text/javascript">

        /*  $(function () {
              document.getElementById("seeall").trigger().click();
          })*/
        /*
                $(function(){
                    $('#seeall').trigger("click");
                })*/
        /* setTimeout(function() {
                  var e = document.createEvent("MouseEvents");
                  e.initEvent("click", true, true);
                  document.getElementById("seeall").dispatchEvent(e);
          }, 50);*/
    </script>
    <script type="text/javascript">
        function signup(num,tno,id){

            var sstatus=${student.status};
            var ssno=${student.sno};

            $.ajax({
                type:"post",
                url:"/system/TopicSelectExistBySSno",
                data:{"sSno":ssno,"tpId":id},
                dataType:"json",
                success:function(exist){
                    /* alert("exist进来了"+exist);*/
                    if (sstatus==0){
                        if (num>0){
                            /* alert("num进来了");*/
                            if (exist<3){
                                /*    alert("要提交了");*/
                                $.ajax({
                                    type:"post",
                                    url:"/system/TopicSelectExistBySSnoandtpid",
                                    data:{"sSno":ssno,"tpId":id},
                                    dataType:"json",
                                    success:function(data){
                                        /*  alert("我回来啦");*/
                                        if(data == "0"){
                                            /*alert("我回来啦2");*/
                                            $.ajax({
                                                type:"post",
                                                url:"/system/TopicSelectAdd",
                                                data:{"sSno":ssno,"tTno":tno,"tpId":id},
                                                dateType:"json",
                                                success:function (data) {
                                                    /* alert("我you回来啦");*/
                                                    if(data=="1"){
                                                        alert("报名成功，等待老师确认！")
                                                        $.ajax({
                                                            type:"post",
                                                            url:"/system/TopicSelectExist",
                                                            data:{"sSno":ssno,"tpId":id},
                                                            dataType:"json"
                                                        });
                                                    }
                                                }
                                            });

                                        }else {
                                            alert("您已报名该课题！")
                                        }
                                    }
                                });
                            } else {alert("您已报名3个课题！达到上限！");}

                        }else {
                            alert("该课题人数已满！请选择其他课题");
                        }
                    } else {
                        alert("已被老师确认，无法报名!");
                    };



                }
            });



        }


    </script>
    <script type="text/javascript">
        $(document).ready(function(){
            $("tbody>tr:odd").css("background-color","#e4e4e4");
            $("tbody>tr:even").css("background-color","white");
        })
    </script>

    <style>
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

<header >
    <div class="header" style="text-align: center">
        <row>
            <h4>全部课题</h4>
        </row>
    </div>
</header>
<div id="main_page" class="page-header">
    <!-- 搭建显示页面 -->
    <div class="container" style="width: 100%">
        <div class="modal-header">
            <h2>全部课题信息 <small>(Information  of all topics)</small></h2>
            <!-- 按钮 -->
            <div class="row">
                <div class="col-md-8">
                    <form action="${pageContext.request.contextPath}/TopicSelectByName" method="post" class="navbar-form navbar-left" role="search">
                        <input  type="text" name="name" class="form-control" placeholder="按课程名称查询">
                        <button type="submit" class="btn btn-info">查询</button>
                    </form>
                </div>
                <div class="col-md-4 col-md-offset-10">
                    <a id="seeall"  href="${request}/TopicSelectAll" methods="post" class="btn btn-primary">查看所有课程</a>
                </div>
            </div>
        </div>
        <br>
        <!-- 显示表格数据 -->
        <div class="row" id="table_page">
            <div class="col-md-12">
                <table class="table table-hover" >
                    <thead style="color: red">
                    <tr>
                        <th>操作</th>
                        <th>课题名</th>
                        <th>简介</th>
                        <th>教师姓名</th>
                        <th>类型</th>
                        <th>来源</th>
                        <th>难度</th>
                        <th>是否重点扶持项目</th>
                        <th>审题教研室</th>
                        <th>所需人数</th>
                        <th>职称</th>
                        <th>办公室</th>
                        <th>联系方式</th>
                        <th>电子邮箱</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${topicList.list}" var="list">
                        <tr class="mytr">
                            <td><a  href="javascript:void(0)" onclick="signup('${list.num}','${list.tno}','${list.id}')">报名</a></td>
                            <td>${list.name}</td>
                            <td>${list.contents}</td>
                            <td>${list.teacher.name}</td>
                            <td>${list.type}</td>
                            <td>${list.source}</td>
                            <td>${list.difficulty}</td>
                            <td>${list.support}</td>
                            <td>${list.department}</td>
                            <td>${list.num}</td>
                            <td>${list.teacher.title}</td>
                            <td>${list.teacher.office}</td>
                            <td>${list.teacher.tel}</td>
                            <td>${list.teacher.email}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <%--分页信息--%>
        <div class="row">
            <div class="col-md-6">
                当前是第${topicList.pageNum }页,
                共${topicList.pages }页,
                共 ${topicList.total }条记录
            </div>
            <div class="col-md-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li><a href="${pageContext.request.contextPath}/TopicSelectAll?pn=1">首页</a></li>
                        <c:if test="${topicList.hasPreviousPage }">
                            <li><a href="${pageContext.request.contextPath}/TopicSelectAll?pn=${topicList.pageNum-1}"
                                   aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                            </a></li>
                        </c:if>

                        <c:forEach items="${topicList.navigatepageNums }" var="page_Num">
                            <c:if test="${page_Num == topicList.pageNum }">
                                <li class="active"><a href="#">${page_Num }</a></li>
                            </c:if>
                            <c:if test="${page_Num != topicList.pageNum }">
                                <li><a href="${pageContext.request.contextPath}/TopicSelectAll?pn=${page_Num }">${page_Num }</a></li>
                            </c:if>
                        </c:forEach>

                        <c:if test="${topicList.hasNextPage }">
                            <li><a href="${pageContext.request.contextPath}/TopicSelectAll?pn=${topicList.pageNum+1 }"
                                   aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                            </a></li>
                        </c:if>

                        <li><a href="${pageContext.request.contextPath}/TopicSelectAll?pn=${topicList.pages}">末页</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>

</body>
</html>


<%
    }else {
%>

<html>
<head>
    <title>全部课题页面</title>
    <link href="${pageContext.request.contextPath}/static/mainstatic/css/index.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/static/mainstatic/js/index.js"></script>
    <%--引入jquery--%>
    <script src="${pageContext.request.contextPath}/static/mainstatic/bootstrap/jquery/jquery-1.12.4.min.js"></script>
    <!-- 引入 Bootstrap样式-->
    <link href="${pageContext.request.contextPath}/static/mainstatic/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/static/mainstatic/bootstrap/js/bootstrap.min.js"></script>
    <c:set var="request" value="${pageContext.request.contextPath}"></c:set>

    <script type="text/javascript">

        /*  $(function () {
              document.getElementById("seeall").trigger().click();
          })*/
        /*
                $(function(){
                    $('#seeall').trigger("click");
                })*/
        /* setTimeout(function() {
                  var e = document.createEvent("MouseEvents");
                  e.initEvent("click", true, true);
                  document.getElementById("seeall").dispatchEvent(e);
          }, 50);*/
    </script>
    <script type="text/javascript">
        function signup(num,tno,id){

            var sstatus=${student.status};
            var ssno=${student.sno};

            $.ajax({
                type:"post",
                url:"/system/TopicSelectExistBySSno",
                data:{"sSno":ssno,"tpId":id},
                dataType:"json",
                success:function(exist){
                    /* alert("exist进来了"+exist);*/
                    if (sstatus==0){
                        if (num>0){
                            /* alert("num进来了");*/
                            if (exist<3){
                                /*    alert("要提交了");*/
                                $.ajax({
                                    type:"post",
                                    url:"/system/TopicSelectExistBySSnoandtpid",
                                    data:{"sSno":ssno,"tpId":id},
                                    dataType:"json",
                                    success:function(data){
                                        /*  alert("我回来啦");*/
                                        if(data == "0"){
                                            /*alert("我回来啦2");*/
                                            $.ajax({
                                                type:"post",
                                                url:"/system/TopicSelectAdd",
                                                data:{"sSno":ssno,"tTno":tno,"tpId":id},
                                                dateType:"json",
                                                success:function (data) {
                                                    /* alert("我you回来啦");*/
                                                    if(data=="1"){
                                                        alert("报名成功，等待老师确认！")
                                                        $.ajax({
                                                            type:"post",
                                                            url:"/system/TopicSelectExist",
                                                            data:{"sSno":ssno,"tpId":id},
                                                            dataType:"json"
                                                        });
                                                    }
                                                }
                                            });

                                        }else {
                                            alert("您已报名该课题！")
                                        }
                                    }
                                });
                            } else {alert("您已报名3个课题！达到上限！");}

                        }else {
                            alert("该课题人数已满！请选择其他课题");
                        }
                    } else {
                        alert("已被老师确认，无法报名!");
                    };



                }
            });



        }


    </script>
    <script type="text/javascript">
        $(document).ready(function(){
            $("tbody>tr:odd").css("background-color","#e4e4e4");
            $("tbody>tr:even").css("background-color","white");
        })
    </script>

    <style>
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

<header >
    <div class="header" style="text-align: center">
        <row>
            <h4>全部课题</h4>
        </row>
    </div>
</header>
<div id="twomain_page" class="page-header">
    <!-- 搭建显示页面 -->
    <div class="container" style="width: 100%">
        <div class="modal-header">
            <h4 style="color: red">未在有效选课时间内！</h4>
            <!-- 按钮 -->
        </div>
        <br>

    </div>
</div>

</body>
</html>

<%
    }
%>