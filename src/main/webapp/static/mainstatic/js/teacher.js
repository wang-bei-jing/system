var pageNum,total;

$(document).ready(function() {
    $("#table_page").hide();
    $("#TeacherList", this).click(function () {
        $("#table_page").show();
        to_page(1);
    });
    $("#teacher_add", this).click(function () {
        //弹出模态框
        $("#teacherAdd").modal({
            backdrop: "static"
        });
    });
    $("#emp_save_btn").click(function () {
        var userid= $("#userid1").val();
        var password=$("input[type='password']").attr("password");
        var username=$("#username").val();
        alert(userid+password+username);
        $.get("../teacherList.do",
            {user:{userid:userid,
            password:password,
            username:username}},
            function(data){
            $("#teacherAdd").modal('hide');//关闭模态框
            alert(data.msg);
            to_page(pageNum);
        });
    });
});
function to_page(pn){
    $.get("../teacherList.do",{pn:pn},function(data){
        emps_table(data.map.pageInfo.list);
        build_page_info(data.map.pageInfo);
    });
    pageNum=data.map.pageInfo.pageNum;
    total=data.map.pageInfo.total;
}
/*解析显示数据*/
function emps_table(data){
    $("#emps_table").find("tbody").empty();
    for(var i=0;i<data.length;i++){
        var userid  =$("<td></td>").append(data[i].userid);
        var password=$("<td></td>").append(data[i].password);
        var username=$("<td></td>").append(data[i].username);
        var sex     =$("<td></td>").append(data[i].sex);
        var birthday=$("<td></td>").append(data[i].birthday);
        var department=$("<td></td>").append(data[i].department);
        var identity,status;
        if(data[i].identity===0){
            identity=$("<td></td>").append("教师");
        }else {
            identity=$("<td></td>").append("管理员");
        }
        if(data[i].status===0){
            status=$("<td></td>").append("未审核");
        }else {
            status=$("<td></td>").append("审核通过");
        }
        var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
            .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
        editBtn.attr("edit_id",data[i].userid);
        var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
            .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
        delBtn.attr("del_id",data[i].userid);
        var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
        $("<tr></tr>").append(userid)
            .append(password)
            .append(username)
            .append(sex)
            .append(birthday)
            .append(department)
            .append(identity)
            .append(status)
            .append(btnTd)
            .appendTo("#emps_table tbody");
    }
}
/*解析显示分页信息*/
function build_page_info(data){
    $("#page_info_area").empty();
    $("#page_info_area").append("当前第"+data.pageNum+"页,共"+
        data.pages+"页,总"+ data.total+"条记录");
}
/*弹出修改模块框*/
$(document).on("click",".edit_btn",function(){
    getEmp($(this).attr("edit_id"));
    $("#teacherUpdate").modal({
        backdrop: "static"
    });
});
/*单个删除*/
$(document).on("click",".delete_btn",function(){
    var username = $(this).parents("tr").find("td:eq(2)").text();
    var userid = $(this).parents("tr").find("td:eq(0)").text();
    if(confirm("确认删除【"+username+"】吗？")){
        $.get("../deleteTeacher.do",{userId:userid},function(data){
                alert(data.msg);
                //回到本页
                to_page(pageNum);
        });
    }
});
/*查询教师信息*/
function getEmp(id){
    $.get("../selectTeacher.do",{userId:id},function(result) {
            var data=result.map.user;
            $("#teacherId").text(data.userid);
            $("#teacherPwd").val(data.password);
            $("#userName").val(data.username);
            $("#teacherUpdate").find("input[name=gender]").val([data.sex]);
            $("#birthDay").val(data.brithday);
            $("#department").val(data.department);
    });
}
