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
        /*弹出修改模块框*/
        $(document).ready(function() {
            $("#edit_btn", this).click(function () {
                $("#Update").modal({

                    backdrop: "static",
                });
            })
        });
        /*删除确认*/
        $(document).on("click",".delete_btn",function(){
            if(confirm("确认删除此项吗?")){
                return true;
            }else{
                return false;
            }
        });
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


</head>
<body>

<header >
    <div class="header" style="text-align: center">
        <row>
            <h4>学生选题时间管理</h4>
        </row>
    </div>
</header>
<div id="main_page" class="page-header">
    <!-- 搭建显示页面 -->
    <div class="container" style="width: 100%">
        <div class="modal-header">
            <h2>学生选题时间管理</h2>
            <!-- 按钮 -->
            <div class="row">
                <div class="col-md-4 col-md-offset-10">
                    <c:if test="${tpsTimeManger==null}">
                        <button class="btn btn-success" id="add_modal" >添加时间范围</button>
                    </c:if>

                </div>
            </div>
        </div>
        <br>
        <!-- 显示表格数据 -->
        <div class="row" id="table_page">
            <div class="col-md-12" >
                <c:choose>
                    <c:when test="${tpsTimeManger!=null}">
                        <table class="table table-condensed table-striped  table-hover" style="text-align: center" >
                            <thead style="color: red">
                            <tr>
                                <th>起始时间</th>
                                <th>结束时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="mytr">
                                <td><fmt:formatDate value="${tpsTimeManger.tiBegin}" pattern="yyyy-MM-dd HH:mm" /></td>
                                <td><fmt:formatDate value="${tpsTimeManger.tiEnd}" pattern="yyyy-MM-dd HH:mm" /></td>
                                <c:choose>
                                    <c:when test="${nowdate>tpsTimeManger.tiBegin and nowdate<tpsTimeManger.tiEnd}">
                                        <td style="color: red">实训在进行中，无法更改时间</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td>
                                        <button class="btn btn-primary btn-sm edit_btn" id="edit_btn" onclick="edit('${tpsTimeManger.tiId}')" >
                                            <span class="glyphicon glyphicon-pencil"></span>编辑
                                        </button>
                                        <a id="delete_btn" href="${pageContext.request.contextPath}/timeMangerDel?tiId=${tpsTimeManger.tiId}" class="btn btn-danger btn-sm delete_btn">
                                            <span class="glyphicon glyphicon-trash"></span>删除
                                        </a>
                                        </td>
                                    </c:otherwise>
                                </c:choose>

                            </tr>
                            </tbody>
                        </table>

                    </c:when>
                    <c:otherwise>
                        <span style="color: red"><strong>暂无选题时间管理信息,请先添加！</strong></span>
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
                        <h4 class="modal-title" >添加时间限制</h4>
                    </div>
                    <div class="modal-body">
                        <form action="${pageContext.request.contextPath}/timeMangerAdd" method="post" class="form-horizontal">
                            <input type="text" name="tiCategory" value="2" style="display: none">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">开始时间</label>
                                <div class="col-sm-10">
                                    <input type="datetime-local" min="1970-01-01 00:00" max="2099-12-31 00:00" value="2020-06-01T08:00" name="tiBegin">

                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">结束时间</label>
                                <div class="col-sm-10">
                                    <input type="datetime-local" min="1970-01-01 00:00" max="2099-12-31 00:00 " value="2020-06-03T00:00" name="tiEnd">
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
                                  <%--  <%
                                        Object obj=request.getSession().getAttribute("tpsTimeManger");
                                        if (obj!=null){
                                            TimeManger timeManger=(TimeManger)obj;
                                            Date begintime=timeManger.getTiBegin();
                                            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm");
                                            String begintimestr=dateFormat.format(begintime);
                                            begintimestr=begintimestr.replace(" ","T");
                                            request.getSession().setAttribute("begintimestr",begintimestr);
                                        }
                                    %>--%>
                                    <input type="datetime-local" min="1970-01-01" max="2099-12-31" value="${begintimestr}" name="tiBegin">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">结束时间</label>
                                <div class="col-sm-10">

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
</div>

</body>
</html>
