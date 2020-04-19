<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录界面</title>
    <link href="${pageContext.request.contextPath}/static/mainstatic/css/index.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/static/mainstatic/js/index.js"></script>
    <%--引入jquery--%>
    <script src="${pageContext.request.contextPath}/static/mainstatic/bootstrap/jquery/jquery-1.12.4.min.js"></script>
    <!-- 引入 Bootstrap样式-->
    <link href="${pageContext.request.contextPath}/static/mainstatic/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/static/mainstatic/bootstrap/js/bootstrap.min.js"></script>


    <script type="text/javascript">
        $(document).ready(function(){
            $("#Login2",this).click(function () {
                $("#manage").hide();
                $("#student").show();
            });
            $("#Login1",this).click(function () {
                $("#student").hide();
                $("#manage").show();
            });
        });
    </script>
    <style>
        body{

            background-image: url(${pageContext.request.contextPath}/static/mainstatic/img/bg_3.jpg);
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }
        .login_form {
            width: 30%;
            background: white;
            margin: 100px auto 0;
            padding: 1% 3%;
            border-radius: 15px;
        }

    </style>
</head>
<body class="login_page">
<div style="color:black">
    <h1 class="text-center">数据库软件综合实训管理系统</h1>
</div>
<div class="text-center">
    <a href="${pageContext.request.contextPath}/views/teacher/login.jsp">教师登录</a>
</div>
<div id="student" class="login_form">
    <div class="form-group" style="text-align: center">
        <c:if test="${!empty error}">
            <span style="color: red; "><c:out value="${error}" /></span>
        </c:if>
    </div>
    <div style="text-align: center">
        <h2>登录</h2>
    </div>
    <ul class="nav nav-tabs">
        <li role="presentation"  class="active"><a href="#">学生登录</a></li>
        <li role="presentation" id="Login1"><a href="#">管理员登录</a></li>
    </ul>
    <br>
    <form action="studentLogin" method="post">
        <div class="login-wrap" style="text-align: center">
            <div class="input-group">
                <span class="input-group-addon">账号</span>
                <input type="text" name="sno" class="form-control" placeholder="Loginname" autofocus>
            </div>
            <br>
            <div class="input-group">
                <span class="input-group-addon">密码</span>
                <input type="password" name="password" class="form-control" placeholder="Password">
            </div>
            <br>
            <button class="btn btn-primary btn-lg btn-block" type="submit">登录</button>
        </div>
    </form>
</div>
<div id="manage" class="login_form"  style="display: none">
    <div class="form-group" style="text-align: center">
        <c:if test="${!empty error}">
            <span style="color: red; "><c:out value="${error}" /></span>
        </c:if>
    </div>
    <div style="text-align: center">
        <h2>登录</h2>
    </div>
    <ul class="nav nav-tabs">
        <li role="presentation" id="Login2" ><a href="#">学生登录</a></li>
        <li role="presentation" class="active"><a href="#">管理员登录</a></li>
    </ul>
    <br>
    <form action="adminLogin" method="post">
        <div class="login-wrap" style="text-align: center">
            <div class="input-group">
                <span class="input-group-addon">账号</span>
                <input type="text" name="loginname" class="form-control" placeholder="Loginname" autofocus>
            </div>
            <br>
            <div class="input-group">
                <span class="input-group-addon">密码</span>
                <input type="password" name="password" class="form-control" placeholder="Password">
            </div>
            <br>
            <button class="btn btn-primary btn-lg btn-block" type="submit">登录</button>

        </div>
    </form>
</div>
</body>
</html>