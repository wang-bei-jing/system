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
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/views/teacher/t_topic.jspopic.jsp">
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
                        <label for="inputCName" class="col-sm-2 control-label">课题中文名：</label>
                        <div class="col-sm-8">
                            <input type="text" name="cname" value="${topic.cname}" class="form-control" id="inputCName" readonly="readonly">
                        </div>
                    </div>
                    <div class="form-group list-group-item">
                        <label for="inputStatus" class="col-sm-2 control-label">审核</label>
                        <div class="col-sm-10">
                            <select id="inputStatus" name="status" class="form-control">
                                <option value="0">未审核</option>
                                <option value="1">通过</option>
                                <option value="2">未通过</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group list-group-item">
                        <div class="row">
                            <div class="col-md-offset-8">
                                <input type="submit" id="revise" class="btn btn-primary" value="确认"/>
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

