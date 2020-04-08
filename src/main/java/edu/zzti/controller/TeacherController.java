package edu.zzti.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import edu.zzti.bean.Msg;
import edu.zzti.bean.Teacher;
import edu.zzti.bean.Topic;
import edu.zzti.bean.TopicSelect;
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

    private final TopicService topicService;

    private final TopicSelectService TopicSelectService;

    public TeacherController(TeacherService teacherService, TopicService topicService, TopicSelectService TopicSelectService) {
        this.teacherService = teacherService;
        this.topicService = topicService;
        this.TopicSelectService = TopicSelectService;
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
        System.out.println("将要更新的课题数据："+topic.toString());
        topicService.updateTopic(topic);
        return Msg.success();
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
     * 查询我的学生
     */
    @ResponseBody
    @RequestMapping("/student")
    public Msg student(@RequestParam(value = "pn", defaultValue = "1")Integer pn,Integer tno){
        PageHelper.startPage(pn, 5);
        List<TopicSelect> TopicSelectList = TopicSelectService.selectStudentByTno(tno);
        PageInfo page = new PageInfo(TopicSelectList, 3);
        if(!page.getList().isEmpty()){
            for (Object TopicSelect:page.getList()
            ) {
                System.out.println("student--student.toString()"+TopicSelect.toString());
            }
        }
        return Msg.success().add("pageInfo", page);
    }


    /**
     * 修改个人信息
     **/
    @RequestMapping("/updPerson")
    public ModelAndView updPerson(Teacher teacher){
        teacherService.updateByPrimaryKeySelective(teacher);
        Teacher t=teacherService.selectTeacherByTno(teacher.getTno());
        System.out.println("更新后"+t.toString());
        return new ModelAndView("t_person","teacher",t);
    }

    /**
     * 修改密码
     **/
    @RequestMapping("/updPassword")
    public ModelAndView updPassword(HttpServletRequest request){
        String oldPassword=request.getParameter("oldPassword");
        String newPassword=request.getParameter("newPassword");
        Integer tno= Integer.valueOf(request.getParameter("tno"));
        Teacher teacher=teacherService.selectTeacherByTno(tno);
        if(oldPassword.equals(teacher.getPassword())){
            teacherService.updatePassword(tno,newPassword);
            return new ModelAndView("login");
        }
        else {
            return new ModelAndView("t_person","passwordError","旧密码不正确");
        }
    }

    /**
     * 查看我的学生
     **/
    @RequestMapping("/selectStudentByTno")
    public ModelAndView selectStudentByTno(HttpServletRequest request,Integer tno){
        Teacher teacher=teacherService.selectTeacherByTno(tno);
        List<TopicSelect> TopicSelectList = TopicSelectService.selectStudentByTno(tno);
        request.getSession().setAttribute("TopicSelectList",TopicSelectList);
        request.getSession().setAttribute("teacher",teacher);
        return new ModelAndView("t_student");
    }


    /**
     * 去审核课题
     **/
    @RequestMapping("/toApprovalTopic")
    public ModelAndView toApprovalTopic(HttpServletRequest request,Integer tno,Integer id){
        Topic topic=topicService.selectTopicById(id);
        System.out.println("topicDetails"+topic.toString());
        Teacher teacher=teacherService.selectTeacherByTno(tno);
        request.getSession().setAttribute("teacher",teacher);
        return new ModelAndView("approvalTopic","topic",topic);
    }

    /**
     * 审核课题
     **/
    @RequestMapping("/approvalTopic")
    public ModelAndView approvalTopic(Topic topic, Integer tno, Integer id){
        System.out.println("updTopic"+"tno:"+tno);
        topicService.updateTopic(topic);
        Topic t = topicService.selectTopicById(id);
        System.out.println("更新后"+t.toString());
        return new ModelAndView("approvalTopic","topic",t);
    }

    /**
     * 处理学生课题申请
     **/
    @RequestMapping("/acceptStudent")
    public ModelAndView acceptStudent(Integer id){
        TopicSelectService.acceptStudent(id);
        return new ModelAndView("approvalTopic");
    }
}
