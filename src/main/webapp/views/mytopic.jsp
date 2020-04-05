<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>我的课题</title>
    <link href="${pageContext.request.contextPath}/static/css/index.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/static/js/index.js"></script>
    <%--引入jquery--%>
    <script src="${pageContext.request.contextPath}/static/bootstrap/jquery/jquery-1.12.4.min.js"></script>
    <!-- 引入 Bootstrap样式-->
    <link href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
    <c:set var="request" value="${pageContext.request.contextPath}"></c:set>

    <script type="text/javascript">

      /*  $(function () {
            document.getElementById("seeall").trigger().click();
        })*/
        /*
                $(function(){
                    $('#seeall').trigger("click");
                })*/
     /* setTimeout(function() {
               var e = document.createEvent("MouseEvents");
               e.initEvent("click", true, true);
               document.getElementById("seeall").dispatchEvent(e);
       }, 50);*/
    </script>
    <script type="text/javascript">
       /* function signup(num,tno,id){

            var sstatus=${student.status};
            var ssno=${student.sno};

            if (sstatus==0){
                if (num>0){
                    $.ajax({
                        type:"post",
                        url:"/system/topicselectAdd",
                        data:{"sSno":ssno,"tTno":tno,"tpId":id},
                        dataType:"json",
                        success:function(data){
                            if(data == "1"){
                               alert("报名成功，等待老师确认！")
                            }
                        }

                    })
                }else {
                    alert("该课题人数已满！请选择其他课题");
                }
            } else {
                alert("已被老师确认，无法报名!");
            }


        }
*/

    </script>
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
            height: 11%;
            background:#204d74;
        }
    </style>
</head>
<body>
<header >

            <div class="header" style="text-align: center">
                <row>
                <a class="navbar-brand" href="${pageContext.request.contextPath}/views/student.jsp">
                    <span style="color: white;border-top:15px ;line-height:36px;font-size: 22px" >首页</span>
                </a>
                <h3>我的课题</h3>
                </row>
            </div>


</header>
<div id="main_page" class="page-header">
    <!-- 搭建显示页面 -->
    <div class="container" style="width: 100%">
        <div class="modal-header">
            <h1>我的课题信息 <small>(Information  of my topic)</small></h1>
            <!-- 按钮 -->
            <div class="row">
                <div class="col-md-4 col-md-offset-10">
                    <a id="seeall"  href="${request}/myTopic?sSno=${student.sno}" methods="post" class="btn btn-primary">查看所有已报名课程</a>
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
                        <th>操作</th>
                        <th>状态</th>
                        <th>课题名</th>
                        <th>英文名称</th>
                        <th>简介</th>
                        <th>是否双学位</th>
                        <th>教师姓名</th>
                        <th>类型</th>
                        <th>来源</th>
                        <th>性质</th>
                        <th>难度</th>
                        <th>是否重点扶持项目</th>
                        <th>审题教研室</th>
                        <th>所需人数</th>
                        <th>职称</th>
                        <th>办公室</th>
                        <th>联系方式</th>
                        <th>电子邮箱</th>

                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${topicsandteacherList.list}" var="list">
                        <tr class="mytr">
                            <td><a  href="javascript:void(0)" <%--onclick="signup('${student.sno}','${list.topic.id}')"--%>>退选</a></td>
                            <c:choose>
                                <c:when  test="${list.status=='0'}">
                                    <td>等待教师确认</td>
                                </c:when>
                                <c:otherwise>
                                    <td>教师已确认</td>
                                </c:otherwise>
                            </c:choose>
                            <td>${list.topic.cname}</td>
                            <td>${list.topic.ename}</td>
                            <td>${list.topic.contents}</td>
                            <td>${list.topic.degree}</td>
                            <td>${list.teacher.name}</td>
                            <td>${list.topic.type}</td>
                            <td>${list.topic.source}</td>
                            <td>${list.topic.nature}</td>
                            <td>${list.topic.difficulty}</td>
                            <td>${list.topic.support}</td>
                            <td>${list.topic.department}</td>
                            <td>${list.topic.num}</td>
                            <td>${list.teacher.title}</td>
                            <td>${list.teacher.office}</td>
                            <td>${list.teacher.tel}</td>
                            <td>${list.teacher.email}</td>

                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <%--分页信息--%>
        <div class="row">
            <div class="col-md-6">
                当前是第${topicsandteacherList.pageNum }页,
                共${topicsandteacherList.pages }页,
                共 ${topicsandteacherList.total }条记录
            </div>
            <div class="col-md-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li><a href="${pageContext.request.contextPath}/myTopic?pn=1&sSno=${student.sno}">首页</a></li>
                        <c:if test="${topicsandteacherList.hasPreviousPage }">
                            <li><a href="${pageContext.request.contextPath}/myTopic?pn=${topicsandteacherList.pageNum-1}&sSno=${student.sno}"
                                   aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                            </a></li>
                        </c:if>

                        <c:forEach items="${topicsandteacherList.navigatepageNums }" var="page_Num">
                            <c:if test="${page_Num == topicsandteacherList.pageNum }">
                                <li class="active"><a href="#">${page_Num }</a></li>
                            </c:if>
                            <c:if test="${page_Num != topicsandteacherList.pageNum }">
                                <li><a href="${pageContext.request.contextPath}/myTopic?pn=${page_Num }&sSno=${student.sno}">${page_Num }</a></li>
                            </c:if>
                        </c:forEach>

                        <c:if test="${topicsandteacherList.hasNextPage }">
                            <li><a href="${pageContext.request.contextPath}/myTopic?pn=${topicsandteacherList.pageNum+1 }&sSno=${student.sno}"
                                   aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                            </a></li>
                        </c:if>

                        <li><a href="${pageContext.request.contextPath}/myTopic?pn=${topicsandteacherList.pages}&sSno=${student.sno}">末页</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
</body>
</html>
