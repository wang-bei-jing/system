package edu.zzti.controller;

import edu.zzti.bean.TopicSelect;
import edu.zzti.service.TopicSelectService;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;


@RestController
public class TopicSelectController {
    @Autowired
    TopicSelectService TopicSelectService;

    @RequestMapping("/TopicSelectAdd")
    public String TopicSelectAdd(TopicSelect topicSelect) {
        //springmvc内置数据类型转换器
        //表单中提交的全都是String，springmvc会自动转成相应的数据类型
        System.out.println("111111111111111");
        System.out.println(topicSelect.toString());
        int i=0;
        System.out.println(i);
        i= TopicSelectService.addTopicSelect(topicSelect);
        System.out.println(i);
        if (i != 0) {
            System.out.println("1");
            return "1";
        }

        return "0";
    }

    @RequestMapping("/TopicSelectExistBySSno")
    public Integer TopicSelectExistBySSno(HttpServletRequest request, String sSno) {
        int exist=TopicSelectService.findExistBySSno(sSno);
        System.out.println(exist);
        return exist;
    }

    @RequestMapping("/TopicSelectExistBySSnoandtpid")
    public String TopicSelectExistBySSnoandtpid(String sSno, int tpId) {
        int exist=TopicSelectService.findExistBySSnoandtpid(sSno,tpId);
        if (exist==0){
            System.out.println("0");
            return "0";
        }
        return "1";

    }

    @RequestMapping("/TopicSelectDel")
    public String TopicSelectDel(String sSno, int tpId){
        System.out.println("111111111");
        int i=0;
        i=TopicSelectService.deleteBySSnoandtpid(sSno,tpId);
        if (i != 0) {
            System.out.println("1");
            return "1";
        }
        return "0";

    }

}
