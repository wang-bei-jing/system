
package edu.zzti.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import edu.zzti.bean.Topic;
import edu.zzti.bean.TopicSelect;
import edu.zzti.service.TopicSelectService;
import edu.zzti.service.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Controller
public class TopicController {
    @Autowired
    TopicService topicService;
    @Autowired
    TopicSelectService topicSelectService;
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
    //=========================================以上是施昊晨部分==============================================================



}

