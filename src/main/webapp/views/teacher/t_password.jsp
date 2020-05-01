<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人信息</title>
    <link href="${pageContext.request.contextPath}/static/mainstatic/css/index.css" rel="stylesheet" type="text/css"/>
    <script src="${pageContext.request.contextPath}/static/mainstatic/js/index.js"></script>
    <%--引入jquery--%>
    <script src="${pageContext.request.contextPath}/static/mainstatic/bootstrap/jquery/jquery-1.12.4.min.js"></script>
    <!-- 引入 Bootstrap样式-->
    <link href="${pageContext.request.contextPath}/static/mainstatic/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/static/mainstatic/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div>
    <form class="form-horizontal" action="${pageContext.request.contextPath}/teacher/updPwd" target="_top" method="post" style="width: 70%;margin: 1% 10%">
        <div class="form-group list-group-item" style="text-align: center">
            <c:if test="${!empty passworderror}">
                <font color="red"><c:out value="${passworderror}" /></font>
            </c:if>
        </div>
        <div>
            <input type="text" name="tno" value="${teacher.tno}" style="display: none">
        </div>
        <div class="form-group list-group-item">
            <label for="inputPassword" class="col-sm-2 control-label">旧密码：</label>
            <div class="col-sm-8">
                <input type="password" name="oldPassword" class="form-control" id="inputPassword">
            </div>
        </div>
        <div class="form-group list-group-item">
            <label for="inputNewPassword1" class="col-sm-2 control-label">请输入新密码：</label>
            <div class="col-sm-8">
                <input type="password" name="newPassword1" class="form-control" id="inputNewPassword1">
            </div>
        </div>
        <div class="form-group list-group-item">
            <label for="inputNewPassword2" class="col-sm-2 control-label">请再次输入新密码：</label>
            <div class="col-sm-8">
                <input type="password" name="newPassword2" class="form-control" id="inputNewPassword2">
            </div>
        </div>
        <div class="form-group list-group-item">
            <div class="row">
                <div class="col-md-offset-8">
                    <input id="revisePassword" type="submit" class="btn btn-primary" value="修改密码"/>
                </div>
            </div>
        </div>
    </form>
</div>
</body>
</html>
