package edu.zzti.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import edu.zzti.bean.*;
import edu.zzti.service.StudentService;
import edu.zzti.service.TeacherService;
import edu.zzti.service.TopicSelectService;
import edu.zzti.service.TopicService;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/teacher")
public class TeacherController {

    private final TeacherService teacherService;

    private final StudentService studentService;

    private final TopicService topicService;

    private final TopicSelectService topicSelectService;

    public TeacherController(TeacherService teacherService, StudentService studentService, TopicService topicService, TopicSelectService topicSelectService) {
        this.teacherService = teacherService;
        this.studentService = studentService;
        this.topicService = topicService;
        this.topicSelectService = topicSelectService;
    }

    /**
     * 添加课题
     */
    @ResponseBody
    @RequestMapping(value="/addTopic/{tno}",method=RequestMethod.POST)
    public Msg saveEmp(@Valid Topic topic, BindingResult result, @PathVariable("tno")Integer tno){
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
            topic.setTno(tno);
            topicService.insertTopic(topic);
            return Msg.success();
        }
    }

    /**
     * 删除单个课题
     */
    @ResponseBody
    @RequestMapping(value="/delTopic/{topicId}",method=RequestMethod.DELETE)
    public Msg delTopic(@PathVariable("topicId")Integer topicId){
        Topic topic=topicService.selectTopicById(topicId);
        System.out.println("delTopic--topic.toString()"+topic.toString());
        topicService.deleteTopicById(topicId);
        return Msg.success();
    }

    /**
     * 修改课题
     */
    @ResponseBody
    @RequestMapping(value="/updTopic/{id}",method=RequestMethod.PUT)
    public Msg saveTopic(Topic topic){
        System.out.println("updTopic--topic.toString()"+topic.toString());
        topicService.updateTopic(topic);
        return Msg.success();
    }

    /**
     * 通过课题审核
     */
    @ResponseBody
    @RequestMapping(value="/applyTopic/{id}",method=RequestMethod.PUT)
    public Msg applyTopic(@PathVariable("id")Integer id){
        System.out.println("applyTopic--id--"+id);
        topicService.applyTopic(id);
        return Msg.success();
    }

    /**
     * 重新申请课题
     */
    @ResponseBody
    @RequestMapping(value="/reApplyTopic/{id}",method=RequestMethod.PUT)
    public Msg reApplyTopic(@PathVariable("id")Integer id){
        System.out.println("reApplyTopic--id--"+id);
        topicService.reApplyTopic(id);
        return Msg.success();
    }

    /**
     * 通过课题审核
     */
    @ResponseBody
    @RequestMapping(value="/acceptTopic/{id}",method=RequestMethod.PUT)
    public Msg acceptTopic(@PathVariable("id")Integer id){
        System.out.println("acceptTopic--id--"+id);
        topicService.acceptTopic(id);
        return Msg.success();
    }

    /**
     * 拒绝课题审核
     */
    @ResponseBody
    @RequestMapping(value="/refuseTopic/{id}",method=RequestMethod.PUT)
    public Msg refuseTopic(@PathVariable("id")Integer id){
        System.out.println("refuseTopic--id--"+id);
        topicService.refuseTopic(id);
        return Msg.success();
    }

    /**
     * 修改个人信息
     **/
    @ResponseBody
    @RequestMapping(value="updPerson/{tno}",method=RequestMethod.PUT)
    public Msg updTeacher(Teacher teacher){
        System.out.println("teacher--teacher.toString()--"+teacher.toString());
        teacherService.updTeacher(teacher);
        return Msg.success();
    }

    /**
     * 修改密码
     **/
    @RequestMapping("/updPwd")
    public ModelAndView passwordRevise(HttpServletRequest request){
        String oldPassword=request.getParameter("oldPassword");
        String newPassword1=request.getParameter("newPassword1");
        String newPassword2=request.getParameter("newPassword2");
        Integer tno= Integer.valueOf(request.getParameter("tno"));
        Teacher teacher=teacherService.selectTeacherByTno(tno);
        if(oldPassword.equals(teacher.getPassword()) && newPassword1.equals(newPassword2)){
            teacherService.updPwd(tno,newPassword1);
            return new ModelAndView("login");
        }
        else {
            return new ModelAndView("teacher/t_index","passworderror","旧密码不正确");

        }
    }

