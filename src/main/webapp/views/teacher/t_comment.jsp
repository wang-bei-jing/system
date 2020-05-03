<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <title>我的消息</title>

    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/cork/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/static/cork/assets/css/plugins.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->

    <!-- BEGIN PAGE LEVEL STYLES -->
    <link href="${pageContext.request.contextPath}/static/cork/assets/css/apps/mailing-chat.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL STYLES -->

</head>
<body>
<!-- 记录添加的模态框 -->
    <div class="modal fade" id="newModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">新建联系人</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">学生姓名</label>
                        <div class="col-sm-10">
                            <select id="student" name="two" class="form-control" onchange="getTopic()">
                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">课题名</label>
                        <div class="col-sm-10">
                            <select id="topic" name="gTsId" class="form-control">
                                <option>---请选择课题---</option>
                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">消息内容</label>
                        <div class="col-sm-10">
                            <input type="text" name="cComment" class="form-control" id="cComment_add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="peaceTime_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>
    <div class="layout-px-spacing">
        <div class="layout-top-spacing" >
            <div class="layout-spacing">
                <div>
                    <button id="new_btn" class="btn btn-s btn-primary">新建联系人</button>
                </div>
                <div class="chat-system" style="height: 500px">
                    <div class="hamburger"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-menu mail-menu d-lg-none"><line x1="3" y1="12" x2="21" y2="12"></line><line x1="3" y1="6" x2="21" y2="6"></line><line x1="3" y1="18" x2="21" y2="18"></line></svg></div>
                    <div class="user-list-box">
                        <div class="search">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
                            <input type="text" class="form-control" placeholder="Search" />
                        </div>
                        <div class="people" id="person_area">
                            <c:forEach items="${peopleList}" var="people">
                                <div class="person" id="person${people.sno}" data-chat=${people.sno}>
                                    <div class="user-info">
                                        <div class="f-body">
                                            <div class="meta-info">
                                                <span class="user-name" data-name=${people.sno}>${people.name}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="chat-box" style="height:100%">
                        <div class="chat-not-selected">
                            <p> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-square"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path></svg>选择聊天</p>
                        </div>
                        <div class="chat-box-inner">
                            <div class="chat-conversation-box" style="height:100%">
                                <div id="chat_area" class="chat-conversation-box-scroll">
                                </div>
                            </div>
                            <div class="chat-footer" style="padding-top: 20px">
                                <div class="chat-input" >
                                    <form class="chat-form" id="add_form">
                                        <input name="cContent" id="cContent_add_input" type="text" style="width:92%;display:inline;" class="mail-write-box form-control"/>
                                        <button id="add_btn" class="btn btn-s btn-primary">发送</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
<script src="${pageContext.request.contextPath}/static/cork/assets/js/libs/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/cork/bootstrap/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/static/cork/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/cork/plugins/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/static/cork/assets/js/app.js"></script>

<script src="${pageContext.request.contextPath}/static/cork/assets/js/custom.js"></script>
<!-- END GLOBAL MANDATORY SCRIPTS -->

<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="${pageContext.request.contextPath}/static/cork/assets/js/apps/mailbox-chat.js"></script>
<!-- END PAGE LEVEL SCRIPTS -->

<script type="text/javascript">
    var tno = "${teacher.tno}";
    $(function(){
        people();
    });
    function people(){
        $.ajax({
            url:"${pageContext.request.contextPath}/comment/people/"+tno,
            type:"GET",
            success:function(result){
                $("#chat_area").empty();
                var peopleList = result.extend.peopleList;
                for(var i=0;i<peopleList.length;i++) {
                    chat(peopleList[i].sno);
                }
            }
        });
        //setTimeout(people,10*1000);
    }
    function chat(two){
        $.ajax({
            url:"${pageContext.request.contextPath}/comment/chat",
            data:"one="+tno+"&two="+two,
            type:"GET",
            success:function(result){
                build_chat(result.extend.student,result.extend.commentList)
            }
        });
        //setTimeout(chat,10*1000);
    }
    function build_chat(student,commentList){
        var data_chat = student.sno;
        var chat = $("<div class=\"chat\"></div>").attr("data-chat", data_chat).attr("id", "chat"+data_chat);
        var name = ($("<div class=\"conversation-start\"></div>").append($("<span></span>").append(student.name)));
        chat.append(name);
        for(var i=0;i<commentList.length;i++) {
            if (commentList[i].cIdentity === 21) {
                var data_what1 = commentList[i].cContent;
                var what1 = $("<div class=\"bubble you\"></div>")
                    .append(data_what1);
                chat.append(what1);
            }
            if (commentList[i].cIdentity === 12) {
                var data_what2 = commentList[i].cContent;
                var what2 = $("<div class=\"bubble me\"></div>")
                    .append(data_what2);
                chat.append(what2);
            }
        }
        chat.appendTo("#chat_area");
    }
    //点击添加
    $("#add_btn").click(function(){
        var two = $('#person_area div.active').attr('data-chat');
        alert(two);
        var cContent = $("#cContent_add_input").val();
        $.ajax({
            url:"${pageContext.request.contextPath}/comment/add",
            type:"POST",
            data:"cContent="+cContent+"&one="+tno+"&two="+two,
            success:function(){
                alert("成功1");
                document.getElementById("person"+two).addClass("active");
                document.getElementById("chat"+two).addClass("active");
                alert("成功2");
            }
        });
    });
    //新增时显示学生姓名和课题
    function getTopicSelect(ele){
        //清空之前下拉列表的值
        $(ele).empty();
        $.ajax({
            url:"${pageContext.request.contextPath}/gradeRecord/getStudent/"+tno,
            type:"GET",
            success:function(result){
                var optionEle = $("<option></option>").append("---请选择学生---");
                optionEle.appendTo(ele);
                $.each(result.extend.topicSelectList,function(){
                    var optionEle1 = $("<option></option>").append(this.student.name).attr("value",this.id);
                    optionEle1.appendTo(ele);
                });
            }
        });
    }
    //级联显示课题名
    function getTopic(){
        //清空之前下拉列表的值
        var id = $("#newModal #student").val();
        $("#newModal #topic").empty();
        var optionEle = $("<option></option>").append("---请选择课题---");
        optionEle.appendTo("#newModal #topic");
        $.ajax({
            url:"${pageContext.request.contextPath}/gradeRecord/getTopic/"+id,
            type:"GET",
            success:function(result){
                var optionEle1 = $("<option></option>").append(result.extend.topicSelect.topic.name).attr("value",result.extend.topicSelect.student.sno);
                optionEle1.appendTo("#newModal #topic");
            }
        });
    }
    //点击新增按钮弹出模态框。
    $("#new_btn").click(function(){
        //清除表单数据（表单完整重置（表单的数据，表单的样式））
        reset_form("#newModal form");
        getTopicSelect("#newModal #student");
        //弹出模态框
        $("#newModal").modal({
            backdrop:"static"
        });
    });
    //清空表单样式及内容
    function reset_form(ele){
        $(ele)[0].reset();
        //清空表单样式
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }
    //点击添加
    $("#peaceTime_save_btn").click(function(){
        var two = $("#newModal #topic").val();
        var cComment = $("#cComment_add_input").val();
        $.ajax({
            url:"${pageContext.request.contextPath}/comment/add",
            type:"POST",
            data:"cContent="+cComment+"&one="+tno+"&two="+two,
            success:function(result){
                alert(result.msg);
                if(result.code === 200){
                    alert(result.extend.message);
                }
                $("#newModal").modal('hide');
            }
        });
    });
</script>
</body>
</html>
