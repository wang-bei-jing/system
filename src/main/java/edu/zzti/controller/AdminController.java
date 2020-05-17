
package edu.zzti.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import edu.zzti.bean.*;
import edu.zzti.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
    * @Description ：查询教师，可以全查也可以模糊查询
    **/
    @ResponseBody
    @RequestMapping("/teacherSelectByName")
    public ModelAndView teacherSelectByName(HttpServletRequest request,@RequestParam(value = "pn", defaultValue = "1") Integer pn,@RequestParam(value = "name", defaultValue = "") String name) {
        PageHelper.startPage(pn, 5);
        List<Teacher> teacherList=teacherService.selectAllTeacherByName(name);
        for (int i=0;i<teacherList.size();i++){
            System.out.println(teacherList.get(i).toString());
        }

        PageInfo page = new PageInfo(teacherList, 5);
        request.setAttribute("teacherList",page);
        request.setAttribute("teachername",name);

        return  new ModelAndView("admin/teacher");
    }
    /**
     * @Author ：shc
     * @Description ：通过id查询教师
     **/
    @RequestMapping("/findOneTeacherByTno")
    public ModelAndView findOneTeacherByTno(HttpServletRequest request,@RequestParam(value = "pn", defaultValue = "1") Integer pn,Integer tno) {
        PageHelper.startPage(pn, 5);
        List<Teacher> teacherList=teacherService.findOneTeacherByTno(tno);
        PageInfo page = new PageInfo(teacherList, 5);
        request.setAttribute("teacherList",page);
        request.setAttribute("teachertno",tno);
        return  new ModelAndView("admin/teacher");
    }

    /**
     * @Author ：shc
     * @Description ：删除单个教师
     **/
    @RequestMapping("/teacherDel")
    public ModelAndView TopicSelectDel(Integer tno){
        System.out.println("111111111"+tno);
        Integer i=0;
        i=teacherService.deleteTeacherByTno(tno);
        System.out.println(i);
        return new ModelAndView("redirect:/teacherSelectByName");
    }
    /**
     * @Author ：shc
     * @Description ：单个添加教师
     **/
    @ResponseBody
    @PostMapping("/addTeacher")
    public ModelAndView addTeacher(Teacher teacher){
        System.out.println(teacher);
        int i=0;
        i=teacherService.addteacher(teacher);
        System.out.println("添加成了吗"+i);
        return new ModelAndView("redirect:/teacherSelectByName");
    }
    /**
     * @Author ：shc
     * @Description ：通过工号查询教师，返回一个对象到ajax，查过去做修改模态框的数据保持
     **/
    @ResponseBody
    @PostMapping("/selectTeacherByTno")
    public Teacher selectTeacherByTno(int tno){
       Teacher oneteacher=teacherService.selectTeacherByTno(tno);
        System.out.println(oneteacher);
        return oneteacher;
    }
    /**
     * @Author ：shc
     * @Description ：更新修改后的教师信息
     **/
    @ResponseBody
    @PostMapping("/updateTeacher")
    public ModelAndView updateTeacher(HttpServletRequest request, Teacher teacher){
        System.out.println("新的"+teacher);
        int i=teacherService.updateTeacher(teacher);
        System.out.println(i);
        return new ModelAndView("redirect:/teacherSelectByName");
    }
    //-------------------------------------学生部分----------------------------------------------------

   /**
    * @Author ：shc
    * @Description ：查询学生信息，可以全查也可以模糊查询
    **/
    @ResponseBody
    @RequestMapping("/studentSelectByName")
    public ModelAndView studentSelectByName(HttpServletRequest request,@RequestParam(value = "pn", defaultValue = "1") Integer pn,@RequestParam(value = "name", defaultValue = "")String name) {
        PageHelper.startPage(pn, 5);
        System.out.println(name);
        List<Student> studentList=studentService.findAllStudentByName(name);
        System.out.println(studentList.size());
        PageInfo page = new PageInfo(studentList, 5);
        request.setAttribute("studentList",page);
        request.setAttribute("studentname",name);
        return  new ModelAndView("admin/student");
    }
    /**
     * @Author ：shc
     * @Description ：通过id查询学生
     **/
    @RequestMapping("/findOneStudentBySno")
    public ModelAndView findOneStudentBySno(HttpServletRequest request,@RequestParam(value = "pn", defaultValue = "1") Integer pn,String sno) {
        PageHelper.startPage(pn, 5);
        List<Student> studentList=studentService.findOneStudentBySno(sno);
        PageInfo page = new PageInfo(studentList, 5);
        request.setAttribute("studentList",page);
        request.setAttribute("studentsno",sno);
        return  new ModelAndView("admin/student");
    }
    /**
     * @Author ：shc
     * @Description ：删除学生
     **/
    @RequestMapping("/studentDel")
    public ModelAndView studentDel(String sno){
        System.out.println("111111111+"+sno);
        int i=0;
        i=studentService.studentDel(sno);
        System.out.println(i);

        return new ModelAndView("redirect:/studentSelectByName");
    }
    /**
     * @Author ：shc
     * @Description ：添加学生
     **/
    @ResponseBody
    @PostMapping("/studentAdd")
    public ModelAndView studentAdd(Student student){
        System.out.println(student);
        int i=0;
        i=studentService.studentAdd(student);
        System.out.println("添加成了吗"+i);
        return new ModelAndView("redirect:/studentSelectByName");
    }
    /**
     * @Author ：shc
     * @Description ：通过学号查询学生，返回一个对象到ajax，查过去做修改模态框的数据保持
     **/
    @ResponseBody
    @PostMapping("/studentSelectBySno")
    public Student studentSelectByTno(String sno){
        Student onestudent=studentService.studentFindBySno(sno);
        System.out.println(onestudent);
        return onestudent;
    }
   /**
    * @Author ：shc
    * @Description ：更新修改后的学生信息
    **/
    @ResponseBody
    @PostMapping("/studentUpd")
    public ModelAndView studentUpd(HttpServletRequest request, Student student){
        System.out.println("新的"+student);
        int i=studentService.studentUpdSelective(student);
        System.out.println(i);
        return new ModelAndView("redirect:/studentSelectByName");
    }
    //=====================================课题管理================================================

   /**
    * @Author ：shc
    * @Description ：查询全部课题，也支持模糊查询
    **/
    @ResponseBody
    @RequestMapping(value = "/adminTopicSelectByName")
    public ModelAndView TopicSelectByCname(HttpServletRequest request,@RequestParam(value = "name", defaultValue = "") String name, @RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 5);
        List<Topic> topics = topicService.selectByName(name);
        System.out.println(topics.size());
        for (int i = 0; i < topics.size(); i++) {
            System.out.println(topics.get(i).toString());
        }
        System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
        PageInfo page = new PageInfo(topics, 5);
        System.out.println(page.getPageSize());
        request.setAttribute("topicname", name);
        request.setAttribute("topicList", page);
        return new ModelAndView("admin/admintopic");
    }

   /**
    * @Author ：shc
    * @Description ：查询已选课题学生信息及其课题信息，也支持模糊查询
    **/
    @ResponseBody
    @RequestMapping(value = "/adminFindAllStudentAndTopicAndTeacherByName")
    public ModelAndView adminFindAllStudentAndTopicAndTeacherByName(HttpServletRequest request,@RequestParam(value = "name", defaultValue = "") String name, @RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 5);
        String status="1";
        List<TopicSelect> topicSelectList=topicSelectService.adminFindAllStudentAndTopicAndTeacherByName(name,status);
        System.out.println(topicSelectList.size());
        for (int i = 0; i < topicSelectList.size(); i++) {
            System.out.println(topicSelectList.get(i).toString());
        }
        PageInfo page = new PageInfo(topicSelectList, 5);
        request.setAttribute("studentname", name);
        request.setAttribute("sttList", page);
        return new ModelAndView("admin/adminstudentselect");
    }
    /**
     * @Author ：shc
     * @Description ：通过id查询已选课题学生的信息
     **/
    @RequestMapping(value = "/findOneStudentWithTopicAndTeacherBySno")
    public ModelAndView findOneStudentWithTopicAndTeacherBySno(HttpServletRequest request,@RequestParam(value = "sno") String sno, @RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 5);
        String status="1";
        List<TopicSelect> topicSelectList=topicSelectService.findOneStudentWithTopicAndTeacherBySno(sno,status);
        System.out.println(topicSelectList.size());
        for (int i = 0; i < topicSelectList.size(); i++) {
            System.out.println(topicSelectList.get(i).toString());
        }
        PageInfo page = new PageInfo(topicSelectList, 5);
        request.setAttribute("studentsno", sno);
        request.setAttribute("sttList", page);
        return new ModelAndView("admin/adminstudentselect");
    }

   /**
    * @Author ：shc
    * @Description ：查询未选题学生信息，也支持模糊查询
    **/
    @ResponseBody
    @RequestMapping(value = "/adminFindAllStudentNOTSELECTByName")
    public ModelAndView adminFindAllStudentNOTSELECTByName(HttpServletRequest request,@RequestParam(value = "name", defaultValue = "") String name, @RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 5);
        String status="0";
        List<Student> studentList=studentService.findAllStudentByStatusAndName(status,name);
        for (int i = 0; i < studentList.size(); i++) {
            System.out.println(studentList.get(i).toString());
        }
        PageInfo page = new PageInfo(studentList, 5);
        request.setAttribute("studentname", name);
        request.setAttribute("studentList",page);
        return new ModelAndView("admin/adminstudentnotselect");
    }
    /**
     * @Author ：shc
     * @Description ：通过学号查询单个未选课学生信息
     **/
    @RequestMapping(value = "/findOneStudentNOTSELECTBySno")
    public ModelAndView findOneStudentNOTSELECTBySno(HttpServletRequest request,@RequestParam(value = "sno") String sno, @RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 5);
        String status="0";
        List<Student> studentList=studentService.findAllStudentByStatusAndSno(status,sno);
        for (int i = 0; i < studentList.size(); i++) {
            System.out.println(studentList.get(i).toString());
        }
        PageInfo page = new PageInfo(studentList, 5);
        request.setAttribute("studentsno", sno);
        request.setAttribute("studentList",page);
        return new ModelAndView("admin/adminstudentnotselect");
    }
    /**
     * @Author ：shc
     * @Param ：
     * @Return ：
     * @Date ：2020/4/25
     * @Description ：学生选题时间的管理
     **/
    @RequestMapping(value = "/timeMangerFind")
    public ModelAndView timeMangerFind(HttpServletRequest request){
        Integer categoty=2;
        TimeManger tpsTimeManger=timeMangerService.findTimeMangerByCategory(categoty);
        System.out.println(tpsTimeManger);
            if (tpsTimeManger!=null){
                Date begintime=tpsTimeManger.getTiBegin();
                Date endtime=tpsTimeManger.getTiEnd();
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm");
                String begintimestr=dateFormat.format(begintime);
                String endtimestr=dateFormat.format(endtime);
                begintimestr=begintimestr.replace(" ","T");
                endtimestr=endtimestr.replace(" ","T");
                request.setAttribute("begintimestr",begintimestr);
                request.setAttribute("endtimestr",endtimestr);
            }
        request.setAttribute("tpsTimeManger",tpsTimeManger);
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
        return new ModelAndView("redirect:/timeMangerFind");
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
        return new ModelAndView("redirect:/timeMangerFind");
    }
    @ResponseBody
    @RequestMapping(value = "/timeMangerDel")
    public ModelAndView timeMangerDel(int tiId)  {
        int i=timeMangerService.deleteByPrimaryKey(tiId);
        System.out.println(i);
        return new ModelAndView("redirect:/timeMangerFind");
    }
