<%@ page import="java.util.Date" %>
<%@ page import="edu.zzti.bean.TimeManger" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    java.util.Date date = new java.util.Date();
    java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm");
    String currenttimestr = dateFormat.format(date);
    System.out.println(currenttimestr);
    java.util.Date currenttime = dateFormat.parse(currenttimestr);
    System.out.println(currenttime);

    Object obj=request.getSession().getAttribute("tpsTimeManger");

        TimeManger timeManger=(TimeManger)obj;
        Date begintime=timeManger.getTiBegin();
        Date endtime=timeManger.getTiEnd();
       /*  String btimestr = dateFormat.format(btime);
        String etimestr = dateFormat.format(etime);
        java.util.Date begintime = dateFormat.parse(btimestr);
        java.util.Date endtime = dateFormat.parse(etimestr);*/
    if(currenttime.after(begintime)&&currenttime.before(endtime)){
%>
<!DOCTYPE html>
<html>
<head>
    <title>全部课题页面</title>
    <link href="${pageContext.request.contextPath}/static/css/all.css" rel="stylesheet" type="text/css" charset="utf-8"/>
    <link href="${pageContext.request.contextPath}/static/mainstatic/css/index.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/static/mainstatic/js/index.js"></script>
    <%--引入jquery--%>
    <script src="${pageContext.request.contextPath}/static/mainstatic/bootstrap/jquery/jquery-1.12.4.min.js"></script>
    <!-- 引入 Bootstrap样式-->
    <link href="${pageContext.request.contextPath}/static/mainstatic/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/static/mainstatic/bootstrap/js/bootstrap.min.js"></script>
    <c:set var="request" value="${pageContext.request.contextPath}"></c:set>

    <script type="text/javascript">
        function see(name,contents,type,tname,source,difficulty,support,department,num,selectNum,dTId,office,tel,email){
            $("#name").val(name);
            $("#contents").val(contents);
            $("#type").val(type);
            $("#tname").val(tname);
            $("#source").val(source);
            $("#difficulty").val(difficulty);
            $("#support").val(support);
            $("#department").val(department);
            $("#num").val(num);
            $("#selectNum").val(selectNum);
            $("#office").val(office);
            $("#tel").val(tel);
            $("#email").val(email);
            $("#dTId").val(dTId);
            $("#Add").modal({
                backdrop: "static",
            });
        };

    </script>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#down_btn", this).click(function () {
                var  dTId=$("#dTId").val();
                $.ajax({
                    type:"post",
                    url:"/system/findDIdlist",
                    data:{"dTId":dTId},
                    dateType:"json",
                    success:function(data){
                        var files = [];
                        for(var i=0;i<data.length;i++){
                            var dId = data[i];
                            var href = "${pageContext.request.contextPath}/downloadOneTopicFile?dId="+dId;
                            files.push(href);
                        };
                        files.forEach(url => {
                                let a = document.createElement('a'); // 创建a标签
                                let e = document.createEvent('MouseEvents'); // 创建鼠标事件对象
                                e.initEvent('click', false, false);// 初始化事件对象
                                a.href = url; // 设置下载地址
                                a.download = ''; // 设置下载文件名
                                a.dispatchEvent(e);
                        });
                    }
                });


            })
        });

    </script>
    <script type="text/javascript">
        function signup(num,tno,id){

            var sstatus=${student.status};
            var ssno=${student.sno};

            $.ajax({
                type:"post",
                url:"/system/TopicSelectExistBySSno",
                data:{"sSno":ssno,"tpId":id},
                dataType:"json",
                success:function(exist){
                    /* alert("exist进来了"+exist);*/
                    if (sstatus==0){
                        if (num>0){
                            /* alert("num进来了");*/
                            if (exist<3){
                                /*    alert("要提交了");*/
                                $.ajax({
                                    type:"post",
                                    url:"/system/TopicSelectExistBySSnoandtpid",
                                    data:{"sSno":ssno,"tpId":id},
                                    dataType:"json",
                                    success:function(data){
                                        /*  alert("我回来啦");*/
                                        if(data == "0"){
                                            /*alert("我回来啦2");*/
                                            $.ajax({
                                                type:"post",
                                                url:"/system/TopicSelectAdd",
                                                data:{"sSno":ssno,"tTno":tno,"tpId":id},
                                                dateType:"json",
                                                success:function (data) {
                                                    /* alert("我you回来啦");*/
                                                    if(data=="1"){
                                                        alert("报名成功，等待老师确认！")
                                                        $.ajax({
                                                            type:"post",
                                                            url:"/system/TopicSelectExist",
                                                            data:{"sSno":ssno,"tpId":id},
                                                            dataType:"json"
                                                        });
                                                    }
                                                }
                                            });

                                        }else {
                                            alert("您已报名该课题！")
                                        }
                                    }
                                });
                            } else {alert("您已报名3个课题！达到上限！");}

                        }else {
                            alert("该课题人数已满！请选择其他课题");
                        }
                    } else {
                        alert("已被老师确认，无法报名!");
                    };
                }
            });
        };
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
            <h4>全部课题</h4>
        </row>
    </div>
