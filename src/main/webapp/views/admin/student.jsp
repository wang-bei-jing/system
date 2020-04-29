<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>全部教师</title>
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
        function edit(sno){
            $.ajax({
                type:"post",
                url:"/system/studentSelectBySno",
                data:{"sno":sno,},
                dataType:"json",
                success:function (onestudent) {
                    $("#sno").val(onestudent.sno);
                    $("#name").val(onestudent.name);
                    $("#department").val(onestudent.department);
                    $("#classes").val(onestudent.classes);
                    $("#password").val(onestudent.password);

                    $("#Update").modal({
                        backdrop: "static",
                    });
                }
            });
        }
        /*删除确认*/
        $(document).on("click",".delete_btn",function(){
            var teaname = $(this).parents("tr").find("td:eq(2)").text();
            if(confirm("确认删除【"+teaname+"】吗?")){
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

        function loadFile(file){
            $("#filename").html(file.name);
        };
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
    <!-- 搭建显示页面 -->
    <div class="container" style="width: 100%">
        <div class="modal-header">
            <h2>全部学生 <small>(Information  of all students)</small></h2>
            <!-- 按钮 -->
            <div class="row">
                <div class="col-md-6">
                    <form action="${pageContext.request.contextPath}/studentSelectByName" method="post" class="navbar-form navbar-left" role="search">
                        <input  type="text" name="name" value="${studentname}" class="form-control" autocomplete="on" placeholder="按学生姓名查询">
                        <button type="submit" class="btn btn-info">查询</button>
                    </form>
                </div>
                <div class="form-group col-md-6">
                    <span  class=" btn btn-primary" style="background: white;color: #0f6674">批量导入学生 :</span>
                </div>
                <div>
                    <form action="${pageContext.request.contextPath}/importStudents" method="post" class="form-horizontal" enctype="multipart/form-data">
                            <div class="col-md-7"></div>
                            <div class="col-md-1" style="display:inline-block;position:relative;overflow: hidden;vertical-align:middle">
                                <button id="" class="btn btn-success fileinput-button" width="120px" type="button">选择excel</button>
                                <input type="file" id="myfile" name="file" onchange="loadFile(this.files[0])" width="120px" style="position:absolute;top:0;left:0;font-size:34px; opacity:0">
                            </div>
                            <div class="col-md-3">
                                <span id="filename" style="vertical-align: middle"></span>
                                &nbsp;
                                <button type="submit" class="btn btn-primary" >导入数据</button>
                            </div>
                    </form>
                </div>



                <div class="col-md-4 col-md-offset-10">
                    <a id="seeall"  href="${request}/studentSelectAll" methods="post" class="btn btn-primary">查看所有学生</a>
                    <button class="btn btn-success" id="add_modal" >添加学生</button>
                </div>

            </div>
        </div>
        <br>
        <!-- 显示表格数据 -->
        <div class="row" id="table_page">
            <div class="col-md-12">
            <c:choose>
                <c:when test="${studentList.list[0]!=null}">
                    <table class="table table-condensed table-striped  table-hover">
                    <thead style="color: red">
                    <tr>
                        <th>操作</th>
                        <th>学号</th>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>专业</th>
                        <th>班级</th>
                        <th>联系方式</th>
                        <th>电子邮箱</th>
                        <th>密码</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${studentList.list}" var="list">
                        <tr class="mytr">
                            <td>
                              <%--  <a  href="javascript:void(0)" onclick="signup('${list.num}','${list.tno}','${list.id}')">报名</a>--%>
                                <button class="btn btn-primary btn-sm edit_btn" id="edit_btn" onclick="edit('${list.sno}')" >
                                    <span class="glyphicon glyphicon-pencil"></span>编辑
                                </button>
                                <a <%--id="delete_btn"--%> href="${pageContext.request.contextPath}/studentDel?sno=${list.sno}" class="btn btn-danger btn-sm delete_btn">
                                    <span class="glyphicon glyphicon-trash"></span>删除
                                </a>
                            </td>
                            <td>${list.sno}</td>
                            <td>${list.name}</td>
                            <td>${list.sex}</td>
                            <td>${list.department}</td>
                            <td>${list.classes}</td>
                            <td>${list.tel}</td>
                            <td>${list.email}</td>
                            <td>${list.password}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                </c:when>
                <c:otherwise>
                    <span><strong>暂无学生信息</strong></span>
                </c:otherwise>
            </c:choose>
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
                        <li><a href="${pageContext.request.contextPath}/studentSelectAll?pn=1">首页</a></li>
                        <c:if test="${studentList.hasPreviousPage }">
                            <li><a href="${pageContext.request.contextPath}/studentSelectAll?pn=${studentList.pageNum-1}"
                                   aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                            </a></li>
                        </c:if>

                        <c:forEach items="${studentList.navigatepageNums }" var="page_Num">
                            <c:if test="${page_Num == studentList.pageNum }">
                                <li class="active"><a href="#">${page_Num }</a></li>
                            </c:if>
                            <c:if test="${page_Num != studentList.pageNum }">
                                <li><a href="${pageContext.request.contextPath}/studentSelectAll?pn=${page_Num }">${page_Num }</a></li>
                            </c:if>
                        </c:forEach>

                        <c:if test="${studentList.hasNextPage }">
                            <li><a href="${pageContext.request.contextPath}/studentSelectAll?pn=${studentList.pageNum+1 }"
                                   aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                            </a></li>
                        </c:if>

                        <li><a href="${pageContext.request.contextPath}/studentSelectAll?pn=${studentList.pages}">末页</a></li>
                    </ul>
                </nav>
            </div>
        </div>
        <!-- 添加模态框 -->
        <div class="modal fade" id="Add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" >添加学生</h4>
                    </div>
                    <div class="modal-body">
                        <form action="${pageContext.request.contextPath}/studentAdd" method="post" class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">学号</label>
                                <div class="col-sm-10">
                                    <input type="text" name="sno" class="form-control" placeholder="学号">
                                    <!--一个较长的帮助文本块，超过一行，需要扩展到下一行 -->
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">姓名</label>
                                <div class="col-sm-10">
                                    <input type="text" name="name" class="form-control" placeholder="姓名">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">专业</label>
                                <div class="col-sm-10">
                                    <label>
                                        <select  name="department" class="form-control">
                                            <option value="计算机科学与技术">计算机科学与技术</option>
                                            <option value="软件工程">软件工程</option>
                                            <option value="网络工程">网络工程</option>
                                        </select>
                                    </label>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">班级</label>
                                <div class="col-sm-10">
                                    <input type="text" name="classes" class="form-control" placeholder="班级">
                                    <span class="help-block"></span>
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
                        <h4 class="modal-title" >修改教师信息</h4>
                    </div>
                    <div class="modal-body">
                        <form action="${pageContext.request.contextPath}/studentUpd" method="post" class="form-horizontal">

                            <div class="form-group">
                                <label class="col-sm-2 control-label">学号</label>
                                <div class="col-sm-10">
                                    <input type="text" id="sno" name="sno" class="form-control" placeholder="学号">
                                    <!--一个较长的帮助文本块，超过一行，需要扩展到下一行 -->
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">姓名</label>
                                <div class="col-sm-10">
                                    <input type="text" id="name" name="name" class="form-control" placeholder="姓名">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">专业</label>
                                <div class="col-sm-10">
                                    <label>
                                        <select  id="department" name="department" class="form-control">
                                            <option value="计算机科学与技术">计算机科学与技术</option>
                                            <option value="软件工程">软件工程</option>
                                            <option value="网络工程">网络工程</option>
                                        </select>
                                    </label>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">班级</label>
                                <div class="col-sm-10">
                                    <input id="classes" type="text" name="classes" class="form-control" placeholder="班级">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">密码</label>
                                <div class="col-sm-10">
                                    <input id="password" type="text" name="password" class="form-control"  placeholder="密码">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <button type="submit" class="btn btn-primary" >保存更改</button>
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
