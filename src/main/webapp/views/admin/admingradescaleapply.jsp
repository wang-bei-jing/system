<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>修改成绩比例页面</title>
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
        $(document).ready(function(){
            $("tbody>tr:odd").css("background-color","#e4e4e4");
            $("tbody>tr:even").css("background-color","white");
        });
        //点击同意，同意申请
        $(document).on("click","#agree_btn",function(){
            var department = $(this).parents("tr").find("td:eq(0)").text();
            var gsId = document.getElementById("agree_btn").value;
            var gsStatus=1;
            if(confirm("确定同意"+department+"专业申请的成绩比例吗？")){
                $.ajax({
                    type:"post",
                    url:"/system/adminGradeScaleChange",
                    data:{"gsId":gsId,"gsStatus":gsStatus},
                    dataType:"json",
                    success:function(data){
                        if(data !=0){
                            alert("同意成功！")
                            window.location.reload();
                            /*location.href="${pageContext.request.contextPath}/myTopic?sSno=${student.sno}"*/
                        }else {
                            alert("同意失败！")
                        }
                    }
                });
            }
        });
        //点击拒绝，拒绝申请
        $(document).on("click","#reject_btn",function(){
            var department = $(this).parents("tr").find("td:eq(0)").text();
            var gsId = document.getElementById("reject_btn").value;
            var gsStatus=2;
            if(confirm("确定驳回"+department+"专业申请的成绩比例吗？")){
                $.ajax({
                    type:"post",
                    url:"/system/adminGradeScaleChange",
                    data:{"gsId":gsId,"gsStatus":gsStatus},
                    dataType:"json",
                    success:function(data){
                        if(data !=0){
                            alert("驳回成功！")
                            window.location.reload();
                            /*location.href="${pageContext.request.contextPath}/myTopic?sSno=${student.sno}"*/
                        }else {
                            alert("驳回失败！")
                        }
                    }
                });
            }
        });
    </script>


</head>
<body>

<header >
    <div class="header" style="text-align: center">
        <row>
            <h4>修改成绩比例</h4>
        </row>
    </div>
</header>
<div id="main_page" class="page-header">
    <!-- 搭建显示页面 -->
    <div class="container" style="width: 100%">
        <div class="modal-header">
            <h2>修改成绩比例</h2>
        </div>
        <br>
        <!-- 显示表格数据 -->
        <div class="row" id="table_page">
            <div class="col-md-12">
                <table class="table table-hover" >
                    <thead style="color: red">
                    <tr>
                        <th>申请专业</th>
                        <th>平时成绩占比(%)</th>
                        <th>期中成绩占比(%)</th>
                        <th>验收成绩占比(%)</th>
                        <th>实训报告成绩占比(%)</th>
                        <th>申请时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${gradeScaleApplys}" var="list">
                            <tr class="mytr">
                            <td>${list.gsDepartment}</td>
                            <td>${list.gradeA}</td>
                            <td>${list.gradeB}</td>
                            <td>${list.gradeC}</td>
                            <td>${list.gradeD}</td>
                            <td><fmt:formatDate value="${list.gsTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>

                            <td>
                                <c:choose>
                                    <c:when test="${list.gsStatus==1}">
                                        <span style="color: green">已同意申请，正在使用该成绩比例</span>
                                    </c:when>
                                    <c:when test="${list.gsStatus==2}">
                                        <span style="color: red">已驳回申请</span>
                                    </c:when>
                                    <c:otherwise>
                                        <button class="btn btn-primary btn-sm edit_btn" id="agree_btn" value="${list.gsId}">
                                            <span class="glyphicon glyphicon-pencil"></span>同意
                                        </button>
                                        <button class="btn btn-danger btn-sm delete_btn" id="reject_btn" value="${list.gsId}">
                                            <span class="glyphicon glyphicon-trash"></span>驳回
                                        </button>
                                    </c:otherwise>
                                </c:choose>

                            </td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>

    </div>
</div>

</body>
</html>
