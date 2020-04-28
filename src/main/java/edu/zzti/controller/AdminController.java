
package edu.zzti.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import edu.zzti.bean.*;
import edu.zzti.dao.TimeMangerMapper;
import edu.zzti.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;


@Controller
public class AdminController {
    @Autowired
    AdminService adminService;
    @Autowired
    TeacherService teacherService;
    @Autowired
    StudentService studentService;
    @Autowired
    TopicService topicService;
    @Autowired
    TopicSelectService topicSelectService;
    @Autowired
    GradeService gradeService;
    @Autowired
    GradeScaleService gradeScaleService;
    @Autowired
    TimeMangerService timeMangerService;
    //-----------------------------------------管理员登录，修改密码--------------------------------
    @ResponseBody
    @RequestMapping("/adminLogin")
    public ModelAndView adminLogin(HttpServletRequest request, String loginname, String password){
        System.out.println(loginname+"-"+password);
        HashMap map=new HashMap();
        map.put("loginname",loginname);
        map.put("password",password);
        System.out.println(map);
        if(adminService.adminLogin(map)>0){
            Admin admin=adminService.adminFindByLoginname(loginname);
            /* System.out.println(student.toString());*/
            request.getSession().setAttribute("admin", admin);
            return new ModelAndView("admin/adminindex");

        }else{
            return new ModelAndView("login","error","账号或者密码错误");
        }
    }

    @ResponseBody
    @PostMapping("/adminPasswordRevise")
    public ModelAndView adminPasswordRevise(HttpServletRequest request,@RequestParam String loginname, @RequestParam String newPassword, @RequestParam String oldPassword){

        System.out.println(loginname+"-"+oldPassword+"-"+newPassword);
        Admin admining=adminService.adminFindByLoginname(loginname);

        System.out.println(admining.getPassword());
        if(oldPassword.equals(admining.getPassword())){
            System.out.println("----------------------------");
            adminService.adminUpdatePassword(loginname, newPassword);

            Admin admin=adminService.adminFindByLoginname(loginname);
            request.getSession().setAttribute("admin", admin);
            return new ModelAndView("admin/adminpersonal");
        }
        else {
            Admin admin=adminService.adminFindByLoginname(loginname);
            request.getSession().setAttribute("admin", admin);
            return new ModelAndView("admin/adminpersonal","passworderror","旧密码不正确");

        }
    }

