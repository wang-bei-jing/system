package edu.zzti.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import edu.zzti.bean.*;
import edu.zzti.service.GradeRecordService;
import edu.zzti.service.GradeScaleService;
import edu.zzti.service.GradeService;
import edu.zzti.service.TopicSelectService;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/gradeScale")
public class GradeScaleController {

    private GradeScaleService gradeScaleService;

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

            return Msg.success();
        }
    }

    /**
     * 删除单个记录
     */
    @ResponseBody
    @RequestMapping(value="/del/{grId}",method= RequestMethod.DELETE)
    public Msg del(@PathVariable("grId")Integer grId){
        System.out.println("del--grId--"+grId);
    //    gradeRecordService.del(grId);
        return Msg.success();
    }

    /**
     * 修改记录
     */
    @ResponseBody
    @RequestMapping(value="/upd/{grId}",method= RequestMethod.PUT)
    public Msg upd(GradeRecord gradeRecord){
        System.out.println("upd--gradeRecord.toString()"+gradeRecord.toString());
     //   gradeRecordService.upd(gradeRecord);
        return Msg.success();
    }

    /**
     * 查询某个教师的某类型成绩记录
     */
//    @ResponseBody
//    @RequestMapping("/selectByTno/{tno}")
//    public Msg selectByTno(@RequestParam(value = "pn", defaultValue = "1")Integer pn, @PathVariable("tno")Integer tno, Integer grType){
//        PageHelper.startPage(pn, 5);
//        List<GradeRecord> gradeRecordList = gradeRecordService.selectByTno(grType,tno);
//        PageInfo page = new PageInfo(gradeRecordList, 2);
//        if(!page.getList().isEmpty()){
//            for (Object gradeRecord:page.getList()
//            ) {
//                System.out.println("peaceTime--gradeRecord.toString()"+gradeRecord.toString());
//            }
//        }
//        return Msg.success().add("pageInfo", page);
//    }



//    /**
//     * 查询期检查记录详细信息
//     */
//    @ResponseBody
//    @RequestMapping("/detail/{grId}")
//    public Msg detail(@PathVariable("grId")Integer grId){
//        GradeRecord gradeRecord = gradeRecordService.selectById(grId);
//        System.out.println("gradeRecordDetails--gradeRecord:"+grId);
//        System.out.println("gradeRecordDetails--gradeRecord.toString()"+gradeRecord.toString());
//        return Msg.success().add("gradeRecord", gradeRecord);
//    }
}