
package edu.zzti.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import edu.zzti.bean.*;
import edu.zzti.service.*;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/time")
public class TimeController {

    final TimeMangerService timeMangerService;

    public TimeController(TimeMangerService timeMangerService) {
        this.timeMangerService = timeMangerService;
    }

    /**
     * 查询
     */
    @ResponseBody
    @RequestMapping("/select")
    public Msg select(@RequestParam(value = "pn", defaultValue = "1")Integer pn){
        PageHelper.startPage(pn, 5);
        Integer category=1;
        List<TimeManger> timeMangers = timeMangerService.findByCategory(category);
        PageInfo page = new PageInfo(timeMangers, 2);
        return Msg.success().add("pageInfo", page);
    }

    @ResponseBody
    @RequestMapping(value = "/add")
    public ModelAndView timeMangerAdd(int tiCategory,String tiBegin,String tiEnd) throws ParseException {
        String tiBeginstr=tiBegin.replace("T"," ");
        String tiEndstr=tiEnd.replace("T"," ");
        System.out.println(tiBeginstr);
        Date begintime=new SimpleDateFormat("yyyy-MM-dd hh:mm").parse(tiBeginstr);
        Date endtime=new SimpleDateFormat("yyyy-MM-dd hh:mm").parse(tiEndstr);
        TimeManger timeManger=new TimeManger();
        timeManger.setTiCategory(tiCategory);
        timeManger.setTiBegin(begintime);
        timeManger.setTiEnd(endtime);
        int i=timeMangerService.insertSelective(timeManger);
        System.out.println(i);
        return new ModelAndView("redirect:/adminTopicSelectTime");
    }
    @ResponseBody
    @RequestMapping(value = "/upd")
    public ModelAndView timeMangerUpd(int tiId,int tiCategory,String tiBegin,String tiEnd) throws ParseException {
        String tiBeginstr=tiBegin.replace("T"," ");
        String tiEndstr=tiEnd.replace("T"," ");
        System.out.println(tiBeginstr);
        Date begintime=new SimpleDateFormat("yyyy-MM-dd hh:mm").parse(tiBeginstr);
        Date endtime=new SimpleDateFormat("yyyy-MM-dd hh:mm").parse(tiEndstr);
        TimeManger timeManger=new TimeManger();
        timeManger.setTiId(tiId);
        timeManger.setTiCategory(tiCategory);
        timeManger.setTiBegin(begintime);
        timeManger.setTiEnd(endtime);
        int i=timeMangerService.updateByPrimaryKeySelective(timeManger);
        System.out.println(i);
        return new ModelAndView("redirect:/adminTopicSelectTime");
    }
    @ResponseBody
    @RequestMapping(value = "/del")
    public ModelAndView timeMangerDel(int tiId)  {
        int i=timeMangerService.deleteByPrimaryKey(tiId);
        System.out.println(i);
        return new ModelAndView("redirect:/adminTopicSelectTime");
    }
}

