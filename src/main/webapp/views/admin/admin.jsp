
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理首页</title>
    <link href="${pageContext.request.contextPath}/static/mainstatic/css/index.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/static/mainstatic/js/index.js"></script>
    <%--引入jquery--%>
    <script src="${pageContext.request.contextPath}/static/mainstatic/bootstrap/jquery/jquery-1.12.4.min.js"></script>
    <!-- 引入 Bootstrap样式-->
    <link href="${pageContext.request.contextPath}/static/mainstatic/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/static/mainstatic/bootstrap/js/bootstrap.min.js"></script>
    <style>
        .user_header{
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 3;
            color: white;
            font-size: 18px;
            height: 8%;
            background:#2b669a;
        }
    </style>
</head>
<body>
<header class="user_header">
    <row>
        <div class="col-md-2" style="background: #2b669a;height: 100%" ></div>
        <div class="col-md-2">
            <div class="navbar-header">
                <li class="nav">
                    <a href="#teachSetting" data-toggle="collapse">
                        <div class="navbar-brand" style="background: #2b669a;color: white;height: 100%">
                            &nbsp;&nbsp;<i class="glyphicon glyphicon-pencil">&nbsp;</i>
                            <span>实训管理</span>
                            <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                        </div>
                    </a>
                </li>
                <ul id="teachSetting" class="nav nav-list collapse secondmenu" style="background: #DBDBDB;border-radius: 15px">
                    <li><a href="${pageContext.request.contextPath}/jsp/mycourse.jsp"><i class="glyphicon glyphicon-th-list">&nbsp;</i>课题管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/jsp/mytextbook.jsp" ><i class="glyphicon glyphicon-book">&nbsp;</i>学生管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/jsp/myreward.jsp"><i class="glyphicon glyphicon-edit">&nbsp;</i>教师管理</a></li>
                </ul>
            </div>
        </div>


        <div class="col-md-offset-10">
            <div class="navbar-header">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/views/admin/adminpersonal.jsp">
                    <span style="color: white">个人主页</span>
                </a>
            </div>
        </div>
    </row>

    <div class="menu-left"style="width: 15%;position:fixed;top:9%;border-bottom-right-radius: 15px; box-shadow: 2px 2px 2px #888888;">
        <ul class="list-group"style="color:#122b40">
            <li class="list-group-item text-center" style="color: white;background:#555">当前登录信息</li>
            <li class="list-group-item">账号：${admin.name}</li>

        </ul>
    </div>
</header>
<div style="text-align: center;margin-top: 4%;margin-left: 8%">
    <div class="container page-header" style="border: 2px solid #DBDBDB;border-radius: 15px;height:90%;width: 84%;background: white;box-shadow: 2px 2px 2px #888888;">
     <div class="row clearfix">
            <div class="col-md-12 column" >

                <div class="row">
                    <div class="col-xs-6 col-md-3">
                        <div class="thumbnail">
                            <a href="${pageContext.request.contextPath}/jsp/mycourse.jsp" class="thumbnail">
                                <img src="${pageContext.request.contextPath}/static/img/bg_6.jpg">
                            </a>
                            <div>
                                <h3>课题管理</h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6 col-md-3">
                        <div class="thumbnail">
                            <a href="${pageContext.request.contextPath}/jsp/mytextbook.jsp" class="thumbnail">
                                <img src="${pageContext.request.contextPath}/static/img/bg_4.jpg" >
                            </a>
                            <div >
                                <h3>学生管理</h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6 col-md-3">
                        <div class="thumbnail">
                            <a href="${pageContext.request.contextPath}/jsp/mythesis.jsp" class="thumbnail">
                                <img src="${pageContext.request.contextPath}/static/img/bg_5.jpg">
                            </a>
                            <div>
                                <h3>教师管理</h3>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
