<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>我的课题</title>
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
       function signup(tpId,tpsStatus){

            var ssno=${student.sno};

                   if (tpsStatus=='0'||tpsStatus=='2'){
                       if(confirm("确认退选该课题吗?")){
                       $.ajax({
                           type:"post",
                           url:"/system/TopicSelectDel",
                           data:{"sSno":ssno,"tpId":tpId},
                           dateType:"json",
                           success:function(data){
                               if(data == "1"){
                                   alert("退选成功！")
                                   $("#tr_"+tpId).remove();
                                   /*$("#mytopic-information").reload();*/
                                   window.location.reload();
                                   /*location.href="${pageContext.request.contextPath}/myTopic?sSno=${student.sno}"*/
                               }else {
                                   alert("退选失败！请联系管理员！")
                               }
                           }
                       });
                       }else{
                           return false;
                       }
                   }else {
                       alert("已被老师确认，无法取消!");
                   }




        }

    </script>
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
                <h4>我的申报课题</h4>
                </row>
            </div>
</header>
<div id="main_page" class="page-header"  style="width: 150%">
    <!-- 搭建显示页面 -->
    <div class="container" style="width: 100%">
        <div class="modal-header">
            <h2>我的申报课题 <small>(Information  of my selected topics)</small></h2>
        </div>
        <br>
        <br>
        <!-- 显示表格数据 -->
        <div class="row" id="table_page">
            <div class="col-md-12">
                <c:choose>
                    <c:when test="${topicsandteacherList!=null}">
                    <table class="table table-hover" style="text-align: center">
                        <thead style="color: red">
                        <tr>
                            <th style="width: 140px">操作</th>
                            <th>状态</th>
                            <th style="width: 250px">课题名</th>
                            <th>简介</th>
                            <th>教师姓名</th>
                            <th>职称</th>
                            <th>类型</th>
                            <th>来源</th>
                            <th>难度</th>
                            <th style="width: 140px">是否为重点扶持项目</th>
                            <th>审题教研室</th>
                            <th>所需人数</th>
                            <th>已选人数</th>
                            <th style="width: 140px">办公室</th>
                            <th style="width: 140px">联系方式</th>
                            <th style="width: 140px">电子邮箱</th>
                        </tr>
                        </thead>
                        <tbody id="mytopic-information">
                        <c:forEach items="${topicsandteacherList}" var="list">
                            <tr class="mytr">
                                <td id="td_${list.tpId}"><button class="btn btn-primary"  href="javascript:void(0)"  onclick="signup('${list.tpId}','${list.status}')">退选</button>    <button class="btn btn-success" href="javascript:void(0)" onclick="see('${list.topic.name}','${list.topic.contents}','${list.topic.type}','${list.teacher.name}','${list.topic.source}','${list.topic.difficulty}','${list.topic.support}','${list.topic.department}','${list.topic.num}','${list.topic.selectNum}','${list.topic.id}','${list.teacher.office}','${list.teacher.tel}','${list.teacher.email}')">详情</button></td>
                                <c:choose>
                                    <c:when  test="${list.status=='0'}">
                                        <td>等待教师确认</td>
                                    </c:when>
                                    <c:when  test="${list.status=='1'}">
                                        <td style="color: green">教师已确认!</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td style="color: red">教师驳回申请!</td>
                                    </c:otherwise>
                                </c:choose>
                                <td title="${list.topic.name}">${list.topic.name}</td>
                                <td title="${list.topic.contents}">${list.topic.contents}</td>
                                <td title="${list.teacher.name}">${list.teacher.name}</td>
                                <td title="${list.teacher.title}">${list.teacher.title}</td>
                                <td title="${list.topic.type}">${list.topic.type}</td>
                                <td title="${list.topic.source}">${list.topic.source}</td>
                                <td title="${list.topic.difficulty}">${list.topic.difficulty}</td>
                                <td title="${list.topic.support}">${list.topic.support}</td>
                                <td title="${list.topic.department}">${list.topic.department}</td>
                                <td title="${list.topic.num}">${list.topic.num}</td>
                                <td title="${list.topic.selectNum}">${list.topic.selectNum}</td>
                                <td title="${list.teacher.office}">${list.teacher.office}</td>
                                <td title="${list.teacher.tel}">${list.teacher.tel}</td>
                                <td title="${list.teacher.email}">${list.teacher.email}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    </c:when>
                    <c:otherwise>
                        <span style="color: red"><strong>您还没有申报题目！</strong></span>
                    </c:otherwise>
                </c:choose>
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

    </div>
</div>
</body>
</html>
