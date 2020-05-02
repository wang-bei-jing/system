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
@RequestMapping("/grade")
public class GradeController {

    private final GradeRecordService gradeRecordService;

    private final GradeService gradeService;

    private final TopicSelectService topicSelectService;

    private final GradeScaleService gradeScaleService;

    public GradeController(GradeService gradeService, TopicSelectService topicSelectService, GradeRecordService gradeRecordService, GradeScaleService gradeScaleService) {
        this.topicSelectService = topicSelectService;
        this.gradeRecordService = gradeRecordService;
        this.gradeService = gradeService;
        this.gradeScaleService =gradeScaleService;
    }

    /**
     * 添加记录
     */
    @ResponseBody
    @RequestMapping(value="/add",method= RequestMethod.POST)
    public Msg add(@Valid Grade grade, BindingResult result){
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
            Grade grade1 = gradeService.selectByGTsId(grade.getgTsId());
            if(grade1 == null){
                gradeService.add(grade);
                return Msg.success();
            }
            else
                return Msg.fail().add("message","该学生的此课题成绩已存在!");
        }
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping(value="/del/{gId}",method= RequestMethod.DELETE)
    public Msg del(@PathVariable("gId")Integer gId){
        gradeService.del(gId);
        System.out.println("del--gId--"+gId);
        return Msg.success();
    }

    /**
     * 修改记录
     */
    @ResponseBody
    @RequestMapping(value="/upd/{gId}",method= RequestMethod.PUT)
    public Msg upd(Grade grade){
        System.out.println("upd--grade.toString()"+grade.toString());
        gradeService.upd(grade);
        return Msg.success();
    }

    /**
     * 查询详细信息
     */
    @ResponseBody
    @RequestMapping("/detail/{gId}")
    public Msg detail(@PathVariable("gId")Integer gId){
        Grade grade = gradeService.selectByGId(gId);
        return Msg.success().add("grade",grade);
    }

    /**
     * 查询成绩
     */
    @ResponseBody
    @RequestMapping("/student/{tno}")
    public Msg student(@RequestParam(value = "pn", defaultValue = "1")Integer pn, @PathVariable("tno")Integer tno){
        PageHelper.startPage(pn, 5);
        List<Grade> grades = gradeService.student(tno);
        PageInfo page = new PageInfo(grades, 2);
        return Msg.success().add("pageInfo", page);
    }
    /**
     * 计算期中成绩
     */
    @ResponseBody
    @RequestMapping("/midterm/{gTsId}")
    public void midterm(@PathVariable("gTsId")Integer gTsId){
        Grade grade = gradeService.selectByGTsId(gTsId);
        if(grade !=null){
            Integer  b = -1;
            b = compute(gTsId,2);
            if(b != -1){
                grade.setgMidterm(b);
            }
            System.out.println("midterm--grade.getgMidterm()-"+grade.getgMidterm());
            gradeService.upd(grade);
        }
    }
    /**
     * 计算验收成绩
     */
    @ResponseBody
    @RequestMapping("/check/{gTsId}")
    public void check(@PathVariable("gTsId")Integer gTsId){
        Grade grade = gradeService.selectByGTsId(gTsId);
        if(grade !=null){
            Integer  c = -1;
            c = compute(gTsId,3);
            if(c != -1){
                grade.setgCheck(c);
            }
            System.out.println("check--grade.getgCheck()-"+grade.getgCheck());
            gradeService.upd(grade);
        }
    }
    public int compute(Integer tsId,Integer grType){
        int count = 0, sum = 0, grade = -1;
        List<GradeRecord> gradeRecordList = gradeRecordService.selectByTsId(tsId,grType);
        if(!gradeRecordList.isEmpty()){
            for(GradeRecord gradeRecord:gradeRecordList){
                if(gradeRecord.getGrGrade()!=null)
                    sum = sum + gradeRecord.getGrGrade();
                count++;
            }
            grade = sum / count ;
        }
        System.out.println("grType:"+grType+"--grade:"+grade+"--sum:"+sum+"--count:"+count);
        return grade;
    }

    /**
     * 计算学生的总成绩
     */
    @ResponseBody
    @RequestMapping("/all/{tno}")
    public void all(@PathVariable("tno")Integer tno){
        List<Grade> grades = gradeService.student(tno);
        for(int i = 0;i<grades.size();i++){
            Grade grade = grades.get(i);
            if(grade != null){
                Integer a = -1, b = -1, c = -1, d = -1, total = -1;
                a = grade.getgPeacetime();
                b = grade.getgMidterm();
                c = grade.getgCheck();
                d = grade.getgPresentation();
                TopicSelect topicSelect = topicSelectService.selectBytTsId(grade.getgTsId());
                String department = topicSelect.getStudent().getDepartment();
                System.out.println("student--department-"+department+"--a-"+a+"--b-"+b+"--c-"+c+"--d-"+d);
                if (a != null && a != -1 && b != null && b != -1 && c != null && c != -1 && d != null && d != -1 ){
                    total= getTotal(department,a,b,c,d);
                    if(total != -1){
                        grade.setgTotal(total);
                    }
                }
                gradeService.upd(grade);
            }
        }
    }
    public int getTotal(String department,Integer g1,Integer g2,Integer g3,Integer g4) {
        int num = -1;
        float total;
        GradeScale gradeScale = gradeScaleService.selectBy(department,1);
        if(gradeScale != null){
            System.out.println("gradeScale.toString()--"+gradeScale.toString());
            float a = (float) gradeScale.getGradeA() / 100;
            float b = (float) gradeScale.getGradeB() / 100;
            float c = (float) gradeScale.getGradeC() / 100;
            float d = (float) gradeScale.getGradeD() / 100;
            total = (float) g1 * a + g2 * b + g3 * c + g4 * d ;
            num =(int)total;
            System.out.println("total--"+num);
        }
        return num;
    }
}