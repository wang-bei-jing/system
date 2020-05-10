<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>用户界面</title>
    <script src="${pageContext.request.contextPath}/static/bootstrap/jquery/jquery-1.12.4.min.js"></script>
    <link href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/static/css/system.css" rel="stylesheet" type="text/css"/>
    <script src="${pageContext.request.contextPath}/static/js/all.js"></script>
    <script type="text/javascript">
        /*弹出添加模块框*/
        $(document).ready(function() {
            $("#add_modal", this).click(function () {
                $("#Add").modal({
                    backdrop: "static"
                });
            })
        });
        /*弹出修改模块框*/
        $(document).on("click",".edit_btn",function(){
            var id = $(this).parents("tr").find("td:eq(0)").text();
            /*getEmp($(this).attr("edit_id"));*/
            $("#Update").modal({
                backdrop: "static"
            });
        });
        $(document).on("click",".delete_btn",function(){
            var name = $(this).parents("tr").find("td:eq(1)").text();
            if(confirm("确认删除【"+name+"】吗?")){
                return true;
            }else{
                return false;
            }
        });
    </script>
</head>
<body class="user_bg">
<header class="first_header">
    <row>
        <div class="col-md-2" style="background: #2b669a;height: 100%" >
            <div class="navbar-header">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/views/teacher/t_first.jsp">
                    <span style="color: white">首页</span>
                </a>
            </div>
        </div>
        <div class="col-md-2">
            <div class="navbar-header">
                <li class="nav">
                    <a href="#teachSetting" data-toggle="collapse">
                        <div class="navbar-brand" style="background: #2b669a;color: white;height: 100%">
                            <span>教学管理</span>&nbsp;
                            <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                        </div>
                    </a>
                </li>
                <ul id="teachSetting" class="nav nav-list collapse secondmenu" style="background: #DBDBDB;border-radius: 15px">
                    <li><a href="${pageContext.request.contextPath}/selectGroupByTno?tno=${teacher.tno}"><i class="glyphicon glyphicon-th-list">&nbsp;</i>全部分组</a></li>
                    <li><a href="${pageContext.request.contextPath}/selectTopicByTno?tno=${teacher.tno}"><i class="glyphicon glyphicon-book">&nbsp;</i>我的课题</a></li>
                    <li><a href="${pageContext.request.contextPath}/views/teacher/t_comment.jsp"><i class="glyphicon glyphicon-edit">&nbsp;</i>我的消息</a></li>
                </ul>
            </div>
        </div>
        <div class="col-md-offset-10">
            <div class="navbar-header">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/views/teacher/t_person.jsprson.jsp">
                    <span style="color: white">个人主页</span>
                </a>
            </div>
        </div>
    </row>
</header>
<div style="text-align: center;margin-top: 1.5%;margin-right: 1%">
    <div class="container page-header" style="border: 1px solid #DBDBDB;border-radius: 15px;width: 84%;background: white;box-shadow: 2px 2px 2px #888888;">
        <div class="modal-header">
            <h1>我的分组</h1>
            <!-- 按钮 -->
            <div class="row">
                <div class="col-md-2 col-md-offset-10">
                    <a href="${pageContext.request.contextPath}/selectGroupByTno?tno=${teacher.tno}" class="btn btn-primary">刷新</a>
                </div>
            </div>
        </div>
        <br>
        <!-- 显示表格数据 -->
        <div class="row" id="table_page">
            <div class="col-md-12">
                <table class="table table-hover" >
                    <thead style="color: red">
                    <tr>
                        <th>组名</th>
                        <th>组长</th>
                        <th>组员</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${teacherGroupList}" var="teacherGroup">
                        <tr class="mytr">
                            <td>${teacherGroup.groupName}</td>
                            <td>${teacherGroup.leaderName}</td>
                            <td>${teacherGroup.memberName}</td>
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
