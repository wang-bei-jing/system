<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册</title>
    <link href="${pageContext.request.contextPath}/static/mainstatic/css/index.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/static/mainstatic/js/index.js"></script>
    <%--引入jquery--%>
    <script src="${pageContext.request.contextPath}/static/mainstatic/bootstrap/jquery/jquery-1.12.4.min.js"></script>
    <!-- 引入 Bootstrap样式-->
    <link href="${pageContext.request.contextPath}/static/mainstatic/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/static/mainstatic/bootstrap/js/bootstrap.min.js"></script>
    <script>
        function addCheck(){
            var username=document.getElementById("username").value;
            var password=document.getElementById("password").value;
            var newword=document.getElementById("newword").value;
            if(username==""){
                alert("用户名不能为空!");
                document.getElementById("username").focus();
                return false;
            }
            if(password==""){
                alert("密码不能为空!");
                document.getElementById("password").focus();
                return false;
            }
            if(password != newword){
                alert("两次输入密码不相同!");
                document.getElementById("newword").focus();
                return false;
            }
        }
        function validate(){
            var flag = addCheck();
            if(flag == false)
                return false;
            return true;
        }
    </script>
<body class="register_bg">
<div style="margin-top: 8%;height: 100%">
    <div class="container" style="background:white;width:60%;border: 1px solid #DBDBDB;border-radius: 15px">
        <div class="text-center">
            <h1>用户注册</h1>
        </div>
        <div class="row clearfix">
            <div class="col-md-12 column">
                <form action="../registering.do" method="post" class="form-horizontal" role="form">
                    <div class="form-group" style="text-align: center">
                        <c:if test="${!empty error}">
                            <font color="red"><c:out value="${error}" /></font>
                        </c:if>
                    </div>
                    <div class="form-group">
                        <label for="input0" class="col-sm-2 control-label">身份</label>
                        <div class="col-sm-10">
                            <select id="input0" name="identity" class="form-control">
                                <option value="0">学生</option>
                                <option value="1">教师</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input1" class="col-sm-2 control-label">账号</label>
                        <div class="col-sm-10">
                            <input type="text" id="input1" name="userid" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input2" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input class="form-control" name="password" id="input2" type="password" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input3" class="col-sm-2 control-label">重复密码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="input3" name="newPassword" placeholder="重新输入密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input4" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="input4" name="username" placeholder="姓名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input5" class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <select id="input5" name="sex" class="form-control">
                                <option>男</option>
                                <option>女</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input7" class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-10">
                            <select id="input7" class="form-control" name="department">
                                <option>计算机学院</option>
                                <option>机电学院</option>
                                <option>马克思学院</option>
                                <option>服装学院</option>
                                <option>新闻媒体学院</option>
                                <option>外国语学院</option>
                                <option>彼得堡学院</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-8 col-sm-8">
                            <button type="submit" class="btn btn-success">注册</button>
                            <button type="reset" class="btn btn-primary">重置</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
