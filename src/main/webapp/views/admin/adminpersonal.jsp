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
    <script type="text/javascript">
        function openPasswordRevise(){
            document.getElementById('passwordRevise').style.display='block';
        }
    </script>
    <style>
        .admin_page {
            position: relative;
            top: 50px;
            height: auto;
        }
        .admin_menu{
            width: 15%;
            float: left;
        }
        .admin_main{
            width: 85%;
            float: left;
            padding: 10px 50px;
        }
        .header{
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 3;
            color: white;
            font-size: 18px;
            height: 8%;
            background:#204d74;
        }
    </style>
</head>
<body>
    <div>
        <header class="header">
            <div class="header" style="text-align: center">
                <row>
                    <h4>修改个人信息</h4>
                </row>
            </div>
        </header>
        <div class="admin_page">
            <div class="admin_menu">
                <div class="list-group" style="padding: 10px;text-align: center">

                    <a href="#" onclick="openPasswordRevise()" class="list-group-item active">密码修改</a>
                </div>
            </div>
            <div class="admin_main">
                <div class="password_Revise" id="passwordRevise">
                    <form class="form-horizontal" action="${pageContext.request.contextPath}/adminPasswordRevise" method="post" style="width: 70%;margin: 1% 10%">
                        <div class="form-group list-group-item" style="text-align: center">
                            <c:if test="${!empty passworderror}">
                                <font color="red"><c:out value="${passworderror}" /></font>
                            </c:if>
                        </div>
                        <div>
                            <input type="text" name="loginname" value="${admin.loginname}" style="display: none">
                        </div>
                        <div class="form-group list-group-item">
                            <label for="inputPassword" class="col-sm-2 control-label">旧密码：</label>
                            <div class="col-sm-8">
                                <input type="password" name="oldPassword" class="form-control" id="inputPassword">
                            </div>
                        </div>
                        <div class="form-group list-group-item">
                            <label for="inputNewPassword" class="col-sm-2 control-label">新密码：</label>
                            <div class="col-sm-8">
                                <input type="password" name="newPassword" class="form-control" id="inputNewPassword">
                            </div>
                        </div>
                        <div class="form-group list-group-item">
                            <div class="row">
                                <div class="col-md-offset-8">
                                    <input id="revisePassword" type="submit" class="btn btn-primary" value="修改密码"/>
                                    <input type="reset" class="btn btn-primary" value="重置"/>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
