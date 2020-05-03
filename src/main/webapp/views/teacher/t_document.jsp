<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">

    <link href="${pageContext.request.contextPath}/static/cork/assets/css/loader.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/static/cork/assets/js/loader.js"></script>

    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/cork/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/static/cork/assets/css/plugins.css" rel="stylesheet" type="text/css" />
    <title>学生实训报告</title>
</head>
<body>

<!-- BEGIN LOADER -->
<div id="load_screen"> <div class="loader"> <div class="loader-content"> <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 792 723" style="enable-background:new 0 0 792 723;" xml:space="preserve"> <g> <g> <path class="st0" d="M213.9,584.4c-47.4-25.5-84.7-60.8-111.8-106.1C75,433.1,61.4,382,61.4,324.9c0-57,13.6-108.1,40.7-153.3 S166.5,91,213.9,65.5s100.7-38.2,159.9-38.2c49.9,0,95,8.8,135.3,26.3s74.1,42.8,101.5,75.7l-85.5,78.9 c-38.9-44.9-87.2-67.4-144.7-67.4c-35.6,0-67.4,7.8-95.4,23.4s-49.7,37.4-65.4,65.4c-15.6,28-23.4,59.8-23.4,95.4 s7.8,67.4,23.4,95.4s37.4,49.7,65.4,65.4c28,15.6,59.7,23.4,95.4,23.4c57.6,0,105.8-22.7,144.7-68.2l85.5,78.9 c-27.4,33.4-61.4,58.9-102,76.5c-40.6,17.5-85.8,26.3-135.7,26.3C314.3,622.7,261.3,809.9,213.9,584.4z"/> </g> <circle class="st1" cx="375.4" cy="322.9" r="100"/> </g> <g> <circle class="st2" cx="275.4" cy="910" r="65"></circle> <circle class="st4" cx="475.4" cy="910" r="65"></circle> </g> </svg> </div></div></div>
<!--  END LOADER -->

<!-- 记录修改弹框 -->
<div class="modal fade" id="peaceTimeUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">批阅</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">编号</label>
                        <div class="col-sm-10">
                            <input type="text" name="id" class="form-control" disabled="disabled" id=id_update_input>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">学生姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="sName" class="form-control" disabled="disabled" id="sName_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">课题名</label>
                        <div class="col-sm-10">
                            <input type="text" name="tpName" class="form-control" disabled="disabled" id="tpName_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">文件名</label>
                        <div class="col-sm-10">
                            <input type="text" name="documentname" class="form-control" disabled="disabled" id="documentname_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">批阅内容</label>
                        <div class="col-sm-10">
                            <input type="text" name="annotation" class="form-control" id="annotation_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="peaceTime_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>

<div class="layout-px-spacing">
    <div class="row layout-top-spacing">
        <div class="col-xl-12 col-lg-12 col-sm-12  layout-spacing">
            <div class="widget-content widget-content-area br-6">
                <div class="modal-header">
                    <h1>学生实训报告</h1>
                    <div class="row">
                        <div>
                            <button id="peaceTime_btn" class="btn btn-s btn-primary">刷新</button>
                            <button id="download_all_btn" class="btn btn-s btn-primary">批量下载</button>
                        </div>
                    </div>
                </div>
                <div class="table-responsive mb-4 mt-4">
                    <table class="table table-hover" id="peaceTime_table" >
                        <thead>
                        <tr>
                            <th>
                                <input type="checkbox" id="check_all"/>
                            </th>
                            <th>学生姓名</th>
                            <th>课题名</th>
                            <th>文件名</th>
                            <th>学生备注</th>
                            <th>上传时间</th>
                            <th>教师批阅</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
                <!-- 显示分页信息 -->
                <div class="row">
                    <!--分页文字信息  -->
                    <div class="col-md-6" id="page_info_area"></div>
                    <!-- 分页条信息 -->
                    <div class="paginating-container pagination-solid" id="page_nav_area"></div>
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
<script src="${pageContext.request.contextPath}/static/cork/plugins/table/datatable/datatables.js"></script>
<!-- BEGIN THEME GLOBAL STYLE -->
<script src="${pageContext.request.contextPath}/static/cork/assets/js/scrollspyNav.js"></script>
<script src="${pageContext.request.contextPath}/static/cork/plugins/sweetalerts/sweetalert2.min.js"></script>
<script src="${pageContext.request.contextPath}/static/cork/plugins/sweetalerts/custom-sweetalert.js"></script>
<!-- END PAGE LEVEL SCRIPTS -->

