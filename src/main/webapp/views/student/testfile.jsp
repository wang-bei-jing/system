
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>文件上传下载</title>
    <link href="${pageContext.request.contextPath}/static/mainstatic/css/index.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/static/mainstatic/js/index.js"></script>
    <%--引入jquery--%>
    <script src="${pageContext.request.contextPath}/static/mainstatic/bootstrap/jquery/jquery-1.12.4.min.js"></script>
    <!-- 引入 Bootstrap样式-->
    <link href="${pageContext.request.contextPath}/static/mainstatic/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/static/mainstatic/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    /*  function todown(dname){
            var ssno=${student.sno};

            if (tpsStatus=='0'||tpsStatus=='2'){
                $.ajax({
                    type:"post",
                    url:"/system/TopicSelectDel",
                    data:{"sSno":ssno,"tpId":tpId},
                    dateType:"json",
                    success:function(data){
                        if(data == "1"){
                            alert("退选成功！")
                            $("#tr_"+tpId).remove();
                            /!*$("#mytopic-information").reload();*!/
                            window.location.reload();
                            /!*location.href="${pageContext.request.contextPath}/myTopic?sSno=${student.sno}"*!/
                        }else {
                            alert("退选失败！请联系管理员！")
                        }
                    }
                });
            }else {
                alert("已被老师确认，无法取消!");
            }

        }*/
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
    <script type="text/javascript">
            /*弹出添加模块框*/
            $(document).ready(function() {
                $("#add_modal", this).click(function () {
                    $("#Add").modal({
                        backdrop: "static"
                    });
                })
            });
    </script>
</head>
<body >
<header >
    <div class="header" style="text-align: center">
        <row>
            <h4>我的实训报告</h4>
        </row>
    </div>
</header>
<div id="main_page" class="page-header">
    <!-- 搭建显示页面 -->
    <div class="container" style="width: 100%">

<div style="text-align: center;margin-top: 0%;margin-right: 1%;height:100%;">
    <div class="container page-header" style="border: 1px solid #DBDBDB;border-radius: 15px;width: auto;background: white;box-shadow: 2px 2px 2px #888888;">
        <c:choose>
            <c:when test="${student.status=='1'}">
        <div class="modal-header">
            <h2>我的实训报告</h2>
            <div class="modal-header">
                <!-- 按钮 -->
                <div class="row">
                    <div class="col-md-4 col-md-offset-8">
                        <%--   <a href="../selectUserProject.do?userId=${user.userid}" class="btn btn-primary">查看我的项目</a>--%>
                        <button class="btn btn-success" id="add_modal" >上传实训报告</button>
                    </div>
                </div>
            </div>
        </div>
                <!-- 显示表格数据 -->
                <div class="row" id="table_page" >
                    <div class="col-md-12">
                        <c:choose>
                            <c:when test="${testfiles[0]!=null}">
                                <table class="table table-hover" >
                                    <thead style="color: red">
                                    <tr>
                                        <th>文件</th>
                                        <th>备注</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${testfiles}" var="testfile">
                                        <tr class="mytr">
                                            <td>${testfile.documentname}</td>
                                            <td>${testfile.remark}</td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/downTestfile?documentname=${testfile.documentname}" >
                                                    <button class="btn btn-primary btn-sm edit_btn" id="down_btn" >
                                                        下载
                                                    </button>
                                                </a>
                                               <%-- <button class="btn btn-primary btn-sm edit_btn" id="edit_btn">
                                                    <span class="glyphicon glyphicon-pencil"></span>编辑
                                                </button>--%>
                                                <a href="${pageContext.request.contextPath}/deleteTestfile?documentname=${testfile.documentname}&dId=${testfile.dId}&sSno=${student.sno}" class="btn btn-danger btn-sm delete_btn">
                                                    <span class="glyphicon glyphicon-trash"></span>删除
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>

                            </c:when>
                            <c:otherwise>
                                <span><strong>您还没有上传实训报告！</strong></span>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <span style="color: red"><strong>您还没有被老师确认！请耐心等待</strong></span>
            </c:otherwise>
        </c:choose>


        <!-- 添加模态框 -->
        <div class="modal fade" id="Add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">上传实训报告</h4>
                    </div>
                    <div class="modal-body">
                        <form  action="${pageContext.request.contextPath}/uploadTestfile" method="post" class="form-horizontal" enctype="multipart/form-data">
                            <input type="text" name="tpsId" value="${mytopicSelect.id}" style="display: none">
                            <input type="text" name="sSno" value="${student.sno}" style="display: none">
                            <input type="text" name="category" value="2" style="display: none">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">附件</label>
                                <div class="col-sm-10">
                                    <input type="file" name="file" width="120px">

                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">备注</label>
                                <div class="col-sm-10">
                                 <%--   <input type="textarea" name="remark" class="form-control" style="height: 120px">--%>
                                    <textarea cols="62px" rows="5px" name="remark"></textarea>
                                </div>
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <button type="submit" class="btn btn-primary" >上传</button>
                            </div>
                        </form>
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