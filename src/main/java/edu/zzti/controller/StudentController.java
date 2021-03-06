
package edu.zzti.controller;

import edu.zzti.bean.Student;
import edu.zzti.bean.StudentComment;
import edu.zzti.bean.TimeManger;
import edu.zzti.service.StudentCommentService;
import edu.zzti.service.StudentService;
import edu.zzti.service.TimeMangerService;
import edu.zzti.service.TopicSelectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
public class StudentController {
    @Autowired
    StudentService studentService;
    @Autowired
    TimeMangerService timeMangerService;
    @Autowired
    StudentCommentService studentCommentService;
    @Autowired
    TopicSelectService topicSelectService;
    @ResponseBody
    @RequestMapping("/studentLogin")
    public ModelAndView studentLogin(HttpServletRequest request, String sno, String password){
        /*System.out.println(sno+"-"+password);*/

        if(studentService.studentLogin(sno,password)>0){
            //通过登录名sno查对象
            Student student=studentService.studentFindBySno(sno);
            //显示选题时间和做判断
            Integer categoty=2;
            TimeManger tpsTimeManger=timeMangerService.findTimeMangerByCategory(categoty);
            request.getSession().setAttribute("tpsTimeManger",tpsTimeManger);

            request.getSession().setAttribute("student", student);
            return new ModelAndView("student/index");

        }else{
            return new ModelAndView("login","error","账号或者密码错误");

        }
    }
    @ResponseBody
    @RequestMapping(value="/studentInfoRevise",method= RequestMethod.POST)
    public ModelAndView studentInfoRevise(HttpServletRequest request, @RequestParam  String sno,@RequestParam String name,@RequestParam String tel,@RequestParam String sex,@RequestParam String department,@RequestParam String classes,@RequestParam String email){
        System.out.println(sno+"-"+name+"-"+tel);
        HashMap map=new HashMap();
        map.put("sno",sno);
        map.put("name",name);
        map.put("tel",tel);
        map.put("sex",sex);
        map.put("department",department);
        map.put("classes",classes);
        map.put("email",email);
        studentService.studentUpdateByAll(map);
        Student student=studentService.studentFindBySno(sno);
        System.out.println(student.toString());
        request.getSession().setAttribute("student", student);
        return new ModelAndView("student/studentpersonal");
    }
    @ResponseBody
    @RequestMapping(value="/studentPasswordRevise",method= RequestMethod.POST)
    public ModelAndView studentPasswordRevise(HttpServletRequest request,@RequestParam String oldPassword, @RequestParam String newPassword, @RequestParam String sno){

        System.out.println(sno+"-"+oldPassword+"-"+newPassword);
        Student studenting=studentService.studentFindBySno(sno);
        System.out.println(studenting.getPassword());
        if(oldPassword.equals(studenting.getPassword())){
            System.out.println("----------------------------");
            studentService.studentUpdatePassword(sno, newPassword);
            Student student=studentService.studentFindBySno(sno);
            System.out.println(student.getPassword());
            request.getSession().setAttribute("student", student);
            return new ModelAndView("student/studentpersonal");
        }
        else {
            Student student=studentService.studentFindBySno(sno);
            request.getSession().setAttribute("student", student);
            return new ModelAndView("student/studentpersonal","passworderror","旧密码不正确");

        }
    }

//=====================================提问================================================
    @ResponseBody
    @RequestMapping(value = "/findAllCommentsBySnoAndStatus")
    public ModelAndView findAllCommentsBySnoAndStatus(String sno, Model model){
        //查询出tpsId 以便新建提问的时候存入数据库
        String status="1";
        Integer tpsId=topicSelectService.findTpsId(sno,status);
        List<StudentComment> topCommentList=studentCommentService.findTopCommentsBySno(sno);


        List<StudentComment> studentCommentList=studentCommentService.findAllCommentsBySnoAndStatus(sno);
        for (int i=0;i<studentCommentList.size();i++){
            System.out.println(studentCommentList.get(i).toString());
        }

        model.addAttribute("topCommentList",topCommentList);
        model.addAttribute("studentCommentList",studentCommentList);
        model.addAttribute("stutpsId",tpsId);
        return new ModelAndView("student/ask");
    }

    @ResponseBody
    @RequestMapping(value = "/addComment")
    public ModelAndView addComment(StudentComment studentComment,String sno){
        int i=studentCommentService.insertSelective(studentComment);
        System.out.println(i);
        return new ModelAndView("redirect:/findAllCommentsBySnoAndStatus?sno="+sno);
    }










}

