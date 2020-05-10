<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>我的实训课题</title>
    <link href="${pageContext.request.contextPath}/static/css/all.css" rel="stylesheet" type="text/css" />
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
   <%-- <script type="text/javascript">
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

    </script>--%>
    <script type="text/javascript">
        $(document).ready(function(){
            $("tbody>tr:odd").css("background-color","#e4e4e4");
            $("tbody>tr:even").css("background-color","white");
        })
    </script>


</head>
<body>
<header >

            <div class="header" style="text-align: center">
                <row>
                <h4>我的课题</h4>
                </row>
            </div>


</header>
<div id="main_page" class="page-header">
    <!-- 搭建显示页面 -->
    <div class="container" style="width: 100%">
        <div class="modal-header">
            <h2>我的实训课题 <small>(Information  of my topic)</small></h2>
        </div>
        <br>
        <!-- 显示表格数据 -->
        <div class="row" id="table_page">
            <div class="col-md-12">
            <c:choose>
                <c:when test="${just=='1'}">
                    <table class="table table-hover" style="text-align: center">
                        <thead style="color: red">
                        <tr>
                            <th>操作</th>
                            <th>课题名</th>
                            <th>简介</th>
                            <th>教师姓名</th>
                            <th>职称</th>
                            <th>办公室</th>
                            <th>联系方式</th>
                            <th>电子邮箱</th>
                            <th>平时成绩</th>
                            <th>期中检查成绩</th>
                            <th>验收成绩</th>
                            <th>报告成绩</th>
                            <th>总成绩</th>
                        </tr>
                        </thead>
                        <tbody id="mytopic-information">
                            <tr class="mytr">
                                <td>教师已确认</td>
                                <td>${mytopicSelect.topic.name}</td>
                                <td>${mytopicSelect.topic.contents}</td>
                                <td>${mytopicSelect.teacher.name}</td>
                                <td>${mytopicSelect.teacher.title}</td>
                                <td>${mytopicSelect.teacher.office}</td>
                                <td>${mytopicSelect.teacher.tel}</td>
                                <td>${mytopicSelect.teacher.email}</td>
                                <td>${grade.gPeacetime}</td>
                                <td>${grade.gMidterm}</td>
                                <td>${grade.gCheck}</td>
                                <td>${grade.gPresentation}</td>
                                <td>${grade.gTotal}</td>
                            </tr>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <span style="color: red"><strong>您还未被老师确认，请耐心等待！</strong></span>
                </c:otherwise>
            </c:choose>
            </div>
        </div>


    </div>
</div>
</body>
</html>
