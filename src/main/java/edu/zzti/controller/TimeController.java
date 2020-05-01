
package edu.zzti.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import edu.zzti.bean.*;
import edu.zzti.service.*;

import org.joda.time.DateTime;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
     * 比较
     */
    @ResponseBody
    @RequestMapping("/compare")
    public void compare(HttpServletRequest request){
        Integer category=1;
        List<TimeManger> timeMangers = timeMangerService.findByCategory(category);
        if (!timeMangers.isEmpty()){
            TimeManger timeManger = timeMangers.get(0);
            Date begin = timeManger.getTiBegin();
            Date end = timeManger.getTiEnd();
            Date now = new Date();
            if (now.after(begin)&&now.before(end)){
                request.getSession().setAttribute("compare", 1);
                request.getSession().setAttribute("timeManger", timeManger);
                System.out.println("compare--1--");
            }
            else {
                request.getSession().setAttribute("compare", 2);
                request.getSession().setAttribute("timeManger", timeManger);
                System.out.println("compare--2--");
            }
        }
        else
        {
            request.getSession().setAttribute("compare", 0);
            request.getSession().setAttribute("timeManger", null);
            request.getSession().setAttribute("message", "当前没有设置课题申报时间！");
        }
    }

    /**
     * 查询
     */
    @ResponseBody
    @RequestMapping("/select")
    public Msg select(){
        Integer category=1;
        List<TimeManger> timeMangers = timeMangerService.findByCategory(category);
        return Msg.success().add("timeMangers", timeMangers);
    }

    @ResponseBody
    @RequestMapping(value="/add",method= RequestMethod.POST)
    public Msg add(TimeManger timeManger, String begin, String end) throws ParseException {
        Integer category=1;
        List<TimeManger> timeMangers = timeMangerService.findByCategory(category);
        if(timeMangers.isEmpty()){
            System.out.println("add--begin--"+begin);
            System.out.println("add--end--"+end);
            Date beginTime = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(begin);
            Date endTime = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(end);
            System.out.println("add--beginTime--"+beginTime);
            System.out.println("add--endTime--"+endTime);
            timeManger.setTiBegin(beginTime);
            timeManger.setTiEnd(endTime);
            timeManger.setTiCategory(1);
            System.out.println("add--timeManger.toString()"+timeManger.toString());
            timeMangerService.insertSelective(timeManger);
            return  Msg.success();
        }
        else
            return Msg.fail().add("message","时间已存在，请删除已有时间后再重新添加！");
    }

    /**
     * 删除单个课题
     */
    @ResponseBody
    @RequestMapping(value="/del/{tiId}",method=RequestMethod.DELETE)
    public Msg del(@PathVariable("tiId")Integer tiId){
        timeMangerService.deleteByPrimaryKey(tiId);
        return Msg.success();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping(value="/upd/{tiId}",method=RequestMethod.PUT)
    public Msg upd(@PathVariable("tiId")Integer tiId, String begin, String end) throws ParseException {
        System.out.println("upd--begin--"+begin);
        System.out.println("upd--end--"+end);
        TimeManger timeManger =new TimeManger();
        timeManger.setTiId(tiId);
        timeManger.setTiCategory(1);
        Date beginTime = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(begin);
        Date endTime = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(end);
        System.out.println("add--beginTime--"+beginTime);
        System.out.println("add--endTime--"+endTime);
        timeManger.setTiBegin(beginTime);
        timeManger.setTiEnd(endTime);
        System.out.println("upd--timeManger.toString()"+timeManger.toString());
        timeMangerService.updateByPrimaryKeySelective(timeManger);
        return Msg.success();
    }

    /**
     * 查询详细信息
     */
    @ResponseBody
    @RequestMapping("/detail/{tiId}")
    public Msg detail(@PathVariable("tiId")Integer tiId){
        TimeManger timeManger = timeMangerService.selectByPrimaryKey(tiId);
        System.out.println("detail--timeManger.toString()"+timeManger.toString());
        return Msg.success().add("timeManger", timeManger);
    }
}