    //-----------------------------------------教师部分--------------------------------
   /**
    * @Author ：shc
    * @Param ：
    * @Return ：teacherList
    * @Date ：2020/4/10
    * @Description ：查询所有教师
    **/
    @ResponseBody
    @RequestMapping("/teacherSelectAll")
    public ModelAndView teacherSelectAll(HttpServletRequest request,@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 5);
        System.out.println("进入");
        List<Teacher> teacherList=teacherService.finAllTeacher();
        for(int i=0;i<teacherList.size();i++){
            System.out.println(teacherList.toString());
        }
        PageInfo page = new PageInfo(teacherList, 5);
        request.getSession().setAttribute("teacherList",page);
        return  new ModelAndView("admin/teacher");
    }
   /**
    * @Author ：shc
    * @Param ：教师的name
    * @Return ：根据教师name模糊查询的teacherList
    * @Date ：2020/4/10
    * @Description ：
    **/
    @ResponseBody
    @PostMapping("/teacherSelectByName")
    public ModelAndView teacherSelectByName(HttpServletRequest request,@RequestParam(value = "pn", defaultValue = "1") Integer pn,String name) {
        PageHelper.startPage(pn, 5);
        List<Teacher> teacherList=teacherService.selectAllTeacherByName(name);
        PageInfo page = new PageInfo(teacherList, 5);
        request.getSession().setAttribute("teacherList",page);
        request.getSession().setAttribute("teachername",name);
        return  new ModelAndView("admin/teacher");
    }
    @RequestMapping("/teacherDel")
    public ModelAndView TopicSelectDel(Integer tno){
        System.out.println("111111111"+tno);
        Integer i=0;
        i=teacherService.deleteTeacherByTno(tno);
        System.out.println(i);
        return new ModelAndView("redirect:/teacherSelectAll");
    }
    /**
     * @Author ：shc
     * @Param ：teacher
     * @Return ：添加成功，返回页面
     * @Date ：2020/4/11
     * @Description ：
     **/
    @ResponseBody
    @PostMapping("/addTeacher")
    public ModelAndView addTeacher(Teacher teacher){
        System.out.println(teacher);
        int i=0;
        i=teacherService.addteacher(teacher);
        System.out.println("添加成了吗"+i);
        return new ModelAndView("redirect:/teacherSelectAll");
    }
    /**
     * @Author ：shc
     * @Param ：教师的工号tno
     * @Return ：teacher对象
     * @Date ：2020/4/11
     * @Description ：
     **/
    @ResponseBody
    @PostMapping("/selectTeacherByTno")
    public Teacher selectTeacherByTno(HttpServletRequest request, int tno){
       Teacher oneteacher=teacherService.selectTeacherByTno(tno);
        System.out.println(oneteacher);

    /*   request.getSession().setAttribute("oneteacher",oneteacher);*/
    /*  request.setAttribute("oneteacher",oneteacher);*/
        return oneteacher;
    }
    /**
     * @Author ：shc
     * @Param ：teacher
     * @Return ：更新后跳转页面
     * @Date ：2020/4/12
     * @Description ：
     **/
    @ResponseBody
    @PostMapping("/updateTeacher")
    public ModelAndView updateTeacher(HttpServletRequest request, Teacher teacher){
        System.out.println("新的"+teacher);
        int i=teacherService.updateTeacher(teacher);
        System.out.println(i);

        /*   request.getSession().setAttribute("oneteacher",oneteacher);*/
        /*  request.setAttribute("oneteacher",oneteacher);*/
        return new ModelAndView("redirect:/teacherSelectAll");
    }
    //-------------------------------------学生部分----------------------------------------------------
    /**
     * @Author ：shc
     * @Param ：
     * @Return ：teacherList
     * @Date ：2020/4/10
     * @Description ：查询所有教师
     **/
    @ResponseBody
    @RequestMapping("/studentSelectAll")
    public ModelAndView studentSelectAll(HttpServletRequest request,@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 5);
        List<Student> studentList=studentService.findAllStudent();
        for(int i=0;i<studentList.size();i++){
            System.out.println(studentList.toString());
        }
        PageInfo page = new PageInfo(studentList, 5);
        request.getSession().setAttribute("studentList",page);
        return  new ModelAndView("admin/student");
    }
    /**
     * @Author ：shc
     * @Param ：教师的name
     * @Return ：根据教师name模糊查询的teacherList
     * @Date ：2020/4/10
     * @Description ：
     **/
    @ResponseBody
    @PostMapping("/studentSelectByName")
    public ModelAndView studentSelectByName(HttpServletRequest request,@RequestParam(value = "pn", defaultValue = "1") Integer pn,String name) {
        PageHelper.startPage(pn, 5);
        System.out.println(name);
        List<Student> studentList=studentService.findAllStudentByName(name);
        System.out.println(studentList.size());
        PageInfo page = new PageInfo(studentList, 5);
        request.getSession().setAttribute("studentList",page);
        request.getSession().setAttribute("studentname",name);
        return  new ModelAndView("admin/student");
    }
    @RequestMapping("/studentDel")
    public ModelAndView studentDel(String sno){
        System.out.println("111111111+"+sno);
        int i=0;
        i=studentService.studentDel(sno);
        System.out.println(i);

        return new ModelAndView("redirect:/studentSelectAll");
    }
    @ResponseBody
    @PostMapping("/studentAdd")
    public ModelAndView studentAdd(Student student){
        System.out.println(student);
        int i=0;
        i=studentService.studentAdd(student);
        System.out.println("添加成了吗"+i);
        return new ModelAndView("redirect:/studentSelectAll");
    }
    /**
     * @Author ：shc
     * @Param ：sno
     * @Return ：student对象
     * @Date ：2020/4/11
     * @Description ：查过去做数据保持
     **/
    @ResponseBody
    @PostMapping("/studentSelectBySno")
    public Student studentSelectByTno(HttpServletRequest request, String sno){
        Student onestudent=studentService.studentFindBySno(sno);
        System.out.println(onestudent);

        /*   request.getSession().setAttribute("oneteacher",oneteacher);*/
        /*  request.setAttribute("oneteacher",oneteacher);*/
        return onestudent;
    }
    /**
     * @Author ：shc
     * @Param ：student
     * @Return ：更新后跳转页面
     * @Date ：2020/4/12
     * @Description ：
     **/
    @ResponseBody
    @PostMapping("/studentUpd")
    public ModelAndView studentUpd(HttpServletRequest request, Student student){
        System.out.println("新的"+student);
        int i=studentService.studentUpdSelective(student);
        System.out.println(i);

        /*   request.getSession().setAttribute("oneteacher",oneteacher);*/
        /*  request.setAttribute("oneteacher",oneteacher);*/
        return new ModelAndView("redirect:/studentSelectAll");
    }
    //=====================================课题管理================================================
    /**
     * @Author ：shc
     * @Param ：
     * @Return ：topicList返回到admintopic
     * @Date ：2020/4/13
     * @Description ：
     **/
    @ResponseBody
    @RequestMapping(value = "/adminTopicSelectAll")
    public ModelAndView adminTopicSelectAll(HttpServletRequest request, @RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 5);
        List<Topic> topics = topicService.selectAll();
        System.out.println(topics.size());
        for (int i = 0; i < topics.size(); i++) {
            System.out.println(topics.get(i).toString());
            System.out.println(topics.get(i).getTeacher().toString());
        }

        PageInfo page = new PageInfo(topics, 5);
        request.getSession().setAttribute("topicList", page);
        return new ModelAndView("admin/admintopic");
    }
    /**
     * @Author ：shc
     * @Param ：
     * @Return ：
     * @Date ：2020/4/14
     * @Description ：name模糊查询全部选题
     **/
    @ResponseBody
    @RequestMapping(value = "/adminTopicSelectByName")
    public ModelAndView TopicSelectByCname(HttpServletRequest request,String name, @RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 5);
        List<Topic> topics = topicService.selectByName(name);
        System.out.println(topics.size());
        for (int i = 0; i < topics.size(); i++) {
            System.out.println(topics.get(i).toString());
        }
        System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
        PageInfo page = new PageInfo(topics, 5);
        System.out.println(page.getPageSize());
        request.getSession().setAttribute("topicname", name);
        request.getSession().setAttribute("topicList", page);
        return new ModelAndView("admin/admintopic");
    }
    /**
     * @Author ：shc
     * @Param ：
     * @Return ：
     * @Date ：2020/4/13
     * @Description ：已选课题学生及其课题信息
     **/
    @ResponseBody
    @RequestMapping(value = "/adminFindAllStudentAndTopicAndTeacher")
    public ModelAndView adminFindAllStudentAndTopicAndTeacher(HttpServletRequest request, @RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 5);
        String status="1";
        List<TopicSelect> topicSelectList=topicSelectService.adminFindAllStudentAndTopicAndTeacher(status);
        System.out.println(topicSelectList.size());
        for (int i = 0; i < topicSelectList.size(); i++) {
            System.out.println(topicSelectList.get(i).toString());
        }

        PageInfo page = new PageInfo(topicSelectList, 5);
        request.getSession().setAttribute("sttList", page);
        return new ModelAndView("admin/adminstudentselect");
    }
    /**
     * @Author ：shc
     * @Param ：
     * @Return ：
     * @Date ：2020/4/13
     * @Description ：name模糊查询已选课题学生及其课题信息
     **/
    @ResponseBody
    @RequestMapping(value = "/adminFindAllStudentAndTopicAndTeacherByName")
    public ModelAndView adminFindAllStudentAndTopicAndTeacherByName(HttpServletRequest request,@RequestParam String name, @RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 5);
        String status="1";
        List<TopicSelect> topicSelectList=topicSelectService.adminFindAllStudentAndTopicAndTeacherByName(name,status);
        System.out.println(topicSelectList.size());
        for (int i = 0; i < topicSelectList.size(); i++) {
            System.out.println(topicSelectList.get(i).toString());
        }
        PageInfo page = new PageInfo(topicSelectList, 5);
        request.getSession().setAttribute("studentname", name);
        request.getSession().setAttribute("sttList", page);
        return new ModelAndView("admin/adminstudentselect");
    }
    /**
     * @Author ：shc
     * @Param ：
     * @Return ：
     * @Date ：2020/4/14
     * @Description ：未选题学生
     **/
    @ResponseBody
    @RequestMapping(value = "/findAllStudentNotSelect")
    public ModelAndView findAllStudentNotSelect(HttpServletRequest request,@RequestParam(value = "pn", defaultValue = "1") Integer pn){
        PageHelper.startPage(pn, 5);
        String status="0";
        System.out.println("进findAllStudentNotSelect了");
        List<Student> studentList=studentService.findAllStudentByStatus(status);
        for (int i = 0; i < studentList.size(); i++) {
            System.out.println(studentList.get(i).toString());
        }
        PageInfo page = new PageInfo(studentList, 5);
        request.getSession().setAttribute("studentList",page);
        return new ModelAndView("admin/adminstudentnotselect");
    }
    /**
     * @Author ：shc
     * @Param ：
     * @Return ：
     * @Date ：2020/4/14
     * @Description ：name模糊查询未选题学生
     **/
    @ResponseBody
    @RequestMapping(value = "/adminFindAllStudentNOTSELECTByName")
    public ModelAndView adminFindAllStudentNOTSELECTByName(HttpServletRequest request,@RequestParam String name, @RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 5);
        String status="0";
        List<TopicSelect> topicSelectList=topicSelectService.adminFindAllStudentAndTopicAndTeacherByName(name,status);
        System.out.println(topicSelectList.size());
        for (int i = 0; i < topicSelectList.size(); i++) {
            System.out.println(topicSelectList.get(i).toString());
        }
        PageInfo page = new PageInfo(topicSelectList, 5);
        request.getSession().setAttribute("studentname", name);
        request.getSession().setAttribute("studentList",page);
        return new ModelAndView("admin/adminstudentnotselect");
    }
    /**
     * @Author ：shc
     * @Param ：
     * @Return ：
     * @Date ：2020/4/25
     * @Description ：学生选题时间的管理
     **/
    @RequestMapping(value = "/adminTopicSelectTime")
    public ModelAndView adminTopicSelectTime(HttpServletRequest request){
        Integer categoty=2;
        TimeManger tpsTimeManger=timeMangerService.findTimeMangerByCategory(categoty);
        System.out.println(tpsTimeManger);
        request.getSession().setAttribute("tpsTimeManger",tpsTimeManger);
        return new ModelAndView("admin/admintopicselecttime");
    }
    @ResponseBody
    @RequestMapping(value = "/timeMangerAdd")
    public ModelAndView timeMangerAdd(int tiCategory,String tiBegin,String tiEnd) throws ParseException {
        String tiBeginstr=tiBegin.replace("T"," ");
        String tiEndstr=tiEnd.replace("T"," ");
        System.out.println(tiBeginstr);
        Date begintime=new SimpleDateFormat("yyyy-MM-dd hh:mm").parse(tiBeginstr);
        Date endtime=new SimpleDateFormat("yyyy-MM-dd hh:mm").parse(tiEndstr);
        TimeManger timeManger=new TimeManger();
        timeManger.setTiCategory(tiCategory);
        timeManger.setTiBegin(begintime);
        timeManger.setTiEnd(endtime);
        int i=timeMangerService.insertSelective(timeManger);
        System.out.println(i);
        return new ModelAndView("redirect:/adminTopicSelectTime");
    }
    @ResponseBody
    @RequestMapping(value = "/timeMangerUpd")
    public ModelAndView timeMangerUpd(int tiId,int tiCategory,String tiBegin,String tiEnd) throws ParseException {
        String tiBeginstr=tiBegin.replace("T"," ");
        String tiEndstr=tiEnd.replace("T"," ");
        System.out.println(tiBeginstr);
        Date begintime=new SimpleDateFormat("yyyy-MM-dd hh:mm").parse(tiBeginstr);
        Date endtime=new SimpleDateFormat("yyyy-MM-dd hh:mm").parse(tiEndstr);
        TimeManger timeManger=new TimeManger();
        timeManger.setTiId(tiId);
        timeManger.setTiCategory(tiCategory);
        timeManger.setTiBegin(begintime);
        timeManger.setTiEnd(endtime);
        int i=timeMangerService.updateByPrimaryKeySelective(timeManger);
        System.out.println(i);
        return new ModelAndView("redirect:/adminTopicSelectTime");
    }
    @ResponseBody
    @RequestMapping(value = "/timeMangerDel")
    public ModelAndView timeMangerDel(int tiId)  {
        int i=timeMangerService.deleteByPrimaryKey(tiId);
        System.out.println(i);
        return new ModelAndView("redirect:/adminTopicSelectTime");
    }
