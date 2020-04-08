package edu.zzti.controller;

import edu.zzti.bean.Msg;
import edu.zzti.bean.Teacher;
import edu.zzti.service.TeacherService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

@Controller
public class LoginController {

    private final TeacherService teacherService;

    public LoginController(TeacherService teacherService) {
        this.teacherService = teacherService;
    }

    @RequestMapping("/index")
    public ModelAndView index(Integer tno, String password,HttpSession session){
        System.out.println(tno+"-"+password);
        if(teacherService.countTeacher(tno,password)>0){
            Teacher teacher=teacherService.selectTeacherByTno(tno);
            if(teacher.getStatus()==0){
                //return Msg.fail().add("登录失败","账号状态异常，请联系管理员");
                return new ModelAndView("login");
            }else {
                //out.println("<script type='text/javascript'>location='/teacher/t_index';</script>");
                session.setAttribute("teacher", teacher);
                System.out.println("index--教师登录"+teacher);
                //return Msg.success().add("teacher", teacher);
                return new ModelAndView("teacher/t_index","teacher",teacher);
            }
        }else{
            //return Msg.fail().add("登录失败","账号密码不匹配，请重新输入");
            return new ModelAndView("login");
        }
    }
    //退出
    @RequestMapping("/teacherLogout")
    public Msg logout(HttpSession session, HttpServletResponse response) throws Exception {
        Teacher e=(Teacher)session.getAttribute("teacher");
        session.invalidate();
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out=response.getWriter();
        out.println("<script>alert('您的账号已安全退出！');location='login.jsp';</script>");
        return Msg.success();
    }
}