
package edu.zzti.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import edu.zzti.bean.TimeManger;
import edu.zzti.bean.Topic;
import edu.zzti.bean.TopicSelect;
import edu.zzti.bean.WeekDocument;
import edu.zzti.service.TimeMangerService;
import edu.zzti.service.TopicSelectService;
import edu.zzti.service.TopicService;
import edu.zzti.service.WeekDocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;


@Controller
public class TopicController {
    @Autowired
    TopicService topicService;
    @Autowired
    TopicSelectService topicSelectService;
    @Autowired
    TimeMangerService timeMangerService;
    @Autowired
    WeekDocumentService weekDocumentService;
    //=========================================以下是薛文青部分==============================================================


    //=========================================以上是薛文青部分==============================================================








    //=========================================以下是施昊晨部分==============================================================
    @ResponseBody
    @RequestMapping(value = "/TopicSelectAll")
    public ModelAndView TopicSelectAll(HttpServletRequest request, @RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 5);
        List<Topic> topics = topicService.selectAll();
        System.out.println(topics.size());
        for (int i = 0; i < topics.size(); i++) {
            System.out.println(topics.get(i).toString());
            System.out.println(topics.get(i).getTeacher().toString());
        }
        Integer categoty=2;
        TimeManger tpsTimeManger=timeMangerService.findTimeMangerByCategory(categoty);
        request.setAttribute("tpsTimeManger",tpsTimeManger);

        PageInfo page = new PageInfo(topics, 5);
        request.getSession().setAttribute("topicList", page);
        return new ModelAndView("student/topic");
    }

    @ResponseBody
    @RequestMapping(value = "/TopicSelectByName")
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
        return new ModelAndView("student/topic");
    }


    @ResponseBody
    @RequestMapping(value = "/myTopic")
    public ModelAndView myTopic(HttpServletRequest request,String sSno) {
        List<TopicSelect> topicsandteacher = topicSelectService.findBySSno(sSno);
        System.out.println(topicsandteacher.size());
        System.out.println(topicsandteacher.toString());
        if (topicsandteacher.size()==0){
            topicsandteacher=null;
        }
        request.getSession().setAttribute("topicsandteacherList", topicsandteacher);
        return new ModelAndView("student/mytopic");
    }
    @ResponseBody
    @RequestMapping(value = "/findDIdlist")
    public List findDIdlist(Integer dTId) {
        List<WeekDocument> weekDocumentList=weekDocumentService.findDIdlist(dTId);
        List ids=new ArrayList();
         for (int i=0;i<weekDocumentList.size();i++){
             ids.add(weekDocumentList.get(i).getdId());
         }
        System.out.println(ids.toString());
        return ids;
    }
    //文件下载
    @ResponseBody
    @RequestMapping("/downloadOneTopicFile")
    public void downloadOneTopicFile(HttpServletRequest request, HttpServletResponse response, Integer dTId) throws Exception{
        WeekDocument weekDocument = weekDocumentService.selectByDTId(dTId);
        String documentname = weekDocument.getDocumentname();
        //下载文件路径
        String pathFileName = "";
        if (weekDocument.getCategory().equals("3")){
            Integer tno = topicService.selectTopicById(dTId).getTno();
            pathFileName = request.getSession().getServletContext().getRealPath("upload")+"/"+tno+"/topic/"+dTId+"/"+documentname;
        }
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
    //=========================================以上是施昊晨部分==============================================================



}