</header>
<div id="main_page" class="page-header" style="width: 150%">
    <!-- 搭建显示页面 -->
    <div class="container" style="width: 100%">
        <div class="modal-header">
            <h2>全部课题信息 <small>(Information  of all topics)</small></h2>
            <!-- 按钮 -->
            <div class="row">
                <div class="col-md-7">
                    <form action="${pageContext.request.contextPath}/TopicSelectByName" method="post" class="navbar-form navbar-left" role="search">
                        <input  type="text" name="name" class="form-control" placeholder="按课程名称查询">
                        <button type="submit" class="btn btn-info">查询</button>
                    </form>
                </div>
                <div class="col-md-4">
                    <a id="seeall"  href="${request}/TopicSelectByName" methods="post" class="btn btn-primary">查看所有课程</a>
                </div>
            </div>
        </div>
        <!-- 显示表格数据 -->
        <div class="row" id="table_page">
            <div  class="col-md-12" >
                <table class="table table-hover" >
                    <thead>
                    <tr>
                        <th style="width: 140px">操作</th>
                        <th style="width: 220px">课题名</th>
                        <th>简介</th>
                        <th>教师姓名</th>
                        <th>类型</th>
                        <th>来源</th>
                        <th>难度</th>
                        <th>是否重点扶持项目</th>
                        <th style="width: 140px">审题教研室</th>
                        <th>所需人数</th>
                        <th>已选人数</th>
                        <th>职称</th>
                        <th style="width: 150px">办公室</th>
                        <th style="width: 150px">联系方式</th>
                        <th style="width: 150px">电子邮箱</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${topicList.list}" var="list">
                        <tr class="mytr">
                            <td><button class="btn btn-primary" style="font-style: initial" href="javascript:void(0)" onclick="signup('${list.num}','${list.tno}','${list.id}')">报名</button>  <button class="btn btn-success" style="font-style: initial" href="javascript:void(0)" onclick="see('${list.name}','${list.contents}','${list.type}','${list.teacher.name}','${list.source}','${list.difficulty}','${list.support}','${list.department}','${list.num}','${list.selectNum}','${list.id}','${list.teacher.office}','${list.teacher.tel}','${list.teacher.email}')">详情</button></td>
                            <td title="${list.name}">${list.name}</td>
                            <td title="${list.contents}">${list.contents}</td>
                            <td title="${list.teacher.name}">${list.teacher.name}</td>
                            <td title="${list.type}">${list.type}</td>
                            <td title="${list.source}">${list.source}</td>
                            <td title="${list.difficulty}">${list.difficulty}</td>
                            <td title="${list.support}">${list.support}</td>
                            <td title="${list.department}">${list.department}</td>
                            <td title="${list.num}">${list.num}</td>
                            <td title="${list.selectNum}">${list.selectNum}</td>
                            <td title="${list.teacher.title}">${list.teacher.title}</td>
                            <td title="${list.teacher.office}">${list.teacher.office}</td>
                            <td title="${list.teacher.tel}">${list.teacher.tel}</td>
                            <td title="${list.teacher.email}">${list.teacher.email}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- 显示模态框 -->
        <div class="modal fade" id="Add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content" >
                    <div class="modal-header">
                        <h4 class="modal-title" >课题详情</h4>
                    </div>
                    <div class="modal-body"  >
                            <div class="form-group">
                                <label class="col-md-2 control-label">课题名:</label>
                                <div class="col-md-10">
                                    <input type="text"  id="name" class="form-control" readonly >
                                    <span class="help-block"></span>
                                    <!--一个较长的帮助文本块，超过一行，需要扩展到下一行 -->
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">简介:</label>
                                <div class="col-md-10">
                                    <textarea id="contents" cols="94px" rows="5px"  disabled></textarea>
                                </div>
                            </div>
                            &nbsp;
                            <div class="form-group">
                                <label class="col-md-2 control-label">教师姓名:</label>
                                <div class="col-md-10">
                                    <input type="text" id="tname" class="form-control" readonly >
                                    <!--一个较长的帮助文本块，超过一行，需要扩展到下一行 -->
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">类型:</label>
                                <div class="col-md-10">
                                    <input type="text" id="type" class="form-control" readonly >
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">来源:</label>
                                <div class="col-md-10">
                                    <input type="text" id="source" class="form-control" readonly >
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">难度:</label>
                                <div class="col-md-10">
                                    <input type="text" id="difficulty" class="form-control" readonly >
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label" style="font-size:12px">是否为重点扶持项目:</label>
                                <div class="col-md-10">
                                    <input type="text" id="support" class="form-control" readonly >
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">审题教研室:</label>
                                <div class="col-md-10">
                                    <input type="text" id="department" class="form-control" readonly >
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">所需人数:</label>
                                <div class="col-md-10">
                                    <input type="text" id="num" class="form-control" readonly >
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">已选人数:</label>
                                <div class="col-md-10">
                                    <input type="text" id="selectNum" class="form-control" readonly >
                                    <span class="help-block"></span>
                                </div>
                            </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">办公室:</label>
                            <div class="col-md-10">
                                <input type="text" id="office" class="form-control" readonly >
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">联系方式:</label>
                            <div class="col-md-10">
                                <input type="text" id="tel" class="form-control" readonly >
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                        <label class="col-md-2 control-label">电子邮箱:</label>
                        <div class="col-md-10">
                            <input type="text" id="email" class="form-control" readonly >
                            <span class="help-block"></span>
                        </div>
                        </div>

                        <input id="dTId" style="display: none">

                        <div class="form-group">
                            <label class="col-md-2 control-label">下载附件:</label>
                            <div class="col-md-10">

                                    <button class="btn btn-primary btn-sm edit_btn"
                                            id="down_btn">
                                        下载
                                    </button>

                            </div>
                        </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            </div>

                    </div>
                </div>
            </div>
        </div>
        <%--分页信息--%>
        <div class="row">
            <div class="col-md-6">
                当前是第${topicList.pageNum }页,
                共${topicList.pages }页,
                共 ${topicList.total }条记录
            </div>
            <div class="col-md-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">

                        <li><a href="${pageContext.request.contextPath}/TopicSelectByName?name=${topicname}&pn=1">首页</a></li>
                        <c:if test="${topicList.hasPreviousPage }">
                            <li><a href="${pageContext.request.contextPath}/TopicSelectByName?name=${topicname}&pn=${topicList.pageNum-1}"
                                   aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                            </a></li>
                        </c:if>

                        <c:forEach items="${topicList.navigatepageNums }" var="page_Num">
                            <c:if test="${page_Num == topicList.pageNum }">
                                <li class="active"><a href="#">${page_Num }</a></li>
                            </c:if>
                            <c:if test="${page_Num != topicList.pageNum }">
                                <li><a href="${pageContext.request.contextPath}/TopicSelectByName?name=${topicname}&pn=${page_Num }">${page_Num }</a></li>
                            </c:if>
                        </c:forEach>

                        <c:if test="${topicList.hasNextPage }">
                            <li><a href="${pageContext.request.contextPath}/TopicSelectByName?name=${topicname}&pn=${topicList.pageNum+1 }"
                                   aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                            </a></li>
                        </c:if>

                        <li><a href="${pageContext.request.contextPath}/TopicSelectByName?name=${topicname}&pn=${topicList.pages}">末页</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<%
    }else {
%>
<html>
<head>
    <title>全部课题页面</title>
    <link href="${pageContext.request.contextPath}/static/mainstatic/css/index.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/static/mainstatic/js/index.js"></script>
    <%--引入jquery--%>
    <script src="${pageContext.request.contextPath}/static/mainstatic/bootstrap/jquery/jquery-1.12.4.min.js"></script>
    <!-- 引入 Bootstrap样式-->
    <link href="${pageContext.request.contextPath}/static/mainstatic/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/static/mainstatic/bootstrap/js/bootstrap.min.js"></script>
    <c:set var="request" value="${pageContext.request.contextPath}"></c:set>

</head>
<body>

<header >
    <div class="header" style="text-align: center">
        <row>
            <h4>全部课题</h4>
        </row>
    </div>
</header>
<div id="twomain_page" class="page-header">
    <!-- 搭建显示页面 -->
    <div class="container" style="width: 100%">
        <div class="modal-header">
            <h4 style="color: red">未在有效选课时间内！</h4>
            <!-- 按钮 -->
        </div>
        <br>

    </div>
</div>

</body>
</html>

<%
    }
%>