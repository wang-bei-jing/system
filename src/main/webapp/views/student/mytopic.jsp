<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>我的课题</title>
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
       function signup(tpId,tpsStatus){

            var ssno=${student.sno};


            if (tpsStatus=='0'||tpsStatus=='2'){
                $.ajax({
                    type:"post",
                    url:"/system/TopicSelectDel",
                    data:{"sSno":ssno,"tpId":tpId},
                    dateType:"json",
                    success:function(data){
                        if(data == "1"){
                            alert("退选成功！")
                           $("#tr_"+tpId).remove();
                            /*$("#mytopic-information").reload();*/
                            window.location.reload();
                         /*location.href="${pageContext.request.contextPath}/myTopic?sSno=${student.sno}"*/
                        }else {
                            alert("退选失败！请联系管理员！")
                        }
                    }
                });
            }else {
               alert("已被老师确认，无法取消!");
           }

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
            width: auto;
            font-size: 10px;
            font-family: "微软雅黑";


        }
        th{
            text-align: center;
            vertical-align: middle;
            border: 1px solid #404060;
            padding: 10px;
            width: auto;
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
                <h4>我的申报课题</h4>
                </row>
            </div>


</header>
<div id="main_page" class="page-header" style="width: 200%">
    <!-- 搭建显示页面 -->
    <div class="container" style="width: 100%">
        <div class="modal-header">
            <h2>我的申报课题 <small>(Information  of my selected topics)</small></h2>
          <%--  <!-- 按钮 -->
            <div class="row">
                <div class="col-md-4 col-md-offset-10">
                    <a id="seeall"  href="${request}/myTopic?sSno=${student.sno}" methods="post" class="btn btn-primary">查看所有已报名课程</a>
                </div>
            </div>--%>
        </div>
        <br>
        <!-- 显示表格数据 -->
        <div class="row" id="table_page">
            <div class="col-md-12">
                <c:choose>
                    <c:when test="${topicsandteacherList!=null}">
                    <table class="table table-hover" >
                        <thead style="color: red">
                        <tr>
                            <th>操作</th>
                            <th>状态</th>
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
                        <tbody id="mytopic-information">
                        <c:forEach items="${topicsandteacherList}" var="list">
                            <tr class="mytr">
                                <td id="td_${list.tpId}"><a  href="javascript:void(0)"  onclick="signup('${list.tpId}','${list.status}')">退选</a></td>
                                <c:choose>
                                    <c:when  test="${list.status=='0'}">
                                        <td>等待教师确认</td>
                                    </c:when>
                                    <c:when  test="${list.status=='1'}">
                                        <td>教师已确认</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td>教师驳回申请!</td>
                                    </c:otherwise>
                                </c:choose>
                                <td>${list.topic.name}</td>
                                <td>${list.topic.contents}</td>
                                <td>${list.teacher.name}</td>
                                <td>${list.topic.type}</td>
                                <td>${list.topic.source}</td>
                                <td>${list.topic.difficulty}</td>
                                <td>${list.topic.support}</td>
                                <td>${list.topic.department}</td>
                                <td>${list.topic.num}</td>
                                <td>${list.teacher.title}</td>
                                <td>${list.teacher.office}</td>
                                <td>${list.teacher.tel}</td>
                                <td>${list.teacher.email}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    </c:when>
                    <c:otherwise>
                        <span style="color: red"><strong>您还没有申报题目！</strong></span>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

    </div>
</div>
</body>
</html>
