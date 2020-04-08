
package edu.zzti.controller;

import edu.zzti.bean.Student;
import edu.zzti.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
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


    @ResponseBody
    @RequestMapping(value="/upload",method=RequestMethod.POST)
    public String upload(MultipartFile file, HttpServletRequest request) throws IOException {
        String path = request.getSession().getServletContext().getRealPath("upload");
        String fileName = file.getOriginalFilename();
        File dir = new File(path,fileName);
        if(!dir.exists()){
            dir.mkdirs();
        }

        //MultipartFile自带的解析方法
        file.transferTo(dir);
        return "ok!";
    }


    @RequestMapping("/down")
    public void down(HttpServletRequest request, HttpServletResponse response) throws Exception{
        //模拟文件，myfile.txt为需要下载的文件
        String fileName = request.getSession().getServletContext().getRealPath("upload")+"/译文.docx";
        //获取输入流
        InputStream bis = new BufferedInputStream(new FileInputStream(new File(fileName)));
        //假如以中文名下载的话
        String filename = "下载文件.docx";
        //转码，免得文件名中文乱码
        filename = URLEncoder.encode(filename,"UTF-8");
        //设置文件下载头
        response.addHeader("Content-Disposition", "attachment;filename=" + filename);
        //1.设置文件ContentType类型，这样设置，会自动判断下载文件类型
        response.setContentType("multipart/form-data");
        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
        int len = 0;
        while((len = bis.read()) != -1){
            out.write(len);
            out.flush();
        }
        out.close();
    }









}

