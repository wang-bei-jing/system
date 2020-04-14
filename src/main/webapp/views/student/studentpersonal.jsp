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
        function openStudentInfo(){
            document.getElementById('studentInfo').style.display='block';
            document.getElementById('passwordRevise').style.display='none';
        }
        function openPasswordRevise(){
            document.getElementById('studentInfo').style.display='none';
            document.getElementById('passwordRevise').style.display='block';
        }
        $(document).ready(function() {
            $("#reviseInfo", this).click(function () {
                alert("修改成功")
            });
            $("#revisePassword", this).click(function () {
                alert("密码重置成功")
            });
        });
    </script>
    <style>
        .student_page {
            position: relative;
            top: 50px;
            height: auto;
        }
        .student_menu{
            width: 15%;
            float: left;
        }
        .student_main{
            width: 85%;
            float: left;
            padding: 10px 50px;
        }
        .password_Revise{
            display: none;
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
    <div>
        <header >
            <div class="header" style="text-align: center">
                <row>
                    <h4>修改个人信息</h4>
                </row>
            </div>
        </header>
        <div class="student_page">
            <div class="student_menu">
                <div class="list-group" style="padding: 10px;text-align: center">
                    <a href="#"onclick="openStudentInfo()" class="list-group-item active">基本信息</a>
                    <a href="#" onclick="openPasswordRevise()" class="list-group-item">密码修改</a>
                </div>
            </div>
            <div class="student_main">
                <div class="student_Info" id="studentInfo">
                    <form class="form-horizontal" action="${pageContext.request.contextPath}/studentInfoRevise" method="post" style="width: 70%;margin: 1% 10%">
                        <div class="form-group list-group-item">
                            <label for="inputUserSno" class="col-sm-2 control-label">账号：</label>
                            <div class="col-sm-8">
                                <input type="text" name="sno" value="${student.sno}" class="form-control" id="inputUserSno" readonly="readonly">
                                <span style="color: red">*不允许修改</span>
                            </div>
                        </div>
                        <div class="form-group list-group-item">
                            <label for="inputName" class="col-sm-2 control-label">姓名：</label>
                            <div class="col-sm-8">
                                <input type="text" name="name" value="${student.name}" class="form-control" id="inputName">
                            </div>
                        </div>
                        <div class="form-group list-group-item">
                            <label for="inputSex" class="col-sm-2 control-label">性别：</label>
                            <div class="col-sm-8">
                                <input type="text" name="sex" value="${student.sex}" class="form-control" id="inputSex">
                            </div>
                        </div>
                        <div class="form-group list-group-item">
                            <label for="inputDepartment" class="col-sm-2 control-label">专业：</label>
                            <div class="col-sm-8">
                                <input type="text" name="department" value="${student.department}" class="form-control" id="inputDepartment" readonly>
                                <span style="color: red">*不允许修改</span>
                            </div>
                        </div>
                        <div class="form-group list-group-item">
                            <label for="inputClasses" class="col-sm-2 control-label">班级：</label>
                            <div class="col-sm-8">
                                <input type="text" name="classes" value="${student.classes}" class="form-control" id="inputClasses" readonly>
                                <span style="color: red">*不允许修改</span>
                            </div>
                        </div>
                        <div class="form-group list-group-item">
                            <label for="inputTel" class="col-sm-2 control-label">联系方式：</label>
                            <div class="col-sm-8">
                                <input type="text" name="tel" value="${student.tel}" class="form-control" id="inputTel">
                            </div>
                        </div>
                        <div class="form-group list-group-item">
                            <label for="inputEmail" class="col-sm-2 control-label">电子邮箱：</label>
                            <div class="col-sm-8">
                                <input type="text" name="email" value="${student.email}" class="form-control" id="inputEmail">
                            </div>
                        </div>
                        <div class="form-group list-group-item">
                            <div class="row">
                                <div class="col-md-offset-8">
                                    <input type="submit" id="reviseInfo" class="btn btn-primary" value="确认修改"/>
                                    <input type="reset" class="btn btn-primary" value="重置"/>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="password_Revise" id="passwordRevise">
                    <form class="form-horizontal" action="${pageContext.request.contextPath}/studentPasswordRevise" method="post" style="width: 70%;margin: 1% 10%">
                        <div class="form-group list-group-item" style="text-align: center">
                            <c:if test="${!empty passworderror}">
                                <font color="red"><c:out value="${passworderror}" /></font>
                            </c:if>
                        </div>
                        <div>
                            <input type="text" name="sno" value="${student.sno}" style="display: none">
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
