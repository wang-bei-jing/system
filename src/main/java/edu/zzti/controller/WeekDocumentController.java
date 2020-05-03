
package edu.zzti.controller;

import edu.zzti.bean.WeekDocument;
import edu.zzti.service.TopicSelectService;
import edu.zzti.service.WeekDocumentService;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Controller
public class WeekDocumentController {
    @Autowired
    TopicSelectService topicSelectService;
    @Autowired
    WeekDocumentService weekDocumentService;
    //=========================================以下是薛文青部分==============================================================


    //=========================================以上是薛文青部分==============================================================







    //=========================================以下是施昊晨部分==============================================================
    //------------------------------------周报部分---------------------------------------
    @RequestMapping("/findWeekDocument")
    public ModelAndView findWeekDocument(HttpServletRequest request, String sSno, Model model) {
        String status="1";
        //通过sSno,status="1"查询实训课题的tpsId来删除周报
        Integer tpsId=topicSelectService.findTpsId(sSno,status);
        System.out.println(tpsId);
            String category="1";
            List weeks=new ArrayList();
            List<WeekDocument> weekDocuments=weekDocumentService.findByCateory(tpsId,category);
            for(int i=0;i<weekDocuments.size();i++){
                System.out.println(weekDocuments.get(i).toString());

                weeks.add(weekDocuments.get(i).getWeek());
            }

        System.out.println(weeks.toString());
            model.addAttribute("weeks",weeks);
            request.getSession().setAttribute("wdaddtpsId",tpsId);
            request.getSession().setAttribute("weekDocuments",weekDocuments);
            return new ModelAndView("student/weekfileupdown");

    }

    @ResponseBody
    @RequestMapping(value="/uploadWeekDocument",method=RequestMethod.POST)
    public ModelAndView uploadDocument(MultipartFile file, HttpServletRequest request, WeekDocument weekDocument,String sSno) throws IOException, ParseException {
        /* Date date=new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String currenttimestr = dateFormat.format(date);
        Date currentDate = dateFormat.parse(currenttimestr);*/
       /* Timestamp t = new Timestamp(date.getTime());*/
        Timestamp t = new Timestamp(System.currentTimeMillis());
        weekDocument.setWkTime(t);

        System.out.println(weekDocument.toString());
        String week=weekDocument.getWeek();
        String path = request.getSession().getServletContext().getRealPath("upload")+"/"+sSno+"/weekDocuments/"+week;
        String fileName = file.getOriginalFilename();
       /* String newpathName=path+"/"+fileName;*/
        weekDocument.setDocumentname(fileName);
        System.out.println(weekDocument.getDocumentname());
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
    public void downWeekDocument(HttpServletRequest request, HttpServletResponse response,String documentname,String sSno,String week) throws Exception{
        //下载文件路径
        String pathFileName = request.getSession().getServletContext().getRealPath("upload")+"/"+sSno+"/weekDocuments/"+week+"/"+documentname;
        System.out.println(pathFileName);
        //获取输入流
        InputStream bis = new BufferedInputStream(new FileInputStream(new File(pathFileName)));
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
    public ModelAndView deleteWeekDocument(HttpServletRequest request,String documentname,int dId,String sSno,String week) throws Exception{
        String pathFileName = request.getSession().getServletContext().getRealPath("upload")+"/"+sSno+"/weekDocuments/"+week;
        System.out.println(pathFileName);

       /* File deletefile = new File(pathFileName);*/
        /*deletefile.delete();*/
        File file = new File(pathFileName);
        deleteFile(file);
        int i=0;
        i=weekDocumentService.deleteByPrimaryKey(dId);
        System.out.println(i);
        return new ModelAndView("redirect:/findWeekDocument?sSno="+sSno+"");

    }
    private void deleteFile(File file) {
        if (file.exists()) {//判断文件是否存在
            if (file.isFile()) {//判断是否是文件
                file.delete();//删除文件
            } else if (file.isDirectory()) {//否则如果它是一个目录
                File[] files = file.listFiles();//声明目录下所有的文件 files[];
                for (int i = 0;i < files.length;i ++) {//遍历目录下所有的文件
                    this.deleteFile(files[i]);//把每个文件用这个方法进行迭代
                }
                file.delete();//删除文件夹
            }
        } else {
            System.out.println("所删除的文件不存在");
        }
    }




    //------------------------------------------------实训文件部分---------------------------
    @RequestMapping("/findTestfile")
    public ModelAndView findTestfile(HttpServletRequest request, String sSno) {
        String status="1";
        //通过sSno,status="1"查询实训课题的id来删除实训文件
        Integer tpsId=topicSelectService.findTpsId(sSno,status);

            String category="2";
            List<WeekDocument> testfiles=weekDocumentService.findByCateory(tpsId,category);
       /* for(int i=0;i<testfiles.size();i++){
            System.out.println(testfiles.get(i).toString());
        }*/
            request.getSession().setAttribute("tfaddtpsId",tpsId);
            request.getSession().setAttribute("testfiles",testfiles);
            return new ModelAndView("student/testfile");
    }

    @ResponseBody
    @RequestMapping(value="/uploadTestfile",method=RequestMethod.POST)
    public ModelAndView uploadTestfile(MultipartFile file, HttpServletRequest request, WeekDocument weekDocument,String sSno) throws IOException {
        Timestamp t = new Timestamp(System.currentTimeMillis());
        weekDocument.setWkTime(t);
        System.out.println(weekDocument.toString());
        String path = request.getSession().getServletContext().getRealPath("upload")+"/"+sSno+"/testFile";
        System.out.println(path);
        String fileName = file.getOriginalFilename();
        String newpathName=path+fileName;
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
    public void downTestfile(HttpServletRequest request, HttpServletResponse response,String documentname,String sSno) throws Exception{

        String fileName = request.getSession().getServletContext().getRealPath("upload")+"/"+sSno+"/testFile/"+documentname;
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
        String fileName = request.getSession().getServletContext().getRealPath("upload")+"/"+sSno+"/testFile/"+documentname;
        System.out.println(fileName);
        File deletefile = new File(fileName);
        deleteFile(deletefile);
        int i=0;
        i=weekDocumentService.deleteByPrimaryKey(dId);
        System.out.println(i);
        return new ModelAndView("redirect:/findTestfile?sSno="+sSno+"");
    }
//=========================================以上是施昊晨部分==============================================================



}

