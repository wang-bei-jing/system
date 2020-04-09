
package edu.zzti.controller;

import edu.zzti.bean.Student;
import edu.zzti.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

@Controller
public class StudentController {
    @Autowired
    StudentService studentService;

    @ResponseBody
    @RequestMapping("/studentLogin")
    public ModelAndView studentLogin(HttpServletRequest request, String sno, String password){
        /*System.out.println(sno+"-"+password);*/

        if(studentService.studentLogin(sno,password)>0){
            //通过登录名sno查对象
            Student student=studentService.studentFindBySno(sno);
            /*System.out.println(student.toString());*/

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











}