//    /**
//     * 修改密码
//     **/
//    @ResponseBody
//    @RequestMapping(value="updPwd/{tno}")
//    public ModelAndView updPwd(@PathVariable("tno")Integer tno, HttpServletRequest request,PrintWriter out){
//        String oldPassword=request.getParameter("oldPassword");
//        String newPassword1=request.getParameter("newPassword1");
//        String newPassword2=request.getParameter("newPassword2");
//        Teacher teacher=teacherService.selectTeacherByTno(tno);
//        if(oldPassword.equals(teacher.getPassword()) && newPassword1.equals(newPassword2)){
//            teacherService.updPwd(tno,newPassword1);
//         //   out.println("<script type='text/javascript'>alert('修改成功!');top.mainFrame.location='login';</script>");
//            return new ModelAndView("login");
//        }
//        else {
//            out.println("<script type='text/javascript'>alert('旧密码有误或两次新密码不一样，修改失败!');</script>");
//            return new ModelAndView("teacher/t_password");
//        }
//    }


    /**
     * 查询教师个人信息
     */
    @ResponseBody
    @RequestMapping("/person/{tno}")
    public Msg person(@PathVariable("tno")Integer tno){
        Teacher teacher=teacherService.selectTeacherByTno(tno);
        return Msg.success().add("teacher", teacher);
    }

    /**
     * 查询某个教师的所有课题
     */
    @ResponseBody
    @RequestMapping("/topic/{tno}")
    public Msg topic(@RequestParam(value = "pn", defaultValue = "1")Integer pn, @PathVariable("tno")Integer tno){
        PageHelper.startPage(pn, 5);
        List<Topic> topicList=topicService.selectTopicByTno(tno);
        PageInfo page = new PageInfo(topicList, 2);
        if(!page.getList().isEmpty()){
            for (Object topic:page.getList()
            ) {
                System.out.println("topic--topic.toString()"+topic.toString());
            }
        }
        return Msg.success().add("pageInfo", page);
    }

    /**
     * 查询课题详细信息
     */
    @ResponseBody
    @RequestMapping("/topicDetails/{topicId}")
    public Msg topicDetails(@PathVariable("topicId")Integer topicId){
        Topic topic=topicService.selectTopicById(topicId);
        System.out.println("topicDetails--topicId:"+topicId);
        System.out.println("topicDetails--topic.toString()"+topic.toString());
        return Msg.success().add("topic", topic);
    }

    /**
     * 查询所有课题
     */
    @ResponseBody
    @RequestMapping("/allTopic")
    public Msg allTopic(@RequestParam(value = "pn", defaultValue = "1")Integer pn){
        PageHelper.startPage(pn, 5);
        List<Topic> topicList=topicService.selectAllWithTeacher();
        PageInfo page = new PageInfo(topicList, 2);
        if(!page.getList().isEmpty()){
            for (Object topic:page.getList()
            ) {
                System.out.println("allTopic--topic.toString()"+topic.toString());
            }
        }
        return Msg.success().add("pageInfo", page);
    }

    /**
     * 查询选我课题的学生
     */
    @ResponseBody
    @RequestMapping("/student/{tno}")
    public Msg student(@RequestParam(value = "pn", defaultValue = "1")Integer pn,@PathVariable("tno")Integer tno){
        PageHelper.startPage(pn, 5);
        List<TopicSelect> topicSelectList = topicSelectService.selectStudent(tno);
        PageInfo page = new PageInfo(topicSelectList, 3);
        if(!page.getList().isEmpty()){
            for (Object topicSelect:page.getList()
            ) {
                System.out.println("student--student.toString()"+topicSelect.toString());
            }
        }
        return Msg.success().add("pageInfo", page);
    }

    /**
     * 查询我的学生
     */
    @ResponseBody
    @RequestMapping("/myStudent/{tno}")
    public Msg myStudent(@RequestParam(value = "pn", defaultValue = "1")Integer pn,@PathVariable("tno")Integer tno){
        PageHelper.startPage(pn, 5);
        List<TopicSelect> topicSelectList = topicSelectService.selectMyStudent(tno);
        PageInfo page = new PageInfo(topicSelectList, 3);
        if(!page.getList().isEmpty()){
            for (Object topicSelect:page.getList()
            ) {
                System.out.println("myStudent--student.toString()"+topicSelect.toString());
            }
        }
        return Msg.success().add("pageInfo", page);
    }

    /**
     * 同意课题申请
     */
    @ResponseBody
    @RequestMapping(value="/agreeStudent/{id}",method=RequestMethod.PUT)
    public Msg agreeStudent(@PathVariable("id")Integer id){
        TopicSelect topicSelect = topicSelectService.selectBytTsId(id);
        System.out.println("agreeStudent-----"+topicSelect.toString()+"-----");
        int tpId = topicSelect.getTpId();
        System.out.println("agreeStudent-----"+tpId+"-----");
        Topic topic = topicService.selectTopicById(tpId);
        int num = topicSelectService.countByTpId(tpId);
        Student student=studentService.studentFindBySno(topicSelect.getsSno());
        System.out.println("agreeStudent--student.getStatus()--"+student.getStatus());
        System.out.println("agreeStudent--topic.getNum()--num--"+ topic.getNum()+ "--" +num);
        if(student.getStatus() == 0 && (topic.getNum() > num)){
            studentService.accept(student.getSno());
            topicSelectService.acceptStudent(id);
            return Msg.success();
        }
        else
            return Msg.fail();
    }

    /**
     * 拒绝课题申请
     */
    @ResponseBody
    @RequestMapping(value="/refuseStudent/{id}",method=RequestMethod.PUT)
    public Msg refuseStudent(@PathVariable("id")Integer id){
        System.out.println("refuseStudent--id--"+id);
        topicSelectService.refuseStudent(id);
        return Msg.success();
    }
}
