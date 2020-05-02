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

    <div class="layout-px-spacing">
        <div class="chat-section layout-top-spacing" >
        <div class="layout-spacing">
            <div class="row">
                <div class="col-xl-12 col-lg-12 col-md-12">
                    <div class="chat-system">
                        <div class="hamburger"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-menu mail-menu d-lg-none"><line x1="3" y1="12" x2="21" y2="12"></line><line x1="3" y1="6" x2="21" y2="6"></line><line x1="3" y1="18" x2="21" y2="18"></line></svg></div>
                        <div class="user-list-box">
                            <div class="search">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
                                <input type="text" class="form-control" placeholder="Search" />
                            </div>
                            <div class="people" id="person_area">
                                <c:forEach items="${teacherCommentList}" var="teacherComment">
                                    <div class="person" data-chat=${teacherComment.tcId}>
                                        <div class="user-info">
                                            <div class="f-body">
                                                <div class="meta-info">
                                                    <span class="user-name" data-name=${teacherComment.tcId}>${teacherComment.tcId}</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="chat-box">
                            <div class="chat-not-selected">
                                <p> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-square"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path></svg> Click User To Chat</p>
                            </div>
                            <div class="chat-box-inner">
                                <div class="chat-conversation-box">
                                    <div id="chat_area" class="chat-conversation-box-scroll">
                                         <div class="chat" data-chat="123">
                                             <div class="conversation-start">
                                                 <span>Today, 6:48 AM</span>
                                             </div>
                                             <div class="bubble you">
                                                 Hello,
                                             </div>
                                             <div class="bubble me">
                                                 It's me.
                                             </div>
                                             <div class="bubble you">
                                                 I have a question regarding project.
                                             </div>
                                         </div>
                                    </div>
                                </div>
                                <div class="chat-footer">
                                    <div class="chat-input">
                                        <form class="chat-form" action="javascript:void(0);">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-square"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path></svg>
                                            <input type="text" class="mail-write-box form-control" placeholder="Message"/>
                                        </form>
                                    </div>
                                </div>
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
    var tno = ${teacher.tno};
    $(function(){
        automatic();
    });
    function automatic(){
        //每隔两秒刷新一次页面
        $.ajax({
            url:"${pageContext.request.contextPath}/comment/select/"+tno,
            type:"GET",
            success:function(result){
                build_chat_area(result.extend.teacherCommentList);
            }
        });
        //setTimeout(automatic,2*1000);
    }
    //解析显示分页信息
    function build_person_area(){
        $("#person_area").empty();
        // <div class="person" data-chat="person1">
        //     <div class="user-info">
        //         <div class="f-body">
        //             <div class="meta-info">
        //                 <span class="user-name" data-name="小老鼠">小老鼠</span>
        //             </div>
        //         </div>
        //     </div>
        // </div>
        for(var i=1;i<3;i++){
            var data_chat = "person"+[i];
            alert(data_chat);
            var data_name = "name"+[i];
            var person = $("<div class=\"person\"></div>").attr("data-chat",data_chat);
            var a =$("<div class=\"user-info\"></div>");
            person.append(a);
            var b =$("<div class=\"f-body\"></div>");
            a.append(b);
            var c =$("<div class=\"meta-info\"></div>");
            b.append(c);
            var d =$("<span class=\"user-name\"></span>").append(data_name);
            c.append(d);
            person.appendTo("#person_area");
        }
    }
    //解析显示分页信息
    function build_chat_area(teacherCommentList){
        $("#chat_area").empty();
        for(var i=0;i<teacherCommentList.length;i++){
            var data_chat = teacherCommentList[i].tcId;
            var data_what1 = teacherCommentList[i].studentComment.scContent;
            var data_what2 = teacherCommentList[i].tcContent;
            var chat = $("<div class=\"chat\"></div>").attr("data-chat",data_chat);
            var time = ($("<div class=\"conversation-start\"></div>").append($("<span></span>").append("当前时间")));
            chat.append(time);
            var what1 =$("<div class=\"bubble you\"></div>")
                .append(data_what1);
            chat.append(what1);
            var what2 =$("<div class=\"bubble me\"></div>")
                .append(data_what2);
            chat.append(what2);
            chat.appendTo("#chat_area");
        }
    }
</script>
</body>
</html>
