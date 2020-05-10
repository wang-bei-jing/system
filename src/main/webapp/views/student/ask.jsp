<%@ page import="edu.zzti.bean.TimeManger" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <link href="${pageContext.request.contextPath}/static/css/all.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/static/mainstatic/css/index.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/static/mainstatic/js/index.js"></script>
    <%--引入jquery--%>
    <script src="${pageContext.request.contextPath}/static/mainstatic/bootstrap/jquery/jquery-1.12.4.min.js"></script>
    <!-- 引入 Bootstrap样式-->
    <link href="${pageContext.request.contextPath}/static/mainstatic/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/static/mainstatic/bootstrap/js/bootstrap.min.js"></script>
    <c:set var="request" value="${pageContext.request.contextPath}"></c:set>


    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/mainstatic/bootstrap/css/bootstrap-theme.css">
    <script type="text/javascript">
        /*弹出添加模块框*/
        $(document).ready(function() {
            $("#add_modal", this).click(function () {

                $("#Add").modal({
                    backdrop: "static",
                });
            })
        });

        $(document).ready(function(){
            $("tbody>tr:odd").css("background-color","#e4e4e4");
            $("tbody>tr:even").css("background-color","white");
        });
    </script>

</head>
<body>

<header >
    <div class="header" style="text-align: center">
        <row>
            <h4>全部学生</h4>
        </row>
    </div>
</header>
<div id="main_page" class="page-header">
   <c:choose>
       <c:when test="${student.status==1}">
           <!-- 搭建显示页面 -->
           <div class="container" style="width: 100%">
               <div class="modal-header">
                   <h2>学生选题时间管理</h2>
                   <!-- 按钮 -->
                   <div class="row">
                       <div class="col-md-4 col-md-offset-10">
                           <button class="btn btn-success" id="add_modal" >提问</button>
                       </div>
                   </div>
               </div>
               <br>
               <!-- 显示表格数据 -->
               <div class="row" id="table_page">
                   <div class="col-md-12" >
                       <c:choose>
                           <c:when test="${studentCommentList[0]!=null}">

                                   <table class="table table-condensed table-striped  table-hover"  >
                                       <thead style="color: red">
                                       <tr>
                                           <th>提问内容</th>
                                           <th>提问时间</th>
                                           <th>教师答复</th>
                                           <th>答复时间</th>

                                       </tr>
                                       </thead>
                                       <tbody>
                                       <c:forEach items="${studentCommentList}" var="list">
                                       <tr class="mytr">
                                           <td>${list.scContent}</td>
                                           <td><fmt:formatDate value="${list.scTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>

                                               <c:choose>
                                                   <c:when test="${list.teacherComment.tcContent==null}">
                                                         <td style="color: red"> 教师暂未回复 </td>
                                                   </c:when>
                                                   <c:otherwise>
                                                       <td style="color: green">${list.teacherComment.tcContent}</td>
                                                   </c:otherwise>
                                               </c:choose>

                                           <td><fmt:formatDate value="${list.teacherComment.tcTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>

                                       </tr>
                                       </c:forEach>
                                       </tbody>
                                   </table>

                           </c:when>
                           <c:otherwise>
                               <span><strong>您未向老师提问</strong></span>
                           </c:otherwise>
                       </c:choose>
                   </div>
               </div>
               <!-- 添加模态框 -->
               <div class="modal fade" id="Add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                   <div class="modal-dialog" role="document">
                       <div class="modal-content">
                           <div class="modal-header">
                               <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                               <h4 class="modal-title" >提问</h4>
                           </div>
                           <div class="modal-body">
                               <form action="${pageContext.request.contextPath}/addComment" method="post" class="form-horizontal">
                                   <input type="text" name="scTpsId" value="${stutpsId}" style="display: none">
                                   <input type="text" name="sno" value="${student.sno}" style="display: none">
                                   <div class="form-group">
                                       <label class="col-sm-2 control-label">提问内容</label>
                                       <div class="col-sm-10">
                                           <textarea cols="62px" rows="5px" name="scContent"></textarea>
                                       </div>
                                   </div>


                                   <div class="modal-footer">
                                       <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                       <button type="submit" class="btn btn-primary" >保存</button>
                                   </div>
                               </form>
                           </div>
                       </div>
                   </div>
               </div>

           </div>
       </c:when>
       <c:otherwise>
           <span style="color: red"><strong>您还未被老师确认，无法向老师提问！</strong></span>
       </c:otherwise>
   </c:choose>

</div>

</body>
</html>
