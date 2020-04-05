package edu.zzti.controller;

import edu.zzti.bean.Topicselect;
import edu.zzti.service.TopicselectService;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;



@RestController
public class TopicselectController {
    @Autowired
    TopicselectService topicselectService;

    @RequestMapping("/topicselectAdd")
    public String topicselectAdd(Topicselect topicselect) {
        System.out.println(topicselect.toString());
        int i = 0;
        i = topicselectService.addTopicselect(topicselect);
        System.out.println(i);
        if (i != 0) {
            System.out.println("1");
            return "1";
        }
        return "0";
    }


}
