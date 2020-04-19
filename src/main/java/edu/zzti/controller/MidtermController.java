package edu.zzti.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import edu.zzti.bean.GradeRecord;
import edu.zzti.bean.Midterm;
import edu.zzti.bean.Msg;
import edu.zzti.service.GradeRecordService;
import edu.zzti.service.MidtermService;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/teacher")
public class MidtermController {

    private MidtermService midtermService;

    private GradeRecordService gradeRecordService;

    public MidtermController(MidtermService midtermService, GradeRecordService gradeRecordService) {
        this.midtermService = midtermService;
        this.gradeRecordService =gradeRecordService;
    }

    /**
     * 添加
     */
    @ResponseBody
    @RequestMapping(value="/addMidterm/{tno}",method= RequestMethod.POST)
    public Msg saveEmp(@Valid Midterm midterm, BindingResult result, @PathVariable("tno")Integer tno, HttpServletRequest request){
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
            GradeRecord gradeRecord =new GradeRecord();
            gradeRecord.setGrTsId(midterm.getTsId());
            gradeRecord.setGrTno(tno);
            gradeRecord.setGrType(2);
            Integer grGrade_add= Integer.valueOf(request.getParameter("grGrade_add"));
            gradeRecord.setGrGrade(grGrade_add);
            gradeRecordService.add(gradeRecord);
            int grId =gradeRecordService.selectTopId(midterm.getTsId(),2,tno);
            midterm.setmTno(tno);
            midterm.setGrId(grId);
            System.out.println("addMidterm--midterm.toString()--"+midterm.toString());
            midtermService.add(midterm);
            return Msg.success();
        }
    }


    /**
     * 查询某个教师的中期检查记录
     */
    @ResponseBody
    @RequestMapping("/midterm/{tno}")
    public Msg topic(@RequestParam(value = "pn", defaultValue = "1")Integer pn, @PathVariable("tno")Integer tno){
        PageHelper.startPage(pn, 5);
        List<Midterm> midtermList=midtermService.selectByTno(tno);
        PageInfo page = new PageInfo(midtermList, 2);
        if(!page.getList().isEmpty()){
            for (Object midterm:page.getList()
            ) {
                System.out.println("midterm--midterm.toString()"+midterm.toString());
            }
        }
        return Msg.success().add("pageInfo", page);
    }

    /**
     * 查询期检查记录详细信息
     */
    @ResponseBody
    @RequestMapping("/midtermDetails/{mId}")
    public Msg midtermDetails(@PathVariable("mId")Integer mId){
        Midterm midterm=midtermService.selectById(mId);
        System.out.println("midtermDetails--midtermId--"+mId);
        System.out.println("midtermDetails--midterm.toString()--"+midterm.toString());
        return Msg.success().add("midterm", midterm);
    }

    /**
     * 删除单个记录
     */
    @ResponseBody
    @RequestMapping(value="/delMidterm/{mId}",method= RequestMethod.DELETE)
    public Msg delTopic(@PathVariable("mId")Integer mId){
        System.out.println("delMidterm--mId--"+mId);
        Midterm midterm =midtermService.selectById(mId);
        int grId = midterm.getGrId();
        System.out.println("delMidterm--grId--"+grId);
        gradeRecordService.del(grId);
        midtermService.del(mId);
        return Msg.success();
    }

    /**
     * 修改记录
     */
    @ResponseBody
    @RequestMapping(value="/updMidterm/{mId}",method= RequestMethod.PUT)
    public Msg saveTopic(Midterm midterm, HttpServletRequest request){
        int mId = midterm.getmId();
        Midterm midterm1 =midtermService.selectById(mId);
        Integer grGrade_upd= Integer.valueOf(request.getParameter("grGrade_upd"));
        GradeRecord gradeRecord =gradeRecordService.selectById(midterm1.getGrId());
        gradeRecord.setGrGrade(grGrade_upd);
        gradeRecordService.upd(gradeRecord);
        midtermService.upd(midterm);
        return Msg.success();
    }
}
