
package edu.zzti.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import edu.zzti.bean.Topic;
import edu.zzti.bean.Topicselect;
import edu.zzti.service.TopicService;
import edu.zzti.service.TopicselectService;
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
    TopicselectService topicselectService;

    @ResponseBody
    @RequestMapping(value = "/topicSelectAll")
    public ModelAndView topicSelectAll(HttpServletRequest request,String sSno, @RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 5);
        List<Topic> topics = topicService.selectAll();
        System.out.println(topics.size());
        for (int i = 0; i < topics.size(); i++) {
            System.out.println(topics.get(i).toString());
        }
        PageInfo page = new PageInfo(topics, 5);
        request.getSession().setAttribute("topicList", page);
        return new ModelAndView("topic");
    }

    @ResponseBody
    @RequestMapping(value = "/topicSelectByCname")
    public ModelAndView topicSelectByCname(HttpServletRequest request, @RequestParam String cname, @RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 5);
        List<Topic> topics = topicService.selectByCname(cname);
        System.out.println(topics.size());
        for (int i = 0; i < topics.size(); i++) {
            System.out.println(topics.get(i).toString());
        }
        System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
        PageInfo page = new PageInfo(topics, 5);
        System.out.println(page.getPageSize());
        request.getSession().setAttribute("topicList", page);
        return new ModelAndView("topic");
    }


    @ResponseBody
    @RequestMapping(value = "/myTopic")
    public ModelAndView myTopic(HttpServletRequest request,String sSno,@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 5);
        List<Topicselect> topicsandteacher = topicselectService.findBySSno(sSno);
        System.out.println(topicsandteacher.size());
        System.out.println(topicsandteacher.toString());
        PageInfo page = new PageInfo(topicsandteacher, 5);
        request.getSession().setAttribute("topicsandteacherList", page);
        return new ModelAndView("mytopic");
    }


}

