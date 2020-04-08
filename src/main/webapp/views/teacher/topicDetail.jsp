<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>个人信息</title>
    <script src="${pageContext.request.contextPath}/static/bootstrap/jquery/jquery-1.12.4.min.js"></script>
    <link href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/static/css/system.css" rel="stylesheet" type="text/css"/>
    <script src="${pageContext.request.contextPath}/static/js/index.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#revise", this).click(function () {
                alert("修改成功")
            });
        });
    </script>
</head>
<body>
<div>
    <header class="header">
        <div class="row">
            <div class="col-md-offset-10">
                <div class="navbar-header">
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/views/teacher/t_topic.jsp">
                        <span style="color: white">我的课题</span>
                    </a>
                </div>
            </div>
        </div>
    </header>
    <div class="person_page">
        <div class="person_main">
            <div class="person_Message" id="personMessage">
                <form class="form-horizontal" action="${pageContext.request.contextPath}/updTopic?id=${topic.id}&tno=${teacher.tno}"method="post" style="width: 70%;margin: 1% 10%">
                    <div class="form-group list-group-item">
                        <label for="inputId" class="col-sm-2 control-label">课题编号：</label>
                        <div class="col-sm-8">
                            <input type="text" name="id" value="${topic.id}" class="form-control" id="inputId" readonly="readonly">
                            <span style="color: red">*不允许修改</span>
                        </div>
                    </div>
                    <div class="form-group list-group-item">
                        <label for="inputCname" class="col-sm-2 control-label">中文名：</label>
                        <div class="col-sm-8">
                            <input type="text" name="cname" value="${topic.cname}" class="form-control" id="inputCname">
                        </div>
                    </div>
                    <div class="form-group list-group-item">
                        <label for="inputEname" class="col-sm-2 control-label">英文名：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ename" value="${topic.ename}" class="form-control" id="inputEname">
                        </div>
                    </div>
                    <div class="form-group list-group-item">
                        <label for="inputContents" class="col-sm-2 control-label">简介：</label>
                        <div class="col-sm-8">
                            <input type="text" name="contents" value="${topic.contents}" class="form-control" id="inputContents">
                        </div>
                    </div>
                    <div class="form-group list-group-item">
                        <label for="inputDegree" class="col-sm-2 control-label">是否双学位：</label>
                        <div class="col-sm-8">
                            <input type="text" name="degree" value="${topic.degree}" class="form-control" id="inputDegree">
                        </div>
                    </div>
                    <div class="form-group list-group-item">
                        <label for="inputType" class="col-sm-2 control-label">类型：</label>
                        <div class="col-sm-8">
                            <input type="text" name="type" value="${topic.type}" class="form-control" id="inputType">
                        </div>
                    </div>
                    <div class="form-group list-group-item">
                        <label for="inputSource" class="col-sm-2 control-label">来源：</label>
                        <div class="col-sm-8">
                            <input type="text" name="source" value="${topic.source}" class="form-control" id="inputSource">
                        </div>
                    </div>
                    <div class="form-group list-group-item">
                        <label for="inputNature" class="col-sm-2 control-label">性质：</label>
                        <div class="col-sm-8">
                            <input type="text" name="nature" value="${topic.nature}" class="form-control" id="inputNature">
                        </div>
                    </div>
                    <div class="form-group list-group-item">
                        <label for="inputDifficulty" class="col-sm-2 control-label">难度：</label>
                        <div class="col-sm-8">
                            <input type="text" name="difficulty" value="${topic.difficulty}" class="form-control" id="inputDifficulty">
                        </div>
                    </div>
                    <div class="form-group list-group-item">
                        <label for="inputSupport" class="col-sm-2 control-label">是否重点扶持项目：</label>
                        <div class="col-sm-8">
                            <input type="text" name="support" value="${topic.support}" class="form-control" id="inputSupport">
                        </div>
                    </div>
                    <div class="form-group list-group-item">
                        <label for="inputDepartment" class="col-sm-2 control-label">审题学院：</label>
                        <div class="col-sm-8">
                            <input type="text" name="department" value="${topic.department}" class="form-control" id="inputDepartment">
                        </div>
                    </div>
                    <div class="form-group list-group-item">
                        <div class="row">
                            <div class="col-md-offset-8">
                                <input type="submit" id="revise" class="btn btn-primary" value="确认修改"/>
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