//=====================================成绩管理================================================
    @ResponseBody
    @RequestMapping(value = "/adminGradeSelectAll")
    public ModelAndView adminGradeSelectAll(HttpServletRequest request,@RequestParam(value = "min", defaultValue = "0")Integer min,@RequestParam(value = "max", defaultValue = "101")Integer max, @RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 5);
        List<Grade> studentsGrades=gradeService.findStudentGradeByBoundary(min,max);
        System.out.println(studentsGrades.size());
        for (int i = 0; i < studentsGrades.size(); i++) {
            System.out.println(studentsGrades.get(i).toString());
        }
        int studentsGradesSize=studentsGrades.size();
        System.out.println(studentsGradesSize);
        PageInfo page = new PageInfo(studentsGrades, 5);
        request.getSession().setAttribute("studentsGrades", page);
        request.getSession().setAttribute("studentsGradesSize", studentsGradesSize);
        return new ModelAndView("admin/admingrade");
    }
    /**
     * @Author ：shc
     * @Date ：2020/4/20
     * @Description ：根据学号查学生成绩，
     **/
    @ResponseBody
    @RequestMapping(value = "/adminGradeFindBySno")
    public ModelAndView adminGradeFindBySno(HttpServletRequest request,String sno,@RequestParam(value = "min", defaultValue = "0")Integer min,@RequestParam(value = "max", defaultValue = "101")Integer max, @RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 5);
        List<Grade> studentsGrades=gradeService.findStudentGradeBySno(sno);
        System.out.println(studentsGrades.size());
        int studentsGradesSize=studentsGrades.size();
        System.out.println(studentsGradesSize);
        PageInfo page = new PageInfo(studentsGrades, 5);
        request.getSession().setAttribute("studentsGrades", page);
        request.getSession().setAttribute("admingradesno", sno);
        request.getSession().setAttribute("studentsGradesSize", studentsGradesSize);
        return new ModelAndView("admin/admingrade");
    }
    /**
     * @Author ：shc
     * @Date ：2020/4/20
     * @Description ：根据老师的名字查学生成绩。
     **/
    @ResponseBody
    @RequestMapping(value = "/adminGradeFindByTeacherName")
    public ModelAndView adminGradeFindByTeacherName(HttpServletRequest request,String tname,@RequestParam(value = "min", defaultValue = "0")Integer min,@RequestParam(value = "max", defaultValue = "101")Integer max, @RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 5);
        List<Grade> studentsGrades=gradeService.adminGradeFindByTeacherName(tname);
        System.out.println(studentsGrades.size());
        int studentsGradesSize=studentsGrades.size();
        System.out.println(studentsGradesSize);
        PageInfo page = new PageInfo(studentsGrades, 5);
        request.getSession().setAttribute("studentsGrades", page);
        request.getSession().setAttribute("admingradeteachername", tname);
        request.getSession().setAttribute("studentsGradesSize", studentsGradesSize);
        return new ModelAndView("admin/admingrade");
    }
    /**
     * @Author ：shc
     * @Date ：2020/4/20
     * @Description ：成绩比例
     **/
    @ResponseBody
    @RequestMapping(value = "/adminGradeScale")
    public ModelAndView adminGradeScale(HttpServletRequest request){

       List<GradeScale> gradeScaleApplys=gradeScaleService.findNewApplyGradeScale();
        System.out.println(gradeScaleApplys.size());
        for (int i=0;i<gradeScaleApplys.size();i++){
            System.out.println(gradeScaleApplys.get(i).toString());
        }
       request.getSession().setAttribute("gradeScaleApplys",gradeScaleApplys);
      return  new ModelAndView("admin/admingradescaleapply");

    }
    @ResponseBody
    @RequestMapping(value = "/adminGradeScaleChange")
    public Integer adminGradeScaleChange(@RequestParam("gsId") Integer gsId,@RequestParam("gsStatus")Integer gsStatus ){
        System.out.println("gsId="+gsId);
        System.out.println("gsStatus="+gsStatus);
        int i=gradeScaleService.updateGradeScaleByIdAndGsStatus(gsId,gsStatus);
        System.out.println(i);
        return i;

    }


}

