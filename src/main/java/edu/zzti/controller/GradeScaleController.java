package edu.zzti.controller;

import com.github.pagehelper.PageInfo;
import edu.zzti.bean.*;
import edu.zzti.service.GradeScaleService;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/gradeScale")
public class GradeScaleController {

    private final GradeScaleService gradeScaleService;

    public GradeScaleController(GradeScaleService gradeScaleService) {
        this.gradeScaleService = gradeScaleService;
    }

    /**
     * 添加记录
     */
    @ResponseBody
    @RequestMapping(value="/add/{department}",method= RequestMethod.POST)
    public Msg add(@Valid GradeScale gradeScale, BindingResult result, @PathVariable("department")String department){
        if(result.hasErrors()){
            //校验失败，应该返回失败，在模态框中显示校验失败的错误信息
            Map<String, Object> map = new HashMap<String, Object>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError fieldError : errors) {
                System.out.println("错误的字段名："+fieldError.getField());
                System.out.println("错误信息："+fieldError.getDefaultMessage());
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorFields", map);
        }else{
            Date date = new Date();
            Timestamp timestamp = new Timestamp(date.getTime());
            gradeScale.setGsTime(timestamp);
            gradeScale.setGsDepartment(department);
            System.out.println("add--gradeScale.toString()--"+gradeScale.toString());
            gradeScaleService.add(gradeScale);
            return Msg.success();
        }
    }

    /**
     * 删除单个记录
     */
    @ResponseBody
    @RequestMapping(value="/del/{gsId}",method= RequestMethod.DELETE)
    public Msg del(@PathVariable("gsId")Integer gsId){
        gradeScaleService.del(gsId);
        System.out.println("del--gsId--"+gsId);
        return Msg.success();
    }

    /**
     * 修改记录
     */
    @ResponseBody
    @RequestMapping(value="/upd/{gsId}",method= RequestMethod.PUT)
    public Msg upd(GradeScale gradeScale){
        System.out.println("upd--gradeScale.toString()"+gradeScale.toString());
        gradeScale.setGsStatus(3);
        gradeScaleService.upd(gradeScale);
        return Msg.success();
    }

    /**
     * 查询某专业的成绩比例
     */
    @ResponseBody
    @RequestMapping("/select/{department}")
    public Msg selectBy( @PathVariable("department")String department){
        List<GradeScale> gradeScaleList= gradeScaleService.select(department);
        PageInfo page = new PageInfo(gradeScaleList, 2);
        return Msg.success().add("pageInfo", page);
    }

    /**
     * 查询期检查记录详细信息
     */
    @ResponseBody
    @RequestMapping("/detail/{gsId}")
    public Msg detail(@PathVariable("gsId")Integer gsId){
        GradeScale gradeScale = gradeScaleService.selectById(gsId);
        return Msg.success().add("gradeScale",gradeScale);
    }
}