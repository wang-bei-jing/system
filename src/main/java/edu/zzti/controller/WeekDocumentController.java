
package edu.zzti.controller;

import edu.zzti.bean.TopicSelect;
import edu.zzti.bean.WeekDocument;
import edu.zzti.service.TopicSelectService;
import edu.zzti.service.WeekDocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.List;


@Controller
public class WeekDocumentController {
    @Autowired
    TopicSelectService topicSelectService;

    @Autowired
    WeekDocumentService weekDocumentService;

    //周报部分---------------------------------------------------------------------------
    @RequestMapping("/findWeekDocument")
    public ModelAndView myTopicSelect(HttpServletRequest request, String sSno) {
        String status="1";
        //通过sSno,status="1"查询实训课题的id来删除周报
        TopicSelect topicSelect=topicSelectService.myWeekfile(sSno,status);
        System.out.println(topicSelect.toString());
        String category="1";
        int tpsId=topicSelect.getId();
        System.out.println(tpsId);
        List<WeekDocument> weekDocuments=weekDocumentService.findByCateory(tpsId,category);
        for(int i=0;i<weekDocuments.size();i++){
            System.out.println(weekDocuments.get(i).toString());
        }
        request.getSession().setAttribute("mytopicSelect",topicSelect);
        request.getSession().setAttribute("weekDocuments",weekDocuments);
        return new ModelAndView("student/weekfileupdown");
    }

    @ResponseBody
    @RequestMapping(value="/uploadWeekDocument",method=RequestMethod.POST)
    public ModelAndView uploadDocument(MultipartFile file, HttpServletRequest request, WeekDocument weekDocument,String sSno) throws IOException {
        System.out.println(weekDocument.toString());
        String path = request.getSession().getServletContext().getRealPath("upload");
        System.out.println(path);
        String fileName = file.getOriginalFilename();
        weekDocument.setDocumentname(fileName);
        System.out.println(weekDocument.getDocumentname());
        System.out.println(weekDocument.toString());
        File dir = new File(path,fileName);
        if(!dir.exists()){
            dir.mkdirs();
        }
        //MultipartFile自带的解析方法
        file.transferTo(dir);
        int i=0;
        System.out.println(i);
        i=weekDocumentService.addWeekDocument(weekDocument);
        System.out.println(i);
        System.out.println("上传成功");
        //进入下一个控制器函数/findWeekDocument
        return new ModelAndView("redirect:/findWeekDocument?sSno="+sSno+"");
    }


    @RequestMapping("/downWeekDocument")
    public void downWeekDocument(HttpServletRequest request, HttpServletResponse response,String documentname) throws Exception{

        String fileName = request.getSession().getServletContext().getRealPath("upload")+"/"+documentname;
        System.out.println(fileName);
        //获取输入流
        InputStream bis = new BufferedInputStream(new FileInputStream(new File(fileName)));
        //假如以中文名下载的话
        String filename = documentname;
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
    @RequestMapping("/deleteWeekDocument")
    public ModelAndView deleteWeekDocument(HttpServletRequest request,String documentname,int dId,String sSno) throws Exception{
        String fileName = request.getSession().getServletContext().getRealPath("upload")+"/"+documentname;
        System.out.println(fileName);
        File deletefile = new File(fileName);
        deletefile.delete();
        int i=0;
        i=weekDocumentService.deleteByPrimaryKey(dId);
        System.out.println(i);
        return new ModelAndView("redirect:/findWeekDocument?sSno="+sSno+"");
    }




    //实训文件部分---------------------------------------------------------------------------
    @RequestMapping("/findTestfile")
    public ModelAndView findTestfile(HttpServletRequest request, String sSno) {
        String status="1";
        //通过sSno,status="1"查询实训课题的id来删除周报
        TopicSelect topicSelect=topicSelectService.myWeekfile(sSno,status);
        System.out.println(topicSelect.toString());
        int tpsId=topicSelect.getId();
        String category="2";
        List<WeekDocument> testfiles=weekDocumentService.findByCateory(tpsId,category);
        for(int i=0;i<testfiles.size();i++){
            System.out.println(testfiles.get(i).toString());
        }
        request.getSession().setAttribute("mytopicSelect",topicSelect);
        request.getSession().setAttribute("testfiles",testfiles);
        return new ModelAndView("student/testfile");
    }

    @ResponseBody
    @RequestMapping(value="/uploadTestfile",method=RequestMethod.POST)
    public ModelAndView uploadTestfile(MultipartFile file, HttpServletRequest request, WeekDocument weekDocument,String sSno) throws IOException {
        System.out.println(weekDocument.toString());
        String path = request.getSession().getServletContext().getRealPath("upload");
        System.out.println(path);
        String fileName = file.getOriginalFilename();
        weekDocument.setDocumentname(fileName);
        System.out.println(weekDocument.getDocumentname());
        System.out.println(weekDocument.toString());
        File dir = new File(path,fileName);
        if(!dir.exists()){
            dir.mkdirs();
        }
        //MultipartFile自带的解析方法
        file.transferTo(dir);
        int i=0;
        System.out.println(i);
        i=weekDocumentService.addWeekDocument(weekDocument);
        System.out.println(i);
        System.out.println("上传成功");
        //进入下一个控制器函数/findTestfile
        return new ModelAndView("redirect:/findTestfile?sSno="+sSno+"");
    }


    @RequestMapping("/downTestfile")
    public void downTestfile(HttpServletRequest request, HttpServletResponse response,String documentname) throws Exception{

        String fileName = request.getSession().getServletContext().getRealPath("upload")+"/"+documentname;
        System.out.println(fileName);
        //获取输入流
        InputStream bis = new BufferedInputStream(new FileInputStream(new File(fileName)));
        //假如以中文名下载的话
        String filename = documentname;
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
    @RequestMapping("/deleteTestfile")
    public ModelAndView deleteTestfile(HttpServletRequest request,String documentname,int dId,String sSno) throws Exception{
        String fileName = request.getSession().getServletContext().getRealPath("upload")+"/"+documentname;
        System.out.println(fileName);
        File deletefile = new File(fileName);
        deletefile.delete();
        int i=0;
        i=weekDocumentService.deleteByPrimaryKey(dId);
        System.out.println(i);
        return new ModelAndView("redirect:/findTestfile?sSno="+sSno+"");
    }




}