//=====================================成绩管理================================================
    /**
     * @Author ：shc
     * @Description ：查询所有学生的成绩
     **/
    @ResponseBody
    @RequestMapping(value = "/adminGradeSelectAll")
    public ModelAndView adminGradeSelectAll(HttpServletRequest request,@RequestParam(value = "min", defaultValue = "0")Integer min,@RequestParam(value = "max", defaultValue = "101")Integer max, @RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 5);
        List<Grade> studentsGrades=gradeService.findStudentGradeByBoundary(min,max);
        System.out.println(studentsGrades.size());
        for (int i = 0; i < studentsGrades.size(); i++) {
            System.out.println(studentsGrades.get(i).toString());
        }

        PageInfo page = new PageInfo(studentsGrades, 5);
        request.setAttribute("studentsGrades", page);

        return new ModelAndView("admin/admingrade");
    }
    /**
     * @Author ：shc
     * @Description ：根据学号查学生成绩
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
        request.setAttribute("studentsGrades", page);
        request.setAttribute("admingradesno", sno);
        request.setAttribute("studentsGradesSize", studentsGradesSize);
        return new ModelAndView("admin/admingrade");
    }
  /**
   * @Author ：shc
   * @Description ：根据老师的名字查其学生成绩。
   **/
    @ResponseBody
    @RequestMapping(value = "/adminGradeFindByTeacherName")
    public ModelAndView adminGradeFindByTeacherName(HttpServletRequest request,String tname, @RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 5);
        List<Grade> studentsGrades=gradeService.adminGradeFindByTeacherName(tname);
        System.out.println(studentsGrades.size());
        int studentsGradesSize=studentsGrades.size();
        System.out.println(studentsGradesSize);
        PageInfo page = new PageInfo(studentsGrades, 5);
        request.setAttribute("studentsGrades", page);
        request.setAttribute("admingradeteachername", tname);
        request.setAttribute("studentsGradesSize", studentsGradesSize);
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
       request.setAttribute("gradeScaleApplys",gradeScaleApplys);
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

