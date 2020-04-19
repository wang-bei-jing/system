package edu.zzti.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import edu.zzti.bean.Grade;
import edu.zzti.bean.GradeRecord;
import edu.zzti.bean.Msg;
import edu.zzti.bean.TopicSelect;
import edu.zzti.service.GradeRecordService;
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
@RequestMapping("/gradeRecord")
public class GradeRecordController {

    private GradeRecordService gradeRecordService;

    private TopicSelectService topicSelectService;

    private GradeService gradeService;

    public GradeRecordController(GradeRecordService gradeRecordService, TopicSelectService topicSelectService, GradeService gradeService) {
        this.gradeRecordService = gradeRecordService;
        this.topicSelectService = topicSelectService;
        this.gradeService = gradeService;
    }

    /**
     * 添加记录
     */
    @ResponseBody
    @RequestMapping(value="/add/{grTno}",method= RequestMethod.POST)
    public Msg add(@Valid GradeRecord gradeRecord, BindingResult result, @PathVariable("grTno")Integer grTno){
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
            gradeRecord.setGrTno(grTno);
            gradeRecordService.add(gradeRecord);
            if(gradeRecord.getGrType()==1 || gradeRecord.getGrType()== 4){
                int tsId = gradeRecord.getGrTsId();
                Grade grade = gradeService.selectByGTsId(tsId);
                if(grade == null){
                    Grade grade1 = new Grade();
                    grade1.setgTsId(tsId);
                    gradeService.add(grade1);
                    System.out.println("add--grade1--"+grade1.toString());
                }
            }
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
        gradeRecordService.del(grId);
        return Msg.success();
    }

    /**
     * 修改记录
     */
    @ResponseBody
    @RequestMapping(value="/upd/{grId}",method= RequestMethod.PUT)
    public Msg upd(GradeRecord gradeRecord){
        System.out.println("upd--gradeRecord.toString()"+gradeRecord.toString());
        gradeRecordService.upd(gradeRecord);
        return Msg.success();
    }

    /**
     * 查询某个教师的某类型成绩记录
     */
    @ResponseBody
    @RequestMapping("/selectByTno/{tno}")
    public Msg selectByTno(@RequestParam(value = "pn", defaultValue = "1")Integer pn, @PathVariable("tno")Integer tno, Integer grType){
        PageHelper.startPage(pn, 5);
        List<GradeRecord> gradeRecordList = gradeRecordService.selectByTno(grType,tno);
        PageInfo page = new PageInfo(gradeRecordList, 2);
        if(!page.getList().isEmpty()){
            for (Object gradeRecord:page.getList()
            ) {
                System.out.println("peaceTime--gradeRecord.toString()"+gradeRecord.toString());
            }
        }
        return Msg.success().add("pageInfo", page);
    }

    /**
     * 查询某个教师的某两个类型成绩记录
     */
    @ResponseBody
    @RequestMapping("/select/{tno}")
    public Msg select(@RequestParam(value = "pn", defaultValue = "1")Integer pn, @PathVariable("tno")Integer tno, Integer grType, Integer grType1){
        PageHelper.startPage(pn, 5);
        List<GradeRecord> gradeRecordList = gradeRecordService.select(grType,grType1,tno);
        PageInfo page = new PageInfo(gradeRecordList, 2);
        if(!page.getList().isEmpty()){
            for (Object gradeRecord:page.getList()
            ) {
                System.out.println("peaceTime--gradeRecord.toString()"+gradeRecord.toString());
            }
        }
        return Msg.success().add("pageInfo", page);
    }

    /**
     * 查询期检查记录详细信息
     */
    @ResponseBody
    @RequestMapping("/detail/{grId}")
    public Msg detail(@PathVariable("grId")Integer grId){
        GradeRecord gradeRecord = gradeRecordService.selectById(grId);
        System.out.println("gradeRecordDetails--gradeRecord:"+grId);
        System.out.println("gradeRecordDetails--gradeRecord.toString()"+gradeRecord.toString());
        return Msg.success().add("gradeRecord", gradeRecord);
    }

    /**
     * 查询我的学生
     */
    @ResponseBody
    @RequestMapping("/getStudent/{tno}")
    public Msg getStudent(@PathVariable("tno")Integer tno){
        List<TopicSelect> topicSelectList = topicSelectService.getStudent(tno);
        if(!topicSelectList.isEmpty()){
            for (Object topicSelect:topicSelectList
            ) {
                System.out.println("getStudent--topicSelect.toString()"+topicSelect.toString());
            }
        }
        return Msg.success().add("topicSelectList", topicSelectList);
    }

    /**
     * 学生所选课题级联
     */
    @ResponseBody
    @RequestMapping("/getTopic/{id}")
    public Msg getTopic(@PathVariable("id")Integer id){
        TopicSelect topicSelect = topicSelectService.selectBytTsId(id);
        System.out.println("getTopic--topicSelect.toString()--"+topicSelect.toString());
        return Msg.success().add("topicSelect",topicSelect);
    }
}