<script type="text/javascript">
    var pageNum,total;
    var tno = ${teacher.tno};
    function timeStamp2String (time){
        var datetime = new Date();
        datetime.setTime(time);
        var year = datetime.getFullYear();
        var month = datetime.getMonth() + 1;
        var date = datetime.getDate();
        var hour = datetime.getHours();
        if(hour<=9){
            hour="0"+hour;
        }
        var minute = datetime.getMinutes();
        if(minute<=9){
            minute="0"+minute;
        }
        var second = datetime.getSeconds();
        if(second<=9){
            second="0"+second;
        }
        return year + "-" + month + "-" + date+" "+hour+":"+minute+":"+second;
    }
    $(function(){
        to_page(1);
    });
    $("#peaceTime_btn").click(function () {
        to_page(1);
    });
    function to_page(pn){
        $.ajax({
            url:"${pageContext.request.contextPath}/file/findWeekDocument/"+tno,
            data:"pn="+pn+"&category="+2,
            type:"GET",
            success:function(result){
                build_peaceTime_table(result.extend.pageInfo.list);
                build_page_info(result.extend.pageInfo);
                build_page_nav(result.extend.pageInfo);
            }
        });
    }
    //解析显示数据
    function build_peaceTime_table(weekDocuments){
        $("#peaceTime_add_btn").attr("add-id",tno);
        $("#peaceTime_table tbody").empty();
        for(var i=0;i<weekDocuments.length;i++){
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
            var dIdTd = $("<td></td>").append(weekDocuments[i].dId);
            var studentTd = $("<td></td>").append(weekDocuments[i].student.name);
            var topicTd = $("<td></td>").append(weekDocuments[i].topic.name);
            var documentnameTd = $("<td></td>").append(weekDocuments[i].documentname);
            var remarkTd = $("<td></td>").append(weekDocuments[i].remark);
            var annotationTd = $("<td></td>").append(weekDocuments[i].annotation);
            var time = timeStamp2String(weekDocuments[i].wkTime);
            var wkTimeTd = $("<td></td>").append(time);
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                .append("批改");
            //为编辑按钮添加一个自定义的属性，来表示当前记录id
            editBtn.attr("edit-id",weekDocuments[i].dId);
            var delBtn =  $("<button></button>").addClass("btn btn-primary btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
                .append("下载").val(weekDocuments[i].dId);
            //为删除按钮添加一个自定义的属性来表示当前删除的记录id
            delBtn.attr("del-id",weekDocuments[i].dId);
            var btnTd = $("<td></td>").append(editBtn).append(delBtn);
            $("<tr></tr>").append(checkBoxTd)
                .append(studentTd)
                .append(topicTd)
                .append(documentnameTd)
                .append(remarkTd)
                .append(wkTimeTd)
                .append(annotationTd)
                .append(btnTd)
                .appendTo("#peaceTime_table tbody");
        }
    }
    //解析显示分页信息
    function build_page_info(pageInfo){
        $("#page_info_area").empty();
        $("#page_info_area").append("当前第"+pageInfo.pageNum+"页,总"+
            pageInfo.pages+"页,总"+
            pageInfo.total+"条记录");
        total = pageInfo.total;
        pageNum = pageInfo.pageNum;
    }
    //解析显示分页条
    function build_page_nav(pageInfo){
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");
        //构建元素
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("上一页"));
        if(pageInfo.hasPreviousPage === false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else{
            //为元素添加点击翻页的事件
            firstPageLi.click(function(){
                to_page(1);
            });
            prePageLi.click(function(){
                to_page(pageInfo.pageNum -1);
            });
        }
        var nextPageLi = $("<li></li>").append($("<a></a>").append("下一页"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        if(pageInfo.hasNextPage === false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function(){
                to_page(pageInfo.pageNum +1);
            });
            lastPageLi.click(function(){
                to_page(pageInfo.pages);
            });
        }
        //添加首页和前一页 的提示
        ul.append(firstPageLi).append(prePageLi);
        //1,2，3遍历给ul中添加页码提示
        $.each(pageInfo.navigatepageNums,function(index,item){
            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if(pageInfo.pageNum === item){
                numLi.addClass("active");
            }
            numLi.click(function(){
                to_page(item);
            });
            ul.append(numLi);
        });
        //添加下一页和末页 的提示
        ul.append(nextPageLi).append(lastPageLi);
        //把ul加入到nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }
    //获得课题信息
    function getPeaceTime(dId){
        $.ajax({
            url:"${pageContext.request.contextPath}/file/detail/"+dId,
            type:"GET",
            success:function(result){
                var weekDocument = result.extend.weekDocument;
                $("#id_update_input").val(weekDocument.dId);
                $("#sName_update_input").val(weekDocument.student.name);
                $("#tpName_update_input").val(weekDocument.topic.name);
                $("#documentname_update_input").val(weekDocument.documentname);
                $("#annotation_update_input").val(weekDocument.annotation);
            }
        });
    }
    //点击编辑，弹出编辑弹窗
    $(document).on("click",".edit_btn",function(){
        getPeaceTime($(this).attr("edit-id"));
        $("#peaceTime_update_btn").attr("upd-id",$(this).attr("edit-id"));
        $("#peaceTimeUpdateModal").modal({
            backdrop:"static"
        });
    });
    //点击更新，更新记录信息
    $("#peaceTime_update_btn").click(function(){
        $.ajax({
            url:"${pageContext.request.contextPath}/file/upd/"+$(this).attr("upd-id"),
            type:"PUT",
            data:$("#peaceTimeUpdateModal form").serialize(),
            success:function(result){
                alert(result.msg);
                $("#peaceTimeUpdateModal").modal("hide");
                to_page(pageNum);
            }
        });
    });
    //单个下载
    $(document).on("click",".delete_btn",function(){
        var student = $(this).parents("tr").find("td:eq(0)").text();
        var fileName = $(this).parents("tr").find("td:eq(2)").text();
        var dId = $(this).attr("del-id");
        if(confirm("确认下载【"+student+"的"+fileName+"】吗？")){
            location.href="${pageContext.request.contextPath}/file/download?dId="+dId;
        }
    });
    //完成全选/全不选功能
    $("#check_all").click(function(){
        //attr获取checked是undefined;
        //我们这些dom原生的属性；attr获取自定义属性的值；
        //prop修改和读取dom原生属性的值
        $(".check_item").prop("checked",$(this).prop("checked"));
    });
    //check_item
    $(document).on("click",".check_item",function(){
        //判断当前选择中的元素是否5个
        var flag = $(".check_item:checked").length===$(".check_item").length;
        $("#check_all").prop("checked",flag);
    });
    //点击全部下载，就批量下载
    $("#download_all_btn").click(function(){
        var empNames = "";
        var ids = [];
        $.each($(".check_item:checked"),function(){
            empNames += $(this).parents("tr").find("td:eq(3)").text()+",";
            var id = $(this).parents("tr").find("td:eq(8)").find("button:eq(1)").attr("del-id");
            ids.push(id);
        });
        empNames = empNames.substring(0, empNames.length-1);
        if(confirm("确认删除【"+empNames+"】吗？")){
            for(var i=0;i<ids.length;i++){
                var dId = ids[i];
                location.href="${pageContext.request.contextPath}/file/download?dId="+dId;
            }
        }
    });
</script>
</body>
</html>

