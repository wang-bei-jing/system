<%@ page import="edu.zzti.bean.TimeManger" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
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
        /*弹出修改模块框*/
        $(document).ready(function() {
            $("#edit_btn", this).click(function () {
                $("#sno").val(onestudent.sno);
                $("#name").val(onestudent.name);
                $("#department").val(onestudent.department);
                $("#classes").val(onestudent.classes);
                $("#Update").modal({
                    backdrop: "static",
                });
            })
        });
       /* /!*删除确认*!/
        $(document).on("click",".delete_btn",function(){
            if(confirm("确认删除此项吗?")){
                return true;
            }else{
                return false;
            }
        });*/
        /* /!*导入*!/
         function dataimport(){
             var file=document.getElementById("myfile").files[0];
             alert("1231241241");
             alert(file);
             $.ajax({
                 type:"post",
                 url:"/system/importExcel",
                 data:file,
                 success:function (data) {
                     if(data=="1"){
                         window.location.reload();
                     }
                 }
             });
         };*/
        $(document).ready(function(){
            $("tbody>tr:odd").css("background-color","#e4e4e4");
            $("tbody>tr:even").css("background-color","white");
        });
    </script>

    <style>


        .table-hover > tbody > tr:hover > td {
            color: red;
            cursor: pointer;
        }
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
            text-align: center;
            vertical-align: middle;
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
                                                       <td>${list.teacherComment.tcContent}</td>
                                                   </c:otherwise>
                                               </c:choose>

                                           <td><fmt:formatDate value="${list.teacherComment.tcTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                               <%--<td>${tpsTimeManger.tiBegin}</td>
                                               <td>${tpsTimeManger.tiEnd}</td>--%>
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
               <!-- 修改模态框 -->
               <div class="modal fade" id="Update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                   <div class="modal-dialog" role="document">
                       <div class="modal-content">
                           <div class="modal-header">
                               <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                               <h4 class="modal-title" >修改时间信息</h4>
                           </div>
                           <div class="modal-body">
                               <form action="${pageContext.request.contextPath}/timeMangerUpd" method="post" class="form-horizontal">
                                   <input type="text" name="tiId" value="${tpsTimeManger.tiId}" style="display: none"/>
                                   <input type="text" name="tiCategory" value="2" style="display: none">
                                   <div class="form-group">
                                       <label class="col-sm-2 control-label">开始时间</label>
                                       <div class="col-sm-10">
                                           <%
                                               Object obj=request.getSession().getAttribute("tpsTimeManger");
                                               if (obj!=null){
                                                   TimeManger timeManger=(TimeManger)obj;
                                                   Date begintime=timeManger.getTiBegin();
                                                   SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm");
                                                   String begintimestr=dateFormat.format(begintime);
                                                   begintimestr=begintimestr.replace(" ","T");
                                                   request.getSession().setAttribute("begintimestr",begintimestr);
                                               }

                                           %>
                                           <input type="datetime-local" min="1970-01-01" max="2099-12-31" value="${begintimestr}" name="tiBegin">
                                       </div>
                                   </div>
                                   <div class="form-group">
                                       <label class="col-sm-2 control-label">结束时间</label>
                                       <div class="col-sm-10">
                                           <%
                                               Object obj2=request.getSession().getAttribute("tpsTimeManger");
                                               if (obj!=null){
                                                   TimeManger timeManger2=(TimeManger)obj;
                                                   Date endtime=timeManger2.getTiEnd();
                                                   SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd hh:mm");
                                                   String endtimestr=dateFormat2.format(endtime);
                                                   endtimestr=endtimestr.replace(" ","T");
                                                   request.getSession().setAttribute("endtimestr",endtimestr);
                                               }

                                           %>
                                           <input type="datetime-local" min="1970-01-01" max="2099-12-31" value="${endtimestr}" name="tiEnd">
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