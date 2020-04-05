function loadTeacher() {
    $("#main_page").load("../jsp/teacher.jsp",function(){ $("#main_page").fadeIn(100);
    });
}
function loadIndex(){
    $("#main_page").load("../jsp/index.jsp",function(){ $("#main_page").fadeIn(100);
    });
}
/*function openPersonMessage(){
    document.getElementById('personMessage').style.display='block';
    document.getElementById('passwordRevise').style.display='none';
}*/
/*
function openPasswordRevise(){
    document.getElementById('personMessage').style.display='none';
    document.getElementById('passwordRevise').style.display='block';
}*/
