
package edu.zzti.controller;

import edu.zzti.bean.Admin;
import edu.zzti.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

@Controller
public class AdminController {
    @Autowired
    AdminService adminService;
    @ResponseBody
    @RequestMapping("/adminLogin")
    public ModelAndView adminLogin(HttpServletRequest request, String loginname, String password){
        System.out.println(loginname+"-"+password);
        HashMap map=new HashMap();
        map.put("loginname",loginname);
        map.put("password",password);
        if(adminService.adminLogin(map)>0){
            Admin admin=adminService.adminFindByLoginname(loginname);
            /* System.out.println(student.toString());*/
            request.getSession().setAttribute("admin", admin);
            return new ModelAndView("admin/admin");

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









}

