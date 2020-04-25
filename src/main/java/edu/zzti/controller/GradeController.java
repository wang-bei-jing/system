package edu.zzti.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import edu.zzti.bean.Grade;
import edu.zzti.bean.GradeRecord;
import edu.zzti.bean.GradeScale;
import edu.zzti.bean.Msg;
import edu.zzti.service.GradeRecordService;
import edu.zzti.service.GradeScaleService;
import edu.zzti.service.GradeService;
import edu.zzti.service.TopicSelectService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/grade")
public class GradeController {
    private GradeRecordController gradeRecordController;

    private GradeRecordService gradeRecordService;

    private GradeService gradeService;

    private TopicSelectService topicSelectService;

    private GradeScaleService gradeScaleService;

    public GradeController(GradeService gradeService, TopicSelectService topicSelectService, GradeRecordService gradeRecordService, GradeScaleService gradeScaleService) {
        this.topicSelectService = topicSelectService;
        this.gradeRecordService = gradeRecordService;
        this.gradeService = gradeService;
        this.gradeScaleService =gradeScaleService;
    }

    /**
     * 查询某个教师所带学生的成绩
     */
    @ResponseBody
    @RequestMapping("/student/{tno}")
    public Msg student(@RequestParam(value = "pn", defaultValue = "1")Integer pn, @PathVariable("tno")Integer tno){
        PageHelper.startPage(pn, 5);
        List<Grade> gradeList = gradeService.student(tno);
        if(!gradeList.isEmpty()){
            for(Grade grade:gradeList){
                Integer a = -1,b = -1,c = -1,d = -1, total = -1;
                a = compute(grade.getgTsId(),1);
                b = compute(grade.getgTsId(),2);
                c = compute(grade.getgTsId(),3);
                d = compute(grade.getgTsId(),4);
                if( a != -1){
                    grade.setgPeacetime(a);
                }
                if(b != -1){
                    grade.setgMidterm(b);
                }
                if(c != -1){
                    grade.setgCheck(c);
                }
                if(d != -1){
                    grade.setgPresentation(d);
                }
                if (grade.getgPeacetime() != null && grade.getgMidterm() != null && grade.getgCheck() != null && grade.getgPresentation() != null ){
                    total= getTotal(a,b,c,d);
                    if(total != -1){
                        grade.setgTotal(total);
                    }
                }
                gradeService.upd(grade);
                System.out.println("student--gradeList--grade.toString()"+grade.toString());
            }
        }
        List<Grade> grades = gradeService.student(tno);
        PageInfo page = new PageInfo(grades, 2);
        return Msg.success().add("pageInfo", page);
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
    public int getTotal(Integer g1,Integer g2,Integer g3,Integer g4) {
        int num = -1;
        float total;
        if (g1 != null && g2 != null && g3 != null && g4 != null ) {
            GradeScale gradeScale = gradeScaleService.selectByGsStatus(1);
            float a = (float) gradeScale.getGradeA() / 100;
            float b = (float) gradeScale.getGradeB() / 100;
            float c = (float) gradeScale.getGradeC() / 100;
            float d = (float) gradeScale.getGradeD() / 100;
            total = (float) g1 * a + g2 * b + g3 * c + g4 * d ;
            num =(int)total;
            System.out.println("total:"+num);
        }
        return num;
    }
}