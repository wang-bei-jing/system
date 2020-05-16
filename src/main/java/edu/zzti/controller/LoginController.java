package edu.zzti.controller;

import edu.zzti.bean.Teacher;
import edu.zzti.service.TeacherService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/teacher")
public class LoginController {

    private final TeacherService teacherService;

    public LoginController(TeacherService teacherService) {
        this.teacherService = teacherService;
    }

    @RequestMapping("/login")
    public ModelAndView index(HttpServletRequest request, Integer tno, String password){
        System.out.println(tno+"-"+password);
        if(teacherService.countTeacher(tno,password)>0){
            Teacher teacher=teacherService.selectTeacherByTno(tno);
            request.getSession().setAttribute("teacher", teacher);
            return new ModelAndView("teacher/t_index");
        }else{
            return new ModelAndView("login","error","账号或者密码错误");
        }
    }
}