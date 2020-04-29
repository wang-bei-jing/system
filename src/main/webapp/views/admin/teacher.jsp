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
        function edit(tno){
            $.ajax({
                type:"post",
                url:"/system/selectTeacherByTno",
                data:{"tno":tno,},
                dataType:"json",
                success:function (oneteacher) {
                    $("#tno").val(oneteacher.tno);
                    $("#name").val(oneteacher.name);
                    $("#department").val(oneteacher.department);
                    $("#identity").val(oneteacher.identity);

                    $("#sex").val(oneteacher.sex);
                    $("#title").val(oneteacher.title);
                    $("#office").val(oneteacher.office);
                    $("#tel").val(oneteacher.tel);
                    $("#email").val(oneteacher.email);
                    $("#password").val(oneteacher.password);
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
        $(document).ready(function(){
            $("tbody>tr:odd").css("background-color","#e4e4e4");
            $("tbody>tr:even").css("background-color","white");
        });
        function loadFile(file){
            $("#filename").html(file.name);
        };
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
            <h4>全部教师</h4>
        </row>
    </div>
</header>
<div id="main_page" class="page-header">
    <!-- 搭建显示页面 -->
    <div class="container" style="width: 100%">
        <div class="modal-header">
            <h2>全部教师 <small>(Information  of all teachers)</small></h2>
            <!-- 按钮 -->
            <div class="row">
                <div class="col-md-6">
                    <form action="${pageContext.request.contextPath}/teacherSelectByName" method="post" class="navbar-form navbar-left" role="search">
                        <input  type="text" name="name" value="${teachername}" class="form-control" autocomplete="on" placeholder="按教师姓名查询">
                        <button type="submit" class="btn btn-info">查询</button>
                    </form>
                </div>

                <div class="form-group col-md-6">
                    <span  class=" btn btn-primary" style="background: white;color: #0f6674">批量导入教师 :</span>
                </div>
                <div>
                    <form action="${pageContext.request.contextPath}/importTeachers" method="post" class="form-horizontal" enctype="multipart/form-data">
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
                    <a id="seeall"  href="${request}/teacherSelectAll" methods="post" class="btn btn-primary">查看所有教师</a>
                    <button class="btn btn-success" id="add_modal" >添加教师</button>
                </div>

            </div>
        </div>
        <br>
        <!-- 显示表格数据 -->
        <div class="row" id="table_page">
            <div class="col-md-12">
            <c:choose>
                <c:when test="${teacherList.list[0]!=null}">
                <table class="table table-hover" >
                    <thead style="color: red">
                    <tr>
                        <th>操作</th>
                        <th>教师编号</th>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>职称</th>
                        <th>身份</th>
                        <th>所在系</th>
                        <th>办公室</th>
                        <th>联系方式</th>
                        <th>电子邮箱</th>
                        <th>密码</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${teacherList.list}" var="list">
                        <tr class="mytr">
                            <td>
                              <%--  <a  href="javascript:void(0)" onclick="signup('${list.num}','${list.tno}','${list.id}')">报名</a>--%>
                                <button class="btn btn-primary btn-sm edit_btn" id="edit_btn" onclick="edit('${list.tno}')" >
                                    <span class="glyphicon glyphicon-pencil"></span>编辑
                                </button>
                                <a id="delete_btn" href="${pageContext.request.contextPath}/teacherDel?tno=${list.tno}" class="btn btn-danger btn-sm delete_btn">
                                    <span class="glyphicon glyphicon-trash"></span>删除
                                </a>
                            </td>
                            <td>${list.tno}</td>
                            <td>${list.name}</td>
                            <td>${list.sex}</td>
                            <td>${list.title}</td>

                            <c:choose>
                            <c:when test="${list.identity==0}">
                                <td>普通教师</td>
                            </c:when>
                                <c:otherwise><td>系主任</td></c:otherwise>
                            </c:choose>
                            <td>${list.department}</td>
                            <td>${list.office}</td>
                            <td>${list.tel}</td>
                            <td>${list.email}</td>
                            <td>${list.password}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                </c:when>
                <c:otherwise>
                    <span><strong>暂无教师信息</strong></span>
                </c:otherwise>
            </c:choose>
            </div>
        </div>
        <%--分页信息--%>
        <div class="row">
            <div class="col-md-6">
                当前是第${teacherList.pageNum }页,
                共${teacherList.pages }页,
                共 ${teacherList.total }条记录
            </div>
            <div class="col-md-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li><a href="${pageContext.request.contextPath}/teacherSelectAll?pn=1">首页</a></li>
                        <c:if test="${teacherList.hasPreviousPage }">
                            <li><a href="${pageContext.request.contextPath}/teacherSelectAll?pn=${teacherList.pageNum-1}"
                                   aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                            </a></li>
                        </c:if>

                        <c:forEach items="${teacherList.navigatepageNums }" var="page_Num">
                            <c:if test="${page_Num == teacherList.pageNum }">
                                <li class="active"><a href="#">${page_Num }</a></li>
                            </c:if>
                            <c:if test="${page_Num != teacherList.pageNum }">
                                <li><a href="${pageContext.request.contextPath}/teacherSelectAll?pn=${page_Num }">${page_Num }</a></li>
                            </c:if>
                        </c:forEach>

                        <c:if test="${teacherList.hasNextPage }">
                            <li><a href="${pageContext.request.contextPath}/teacherSelectAll?pn=${teacherList.pageNum+1 }"
                                   aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                            </a></li>
                        </c:if>

                        <li><a href="${pageContext.request.contextPath}/teacherSelectAll?pn=${teacherList.pages}">末页</a></li>
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
                        <h4 class="modal-title" >添加教师</h4>
                    </div>
                    <div class="modal-body">
                        <form action="${pageContext.request.contextPath}/addTeacher" method="post" class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">教师编号</label>
                                <div class="col-sm-10">
                                    <input type="text" name="tno" class="form-control" placeholder="教师编号">
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
                                <label class="col-sm-2 control-label">所在系</label>
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
                                <label class="col-sm-2 control-label">身份</label>
                                <div class="col-sm-10">
                                    <label>
                                        <select  name="identity" class="form-control">
                                            <option value="0">普通教师</option>
                                            <option value="1">系主任</option>
                                        </select>
                                    </label>
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
                        <form action="${pageContext.request.contextPath}/updateTeacher" method="post" class="form-horizontal">
                            <input id="sex" name="sex" type="text" style="display: none" value="">
                            <input id="title" name="title" type="text" style="display: none" value="">
                            <input id="office" name="office" type="text" style="display: none" value="">
                            <input id="tel"   name="tel" type="text" style="display: none" value="">
                            <input id="email" name="email" type="text" style="display: none" value="">

                            <div class="form-group">
                                <label class="col-sm-2 control-label">教师编号</label>
                                <div class="col-sm-10">
                                    <input id="tno" type="text" name="tno" class="form-control"  placeholder="教师编号" readonly>
                                    <span class="help-block"></span>
                                    <span style="color: red">*不允许修改</span>
                                </div>

                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">姓名</label>
                                <div class="col-sm-10">
                                    <input id="name" type="text" name="name" class="form-control"  placeholder="姓名">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">所在系</label>
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
                                <label class="col-sm-2 control-label">身份</label>
                                <div class="col-sm-10">
                                    <label>
                                        <select id="identity" name="identity" class="form-control">
                                            <option value="0">普通教师</option>
                                            <option value="1">系主任</option>
                                        </select>
                                    </label>
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
