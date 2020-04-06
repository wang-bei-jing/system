package edu.zzti.controller;

import edu.zzti.bean.Topicselect;
import edu.zzti.service.TopicselectService;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.HttpRequest;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;


@RestController
public class TopicselectController {
    @Autowired
    TopicselectService topicselectService;

    @RequestMapping("/topicselectAdd")
    public String topicselectAdd(Topicselect topicselect) {
        //springmvc内置数据类型转换器
        //表单中提交的全都是String，springmvc会自动转成相应的数据类型
        System.out.println("111111111111111");
        System.out.println(topicselect.toString());
        int i=0;
        i= topicselectService.addTopicselect(topicselect);
        System.out.println(i);
        if (i != 0) {
            System.out.println("1");
            return "1";
        }
        return "0";
    }

    @RequestMapping("/topicselectExistBySSno")
    public Integer topicselectExistBySSno(HttpServletRequest request, String sSno) {
        int exist=topicselectService.findExistBySSno(sSno);
        System.out.println(exist);
        return exist;
    }

    @RequestMapping("/topicselectExistBySSnoandtpid")
    public String topicselectExistBySSnoandtpid(String sSno, int tpId) {
        int exist=topicselectService.findExistBySSnoandtpid(sSno,tpId);
        if (exist==0){
            System.out.println("0");
            return "0";
        }
        return "1";

    }

    @RequestMapping("/topicselectDel")
    public String topicselectDel(String sSno, int tpId){
        System.out.println("111111111");
        int i=0;
        i=topicselectService.deleteBySSnoandtpid(sSno,tpId);
        if (i != 0) {
            System.out.println("1");
            return "1";
        }
        return "0";

    }


}
