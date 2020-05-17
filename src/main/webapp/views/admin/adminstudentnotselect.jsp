<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>全部课题页面</title>
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
        })
    </script>


</head>
<body>

<header >
    <div class="header" style="text-align: center">
        <row>
            <h4>未选题学生信息</h4>
        </row>
    </div>
</header>
<div id="main_page" class="page-header">
    <!-- 搭建显示页面 -->
    <div class="container" style="width: 100%">
        <div class="modal-header">
            <h2>未选题学生信息</h2>
            <!-- 按钮 -->
            <div class="row">
                <div class="col-md-12">
                    <form action="${pageContext.request.contextPath}/adminFindAllStudentNOTSELECTByName" method="post" class="navbar-form navbar-left" role="search">
                        <input  type="text" value="${studentname}" name="name" class="form-control" placeholder="按学生姓名模糊查询">
                        <button type="submit" class="btn btn-info">查询</button>
                    </form>
                </div>
                <div class="col-md-7">
                    <form action="${pageContext.request.contextPath}/findOneStudentNOTSELECTBySno" method="post" class="navbar-form navbar-left" role="search">
                        <input  type="text" name="sno"  value="${studentsno}" class="form-control" autocomplete="on" placeholder="按学生学号查询">
                        <button type="submit" class="btn btn-info">查询</button>
                    </form>
                </div>
                <div class="col-md-4 col-md-offset-10">
                    <a id="seeall"  href="${request}/adminFindAllStudentNOTSELECTByName" methods="post" class="btn btn-primary">查看所有未选题学生</a>
                </div>
            </div>
        </div>
        <br>
        <c:choose>
            <c:when test="${studentList.list[0]!=null}">
                <!-- 显示表格数据 -->
                <div class="row" id="table_page">
                    <div class="col-md-12">
                        <table class="table table-hover" >
                            <thead style="color: red">
                            <tr>
                                <th>学生姓名</th>
                                <th>学号</th>
                                <th>班级</th>
                                <th>联系方式</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${studentList.list}" var="list">
                                <tr class="mytr">
                                    <td title="${list.name}">${list.name}</td>
                                    <td title="${list.sno}">${list.sno}</td>
                                    <td title="${list.classes}">${list.classes}</td>
                                    <td title="${list.tel}">${list.tel}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <%--分页信息--%>
                <div class="row">
                    <div class="col-md-6">
                        当前是第${studentList.pageNum }页,
                        共${studentList.pages }页,
                        共 ${studentList.total }条记录
                    </div>
                    <div class="col-md-6">
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <li><a href="${pageContext.request.contextPath}/adminFindAllStudentNOTSELECTByName?name=${studentname}&pn=1">首页</a></li>
                                <c:if test="${studentList.hasPreviousPage }">
                                    <li><a href="${pageContext.request.contextPath}/adminFindAllStudentNOTSELECTByName?name=${studentname}&pn=${studentList.pageNum-1}"
                                           aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                                    </a></li>
                                </c:if>

                                <c:forEach items="${studentList.navigatepageNums }" var="page_Num">
                                    <c:if test="${page_Num == studentList.pageNum }">
                                        <li class="active"><a href="#">${page_Num }</a></li>
                                    </c:if>
                                    <c:if test="${page_Num != studentList.pageNum }">
                                        <li><a href="${pageContext.request.contextPath}/adminFindAllStudentNOTSELECTByName?name=${studentname}&pn=${page_Num }">${page_Num }</a></li>
                                    </c:if>
                                </c:forEach>

                                <c:if test="${studentList.hasNextPage }">
                                    <li><a href="${pageContext.request.contextPath}/adminFindAllStudentNOTSELECTByName?name=${studentname}&pn=${studentList.pageNum+1 }"
                                           aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                                    </a></li>
                                </c:if>

                                <li><a href="${pageContext.request.contextPath}/adminFindAllStudentNOTSELECTByName?name=${studentname}&pn=${studentList.pages}">末页</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
               <span>暂无该数据</span>
            </c:otherwise>
        </c:choose>

    </div>
</div>

</body>
</html>
