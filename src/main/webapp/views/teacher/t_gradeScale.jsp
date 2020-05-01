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
    <title>成绩比例</title>
</head>
<body>

    <!-- BEGIN LOADER -->
    <div id="load_screen"> <div class="loader"> <div class="loader-content"> <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 792 723" style="enable-background:new 0 0 792 723;" xml:space="preserve"> <g> <g> <path class="st0" d="M213.9,584.4c-47.4-25.5-84.7-60.8-111.8-106.1C75,433.1,61.4,382,61.4,324.9c0-57,13.6-108.1,40.7-153.3 S166.5,91,213.9,65.5s100.7-38.2,159.9-38.2c49.9,0,95,8.8,135.3,26.3s74.1,42.8,101.5,75.7l-85.5,78.9 c-38.9-44.9-87.2-67.4-144.7-67.4c-35.6,0-67.4,7.8-95.4,23.4s-49.7,37.4-65.4,65.4c-15.6,28-23.4,59.8-23.4,95.4 s7.8,67.4,23.4,95.4s37.4,49.7,65.4,65.4c28,15.6,59.7,23.4,95.4,23.4c57.6,0,105.8-22.7,144.7-68.2l85.5,78.9 c-27.4,33.4-61.4,58.9-102,76.5c-40.6,17.5-85.8,26.3-135.7,26.3C314.3,622.7,261.3,809.9,213.9,584.4z"/> </g> <circle class="st1" cx="375.4" cy="322.9" r="100"/> </g> <g> <circle class="st2" cx="275.4" cy="910" r="65"></circle> <circle class="st4" cx="475.4" cy="910" r="65"></circle> </g> </svg> </div></div></div>
    <!--  END LOADER -->

    <!-- 修改弹框 -->
    <div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">修改成绩比例</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <div class="col-sm-10">
                                <input type="hidden" name="id" class="form-control" disabled="disabled" id="id_update">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">平时成绩比例</label>
                            <div class="col-sm-10">
                                <select id="gradeA_update_input" name="gradeA" class="form-control">
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">期中成绩比例</label>
                            <div class="col-sm-10">
                                <select id="gradeB_update_input" name="gradeB" class="form-control">
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">验收成绩比例</label>
                            <div class="col-sm-10">
                                <select id="gradeC_update_input" name="gradeC" class="form-control">
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">报告成绩比例</label>
                            <div class="col-sm-10">
                                <select id="gradeD_update_input" name="gradeD" class="form-control">
                                </select>
                                <span class="help-block" style="color: red"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">适用专业</label>
                            <div class="col-sm-10">
                                <select id="gsDepartment_update_input" name="gsDepartment" class="form-control">
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="emp_update_btn">重新申请</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 添加弹框 -->
    <div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">申请新的成绩比例</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">平时成绩比例</label>
                            <div class="col-sm-10">
                                <select id="gradeA_add_input" name="gradeA" class="form-control">
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">期中成绩比例</label>
                            <div class="col-sm-10">
                                <select id="gradeB_add_input" name="gradeB" class="form-control">
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">验收成绩比例</label>
                            <div class="col-sm-10">
                                <select id="gradeC_add_input" name="gradeC" class="form-control">
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">报告成绩比例</label>
                            <div class="col-sm-10">
                                <select id="gradeD_add_input" name="gradeD" class="form-control">
                                </select>
                                <span class="help-block" style="color: red"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">适用专业</label>
                            <div class="col-sm-10">
                                <select id="gsDepartment_add_input" name="gsDepartment" class="form-control">
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="emp_save_btn">申请</button>
                </div>
            </div>
        </div>
    </div>

    <div class="layout-px-spacing">
        <div class="row layout-top-spacing">
            <div class="col-xl-12 col-lg-12 col-sm-12  layout-spacing">
                <div class="widget-content widget-content-area br-6">
                    <div class="modal-header">
                        <h1>成绩比例</h1>
                        <div class="row">
                            <div>
                                <button id="topic_btn" class="btn btn-s btn-primary">刷新</button>
                                <button id="topic_add_btn" class="btn btn-s btn-primary">添加</button>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive mb-4 mt-4">
                        <table class="table table-hover" id="topic_table" >
                            <thead>
                            <tr>
                                <th>比例编号</th>
                                <th>平时成绩</th>
                                <th>期中验收</th>
                                <th>验收</th>
                                <th>报告</th>
                                <th>专业</th>
                                <th>申请时间</th>
                                <th>状态</th>
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
    var department = '${teacher.department}';
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
    function to_page(pn){
        $.ajax({
            url:"${pageContext.request.contextPath}/gradeScale/select/"+department,
            data:"pn="+pn,
            type:"GET",
            success:function(result){
                build_topic_table(result.extend.pageInfo.list);
                build_page_info(result.extend.pageInfo);
                build_page_nav(result.extend.pageInfo);
            }
        });
    }
    $(function(){
        to_page(1);
    });
    $(function(){
        var optionEle1 = $("<option></option>").append("---请选择百分比---");
        var optionEle2 = $("<option></option>").append("---请选择百分比---");
        var optionEle3 = $("<option></option>").append("---请选择百分比---");
        var optionEle4 = $("<option></option>").append("---请选择百分比---");
        optionEle1.appendTo("#empAddModal #gradeA_add_input");
        optionEle2.appendTo("#empAddModal #gradeB_add_input");
        optionEle3.appendTo("#empAddModal #gradeC_add_input");
        optionEle4.appendTo("#empAddModal #gradeD_add_input");
        for(var i = 0; i<=100; i=i+5){
            var optionEle5 = $("<option></option>").append(i+"%").attr("value",i);
            var optionEle6 = $("<option></option>").append(i+"%").attr("value",i);
            var optionEle7 = $("<option></option>").append(i+"%").attr("value",i);
            var optionEle8 = $("<option></option>").append(i+"%").attr("value",i);
            optionEle5.appendTo("#empAddModal #gradeA_add_input");
            optionEle6.appendTo("#empAddModal #gradeB_add_input");
            optionEle7.appendTo("#empAddModal #gradeC_add_input");
            optionEle8.appendTo("#empAddModal #gradeD_add_input");
        }
        for(var i = 0; i<=100; i=i+5) {
            var optionEle9 = $("<option></option>").append(i + "%").attr("value", i);
            var optionEle10 = $("<option></option>").append(i + "%").attr("value", i);
            var optionEle11 = $("<option></option>").append(i + "%").attr("value", i);
            var optionEle12 = $("<option></option>").append(i + "%").attr("value", i);
            optionEle9.appendTo("#empUpdateModal #gradeA_update_input");
            optionEle10.appendTo("#empUpdateModal #gradeB_update_input");
            optionEle11.appendTo("#empUpdateModal #gradeC_update_input");
            optionEle12.appendTo("#empUpdateModal #gradeD_update_input");
        }
        var optionEle13 = $("<option></option>").append(department).attr("value", department);
        optionEle13.appendTo("#empAddModal #gsDepartment_add_input");
        var optionEle14 = $("<option></option>").append(department).attr("value", department);
        optionEle14.appendTo("#empUpdateModal #gsDepartment_update_input");
    });
    //刷新
    $("#topic_btn").click(function () {
        to_page(1);
    });
    //解析显示数据
    function build_topic_table(gradeScales){
        $("#topic_add_btn").attr("add-id",department);
        $("#topic_table tbody").empty();
        for(var i=0;i<gradeScales.length;i++){
            var gradeScaleIdTd = $("<td></td>").append(gradeScales[i].gsId);
            var gradeScaleATd = $("<td></td>").append(gradeScales[i].gradeA);
            var gradeScaleBTd = $("<td></td>").append(gradeScales[i].gradeB);
            var gradeScaleCTd = $("<td></td>").append(gradeScales[i].gradeC);
            var gradeScaleDTd = $("<td></td>").append(gradeScales[i].gradeD);
            var gradeScaleDepartmentTd = $("<td></td>").append(gradeScales[i].gsDepartment);
            var time = timeStamp2String(gradeScales[i].gsTime);
            var gradeScaleTimeTd = $("<td></td>").append(time);
            var statusTd = $("<td></td>");
            var applyBtn = $("<button></button>").addClass("btn btn-primary btn-sm apply_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                .append("申请");
            //为申请按钮添加一个自定义的属性，来表示当前课题id
            applyBtn.attr("apply-id",gradeScales[i].gsId);
            var reApplyBtn = $("<button></button>").addClass("btn btn-primary btn-sm reApply_Btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                .append("重新申请");
            //为重新申请按钮添加一个自定义的属性，来表示当前课题id
            reApplyBtn.attr("reApply-id",gradeScales[i].gsId);
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
               .append("编辑");
            //为编辑按钮添加一个自定义的属性，来表示当前课题id
            editBtn.attr("edit-id",gradeScales[i].gsId);
            var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
            .append("删除");
            //为删除按钮添加一个自定义的属性来表示当前删除的课题id
            delBtn.attr("del-id",gradeScales[i].gsId);
            var btnTd = $("<td></td>");
            if (gradeScales[i].gsStatus === 0)
            {
                statusTd.append("未处理");
                btnTd.append(editBtn).append(delBtn);
            }
            if (gradeScales[i].gsStatus === 1)
            {
                statusTd.append("已同意");
                btnTd.append(editBtn).append(delBtn);
            }
            if (gradeScales[i].gsStatus === 2)
            {
                statusTd.append("已拒绝");
                btnTd.append(editBtn).append(delBtn);
            }
            if (gradeScales[i].gsStatus === 3)
            {
                statusTd.append("已重新申请");
                btnTd.append(editBtn).append(delBtn);
            }
            $("<tr></tr>").append(gradeScaleIdTd)
                .append(gradeScaleATd)
                .append(gradeScaleBTd)
                .append(gradeScaleCTd)
                .append(gradeScaleDTd)
                .append(gradeScaleDepartmentTd)
                .append(gradeScaleTimeTd)
                .append(statusTd)
                .append(btnTd)
                .appendTo("#topic_table tbody");
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
    //点击新增按钮弹出模态框。
    $("#topic_add_btn").click(function(){
        //清除表单数据（表单完整重置（表单的数据，表单的样式））
        reset_form("#empAddModal form");
        //弹出模态框
        $("#empAddModal").modal({
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
    //显示校验结果的提示信息
    function show_validate_msg(ele,status,msg){
        //清除当前元素的校验状态
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if("success"==status){
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        }else if("error" == status){
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }
    //点击添加
    $("#emp_save_btn").click(function(){
        var gradeA = parseInt($("#gradeA_add_input").val());
        var gradeB = parseInt($("#gradeB_add_input").val());
        var gradeC = parseInt($("#gradeC_add_input").val());
        var gradeD = parseInt($("#gradeD_add_input").val());
        var sum = gradeA + gradeB +gradeC + gradeD;
        alert(sum);
        if(sum === 100){
            $.ajax({
                url:"${pageContext.request.contextPath}/gradeScale/add/"+department,
                type:"POST",
                data:$("#empAddModal form").serialize(),
                success:function(result){
                    if(result.code == 100){
                        $("#empAddModal").modal('hide');
                        to_page(total);
                    }else{
                        alert("添加失败！");
                    }
                }
            });
        } else {
            show_validate_msg("#gradeD_add_input", "error", "错误，四部分成绩比例和应为100%!请重更新输入");
        }
    });
    //获得详细信息
    function getEmp(gsId){
        $.ajax({
            url:"${pageContext.request.contextPath}/gradeScale/detail/"+gsId,
            type:"GET",
            success:function(result){
                var gradeScale = result.extend.gradeScale;
                $("#id_update").val(gradeScale.gsId);
                $("#gradeA_update_input").val(gradeScale.gradeA);
                $("#gradeB_update_input").val(gradeScale.gradeB);
                $("#gradeC_update_input").val(gradeScale.gradeC);
                $("#gradeD_update_input").val(gradeScale.gradeD);
                $("#gsDepartment_update_input").val(gradeScale.gsDepartment);
            }
        });
    }
    //点击编辑，弹出编辑弹窗
    $(document).on("click",".edit_btn",function(){
        getEmp($(this).attr("edit-id"));
        $("#emp_update_btn").attr("upd-id",$(this).attr("edit-id"));
        $("#empUpdateModal").modal({
            backdrop:"static"
        });
    });
    //点击修改
    $("#emp_update_btn").click(function(){
        var gradeA = parseInt($("#gradeA_update_input").val());
        var gradeB = parseInt($("#gradeB_update_input").val());
        var gradeC = parseInt($("#gradeC_update_input").val());
        var gradeD = parseInt($("#gradeD_update_input").val());
        var sum = gradeA + gradeB +gradeC + gradeD;
        alert(sum);
        if(sum === 100){
        $.ajax({
            url:"${pageContext.request.contextPath}/gradeScale/upd/"+$(this).attr("upd-id"),
            type:"PUT",
            data:$("#empUpdateModal form").serialize(),
            success:function(result){
                alert(result.msg);
                //1、关闭对话框
                $("#empUpdateModal").modal("hide");
                //2、回到本页面
                to_page(pageNum);
            }
        });
        } else {
            show_validate_msg("#gradeD_update_input", "error", "错误，四部分成绩比例和应为100%!请重更新输入");
        }
    });
    //单个删除
    $(document).on("click",".delete_btn",function(){
        var gsId = $(this).attr("del-id");
        if(confirm("确认删除【"+gsId+"】吗？")){
            $.ajax({
                url:"${pageContext.request.contextPath}/gradeScale/del/"+gsId,
                type:"DELETE",
                success:function(result){
                    alert(result.msg);
                    to_page(pageNum);
                }
            });
        }
    });
</script>
</body>
</html>

