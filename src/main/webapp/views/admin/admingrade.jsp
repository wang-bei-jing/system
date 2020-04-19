<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>成绩查询页面</title>
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

    <style>
        table{
            border-collapse: collapse;
            border-spacing: 0;
            border: 1px solid #404060;
            width: 500px;
            font-size: 10px;
            font-family: "微软雅黑";


        }
        th {
            text-align: center;
            vertical-align: middle;
            border: 1px solid #404060;
            padding: 10px;
            background-color: rgba(0, 56, 78, 0.74);
            font: bold 15px "微软雅黑";
            color: #fff;
        }
        td{
            border: 1px solid #404060;
            padding: 10px;
        }
    </style>

   <style>
        .page-header{
            float: left;
            z-index: 0;
            height: 100%;
            width: 100%;
            border: 1px solid #DBDBDB;
            margin: 4.5% 2% 0% 1%;
            padding: 0% 0% 0% 0%;
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

<header >
    <div class="header" style="text-align: center">
        <row>
            <h4>学生成绩</h4>
        </row>
    </div>
</header>
<div id="main_page" class="page-header">
    <!-- 搭建显示页面 -->
    <div class="container" style="width: 100%">
        <div class="modal-header">
            <h2>学生成绩信息 <small>(Grade information  of all students )</small></h2>
            <!-- 按钮 -->
            <div class="row">
                <div class="col-xs-12" >
                    <form action="${pageContext.request.contextPath}/adminGradeFindBySno" method="post" class="navbar-form navbar-left" role="search">
                        <input  style="width: 245px;height: 35px" type="text" value="${admingradesno}" name="sno" class="form-control" placeholder="按学号查询">
                        <button type="submit" class="btn btn-info">
                            <span class="glyphicon glyphicon-search"></span>&nbsp;&nbsp;查询
                        </button>
                    </form>
                </div>
                <div class="col-xs-12" >
                    <form action="${pageContext.request.contextPath}/adminGradeFindByTeacherName" method="post" class="navbar-form navbar-left" role="search">
                        <input  style="width: 245px;height: 35px" type="text" value="${admingradeteachername}" name="tname" class="form-control" placeholder="根据教师姓名查询其学生们的成绩">
                        <button type="submit" class="btn btn-info">
                            <span class="glyphicon glyphicon-search"></span>&nbsp;&nbsp;查询
                        </button>
                    </form>
                </div>
                <div class="col-xs-5">
                    <span></span>
                </div>
                <div class="col-xs-2">
                    <span  class=" btn btn-primary" style="background: white;color: #0f6674">学生总成绩的分段统计 :</span>
                </div>
                <div class="col-xs-1">
                    <a href="${request}/adminGradeSelectAll?min=90&max=100" methods="post" class="btn btn-primary">100~90 分</a>
                </div>
                <div class="col-xs-1">
                    <a  href="${request}/adminGradeSelectAll?min=90&max=80" methods="post" class="btn btn-primary">90~80 分</a>
                </div>
                <div class="col-xs-1">
                    <a  href="${request}/adminGradeSelectAll?min=80&max=70" methods="post" class="btn btn-primary">80~70 分</a>
                </div>
                <div class="col-xs-1">
                    <a  href="${request}/adminGradeSelectAll?min=70&max=60" methods="post" class="btn btn-primary">70~60 分</a>
                </div>
                <div class="col-xs-1">
                    <a  href="${request}/adminGradeSelectAll?min=0&max=60" methods="post" class="btn btn-primary" style="background: #a71d2a;">
                      未及格
                    </a>
                </div>
            </div>
        </div>
        <br>
        <!-- 显示表格数据 -->
        <c:choose>
            <c:when test="${studentsGrades.list[0]!=null}">
                <div class="row" id="table_page">
                    <div class="col-md-12">
                        <table class="table table-hover" >
                            <thead style="color: red">
                            <tr>
                                <th>学生姓名</th>
                                <th>学号</th>
                                <th>班级</th>
                                <th>课题名</th>
                                <th>指导教师</th>
                                <th>平时成绩</th>
                                <th>期中成绩</th>
                                <th>验收成绩</th>
                                <th>报告成绩</th>
                                <th>总成绩</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${studentsGrades.list}" var="list">
                                <tr class="mytr">
                                    <td>${list.student.name}</td>
                                    <td>${list.student.sno}</td>
                                    <td>${list.student.classes}</td>
                                    <td>${list.topic.name}</td>
                                    <td>${list.teacher.name}</td>
                                    <td>${list.gPeacetime}</td>
                                    <td>${list.gMidterm}</td>
                                    <td>${list.gCheck}</td>
                                    <td>${list.gPresentation}</td>
                                    <td>${list.gTotal}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="col-md-5">
                </div>
                <div class="col-md-6">
                    <span style="color: red;text-align: center;"><strong>无查询结果！</strong></span>
                </div>

            </c:otherwise>
        </c:choose>

        <%--分页信息--%>
        <c:if test="${studentsGradesSize>=6}">
            <div class="row">
                <div class="col-md-6">
                    当前是第${studentsGrades.pageNum }页,
                    共${studentsGrades.pages }页,
                    共 ${studentsGrades.total }条记录
                </div>
                <div class="col-md-6">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <li><a href="${pageContext.request.contextPath}/adminGradeSelectAll?pn=1">首页</a></li>
                            <c:if test="${studentsGrades.hasPreviousPage }">
                                <li><a href="${pageContext.request.contextPath}/adminGradeSelectAll?pn=${studentsGrades.pageNum-1}"
                                       aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                                </a></li>
                            </c:if>

                            <c:forEach items="${studentsGrades.navigatepageNums }" var="page_Num">
                                <c:if test="${page_Num == studentsGrades.pageNum }">
                                    <li class="active"><a href="#">${page_Num }</a></li>
                                </c:if>
                                <c:if test="${page_Num != studentsGrades.pageNum }">
                                    <li><a href="${pageContext.request.contextPath}/adminGradeSelectAll?pn=${page_Num }">${page_Num }</a></li>
                                </c:if>
                            </c:forEach>

                            <c:if test="${studentsGrades.hasNextPage }">
                                <li><a href="${pageContext.request.contextPath}/adminGradeSelectAll?pn=${studentsGrades.pageNum+1 }"
                                       aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                                </a></li>
                            </c:if>

                            <li><a href="${pageContext.request.contextPath}/adminGradeSelectAll?pn=${studentsGrades.pages}">末页</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </c:if>

    </div>
</div>

</body>
</html>
