package edu.zzti.controller;

import edu.zzti.bean.Grade;
import edu.zzti.bean.Msg;
import edu.zzti.bean.TopicSelect;
import edu.zzti.service.GradeService;
import edu.zzti.service.TopicSelectService;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@RestController
public class TopicSelectController {
    @Autowired
    TopicSelectService topicSelectService;
    @Autowired
    GradeService gradeService;
    //=========================================以下是薛文青部分==============================================================

    /**
     * 查询所有学生所选课题
     */
    @ResponseBody
    @RequestMapping("/topicSelect")
    public Msg topicSelect(){
        List<TopicSelect> topicSelectList= topicSelectService.selectAll();
        return Msg.success().add("topicSelectList",topicSelectList);
    }

    /**
     * 学生课题级联
     */
    @ResponseBody
    @RequestMapping("/getTopic/{id}")
    public Msg getTopic(@PathVariable("id")Integer id){
        TopicSelect topicSelect = topicSelectService.selectBytTsId(id);
        System.out.println("getTopic--topicSelect.toString()--"+topicSelect.toString());
        return Msg.success().add("topicSelect",topicSelect);
    }
    //=========================================以上是薛文青部分==============================================================






    //=========================================以下是施昊晨部分==============================================================
    @RequestMapping("/TopicSelectAdd")
    public String TopicSelectAdd(TopicSelect topicSelect) {
        //springmvc内置数据类型转换器
        //表单中提交的全都是String，springmvc会自动转成相应的数据类型
        System.out.println("111111111111111");
        System.out.println(topicSelect.toString());
        int i=0;
        System.out.println(i);
        i= topicSelectService.addTopicSelect(topicSelect);
        System.out.println(i);
        if (i != 0) {
            System.out.println("1");
            return "1";
        }

        return "0";
    }

    @RequestMapping("/TopicSelectExistBySSno")
    public Integer TopicSelectExistBySSno(String sSno) {
        int exist=topicSelectService.findExistBySSno(sSno);
        System.out.println(exist);
        return exist;
    }

    @RequestMapping("/TopicSelectExistBySSnoandtpid")
    public String TopicSelectExistBySSnoandtpid(String sSno, int tpId) {
        int exist=topicSelectService.findExistBySSnoandtpid(sSno,tpId);
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
        i=topicSelectService.deleteBySSnoandtpid(sSno,tpId);
        if (i != 0) {
            System.out.println("1");
            return "1";
        }
        return "0";
    }

    @RequestMapping("/myTopicSelect")
    public ModelAndView myTopicSelect(HttpServletRequest request,String sSno) {
     String status="1";
        System.out.println(status);
        System.out.println(sSno);
     System.out.println("123");
     TopicSelect topicSelect=topicSelectService.myTopicSelect(sSno,status);
     System.out.println(topicSelect);
     Grade grade=gradeService.findStudentGradeBySnoAndStatus(sSno,status);
     String just="1";
      if (topicSelect==null){
          just="0";
      }

         request.setAttribute("just",just);
         request.setAttribute("mytopicSelect",topicSelect);
         request.setAttribute("grade",grade);
         return new ModelAndView("student/myworktopic");
    }
    //=========================================以上是施昊晨部分==============================================================
}
