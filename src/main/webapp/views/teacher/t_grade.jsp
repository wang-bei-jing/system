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
    <title>我的学生总成绩</title>
</head>
<body>

<!-- BEGIN LOADER -->
<div id="load_screen"> <div class="loader"> <div class="loader-content"> <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 792 723" style="enable-background:new 0 0 792 723;" xml:space="preserve"> <g> <g> <path class="st0" d="M213.9,584.4c-47.4-25.5-84.7-60.8-111.8-106.1C75,433.1,61.4,382,61.4,324.9c0-57,13.6-108.1,40.7-153.3 S166.5,91,213.9,65.5s100.7-38.2,159.9-38.2c49.9,0,95,8.8,135.3,26.3s74.1,42.8,101.5,75.7l-85.5,78.9 c-38.9-44.9-87.2-67.4-144.7-67.4c-35.6,0-67.4,7.8-95.4,23.4s-49.7,37.4-65.4,65.4c-15.6,28-23.4,59.8-23.4,95.4 s7.8,67.4,23.4,95.4s37.4,49.7,65.4,65.4c28,15.6,59.7,23.4,95.4,23.4c57.6,0,105.8-22.7,144.7-68.2l85.5,78.9 c-27.4,33.4-61.4,58.9-102,76.5c-40.6,17.5-85.8,26.3-135.7,26.3C314.3,622.7,261.3,809.9,213.9,584.4z"/> </g> <circle class="st1" cx="375.4" cy="322.9" r="100"/> </g> <g> <circle class="st2" cx="275.4" cy="910" r="65"></circle> <circle class="st4" cx="475.4" cy="910" r="65"></circle> </g> </svg> </div></div></div>
<!--  END LOADER -->

<div class="layout-px-spacing">
    <div class="row layout-top-spacing">
        <div class="col-xl-12 col-lg-12 col-sm-12  layout-spacing">
            <div class="widget-content widget-content-area br-6">
                <div class="modal-header">
                    <h1>我的学生成绩</h1>
                    <div class="row">
                        <div>
                            <button id="grade_btn" class="btn btn-s btn-primary">刷新</button>
                            <button id="all_btn" class="btn btn-s btn-primary">计算总成绩</button>
                            <button type="button" class="btn green" id="excell"  onclick="method5('peaceTime_table')">导出成绩表</button>
                        </div>
                    </div>
                </div>
                <div class="table-responsive mb-4 mt-4">
                    <table class="table table-hover" id="peaceTime_table" >
                        <thead>
                        <tr>
                            <th>学生姓名</th>
                            <th>课题名</th>
                            <th>平时成绩</th>
                            <th>期中答辩成绩</th>
                            <th>验收成绩</th>
                            <th>报告成绩</th>
                            <th>总成绩</th>
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
    function to_page(pn){
        $.ajax({
            url:"${pageContext.request.contextPath}/grade/all/"+tno,
            type:"GET",
            success:function(){
            }
        });
        $.ajax({
            url:"${pageContext.request.contextPath}/grade/student/"+tno,
            data:"pn="+pn,
            type:"GET",
            success:function(result){
                build_peaceTime_table(result.extend.pageInfo.list);
                build_page_info(result.extend.pageInfo);
                build_page_nav(result.extend.pageInfo);
            }
        });
    }
    $(function(){
        to_page(1);
    });
    $("#grade_btn").click(function () {
        to_page(1);
    });
    $("#all_btn").click(function () {
        $.ajax({
            url:"${pageContext.request.contextPath}/grade/all/"+tno,
            type:"GET",
            success:function(){
                alert("计算完成");
                to_page(1);
            }
        });
    });
    //解析显示数据
    function build_peaceTime_table(gradeList){
        $("#peaceTime_add_btn").attr("add-id",tno);
        $("#peaceTime_table tbody").empty();
        for(var i=0;i<gradeList.length;i++){
            var gradeIdTd = $("<td></td>").append(gradeList[i].gId);
            var gradeSNameTd = $("<td></td>").append(gradeList[i].student.name);
            var gradeTpNameTd = $("<td></td>").append(gradeList[i].topic.name);
            var peaceTimeGradeTd = $("<td></td>").append(gradeList[i].gPeacetime);
            var midtermGradeTd = $("<td></td>").append(gradeList[i].gMidterm);
            var checkGradeTd = $("<td></td>").append(gradeList[i].gCheck);
            var presentationGradeTd = $("<td></td>").append(gradeList[i].gPresentation);
            var TotalGradeTd = $("<td></td>").append(gradeList[i].gTotal);
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                .append("编辑");
            //为编辑按钮添加一个自定义的属性，来表示当前记录id
            editBtn.attr("edit-id",gradeList[i].gId);
            var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
                .append("删除");
            //为删除按钮添加一个自定义的属性来表示当前删除的记录id
            delBtn.attr("del-id",gradeList[i].gId);
            var btnTd = $("<td></td>").append(editBtn).append(delBtn);
            $("<tr></tr>").append(gradeSNameTd)
                .append(gradeTpNameTd)
                .append(peaceTimeGradeTd)
                .append(midtermGradeTd)
                .append(checkGradeTd)
                .append(presentationGradeTd)
                .append(TotalGradeTd)
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
    //打印表格
    var idTmr;
    function  getExplorer() {
        var explorer = window.navigator.userAgent ;
        //ie
        if (explorer.indexOf("MSIE") >= 0) {
            return 'ie';
        }
        //firefox
        else if (explorer.indexOf("Firefox") >= 0) {
            return 'Firefox';
        }
        //Chrome
        else if (explorer.indexOf("Chrome") >= 0) {
            return 'Chrome';
        }
        //Opera
        else if (explorer.indexOf("Opera") >= 0) {
            return 'Opera';
        }
        //Safari
        else if (explorer.indexOf("Safari") >= 0) {
            return 'Safari';
        }
    }
    function method5(tableid) {
        if (getExplorer() === 'ie') {
            var curTbl = document.getElementById(tableid);
            var oXL = new ActiveXObject("Excel.Application");
            var oWB = oXL.Workbooks.Add();
            var xlsheet = oWB.Worksheets(1);
            var sel = document.body.createTextRange();
            sel.moveToElementText(curTbl);
            sel.select();
            sel.execCommand("Copy");
            xlsheet.Paste();
            oXL.Visible = true;

            try {
                var fname = oXL.Application.GetSaveAsFilename("Excel.xls",
                    "Excel Spreadsheets (*.xls), *.xls");
            } catch (e) {
                print("Nested catch caught " + e);
            } finally {
                oWB.SaveAs(fname);
                oWB.Close(savechanges = false);
                oXL.Quit();
                oXL = null;
                idTmr = window.setInterval("Cleanup();", 1);
            }

        } else {
            tableToExcel(tableid)
        }
    }
    function Cleanup() {
        window.clearInterval(idTmr);
        CollectGarbage();
    }
    var tableToExcel = (function() {
        var uri = 'data:application/vnd.ms-excel;base64,', template = '<html><head><meta charset="UTF-8"></head><body><table  border="1">{table}</table></body></html>', base64 = function(
            s) {
            return window.btoa(unescape(encodeURIComponent(s)))
        }, format = function(s, c) {
            return s.replace(/{(\w+)}/g, function(m, p) {
                return c[p];
            })
        };
        return function(table, name) {
            if (!table.nodeType)
                table = document.getElementById(table);
            var ctx = {
                worksheet : name || 'Worksheet',
                table : table.innerHTML
            };
            window.location.href = uri + base64(format(template, ctx))
        }
    })()
</script>
</body>
</html>

