package edu.zzti.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import edu.zzti.bean.*;
import edu.zzti.service.CommentService;
import edu.zzti.service.StudentCommentService;
import edu.zzti.service.StudentService;
import edu.zzti.service.TopicSelectService;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;



@Controller
@RequestMapping("/comment")
public class CommentController {

    private final StudentCommentService studentCommentService;

    private final CommentService commentService;

    private final TopicSelectService topicSelectService;

    private final StudentService studentService;

    public CommentController(StudentCommentService studentCommentService,CommentService commentService, TopicSelectService topicSelectService, StudentService studentService) {
        this.studentCommentService = studentCommentService;
        this.commentService = commentService;
        this.topicSelectService = topicSelectService;
        this.studentService = studentService;
    }

    /**
     * 教师回复
     */
    @ResponseBody
    @RequestMapping(value="/reply/{scId}",method= RequestMethod.POST)
    public Msg reply(@PathVariable("scId")Integer scId,String tcContent,Integer tcAll){
        StudentComment studentComment = studentCommentService.selectById(scId);
        TeacherComment teacherComment = new TeacherComment();
        teacherComment.setTcContent(tcContent);
        teacherComment.setTcScId(scId);
        teacherComment.setTcTpsId(studentComment.getScTpsId());
        teacherComment.setTcTno(studentComment.getTopic().getTno());
        teacherComment.setTcAll(tcAll);
        System.out.println("reply--"+teacherComment.toString());
        commentService.insert(teacherComment);
        return Msg.success();
    }

    /**
     * 删除单个记录
     */
    @ResponseBody
    @RequestMapping(value="/del/{tcId}",method= RequestMethod.DELETE)
    public Msg del(@PathVariable("tcId")Integer tcId){
        System.out.println("del--tcId--"+tcId);
        commentService.del(tcId);
        return Msg.success();
    }

    /**
     * 修改记录
     */
    @ResponseBody
    @RequestMapping(value="/upd",method= RequestMethod.PUT)
    public Msg upd(Integer tcId,String tcComment,Integer tcAll){
        TeacherComment teacherComment =new TeacherComment();
        teacherComment.setTcId(tcId);
        teacherComment.setTcContent(tcComment);
        teacherComment.setTcAll(tcAll);
        System.out.println("upd--teacherComment.toString()"+teacherComment.toString());
        commentService.upd(teacherComment);
        return Msg.success();
    }

    /**
     * 置顶/取消置顶
     */
    @ResponseBody
    @RequestMapping(value="/top",method= RequestMethod.PUT)
    public Msg top(Integer tcId,Integer tcAll){
        TeacherComment teacherComment =new TeacherComment();
        teacherComment.setTcId(tcId);
        teacherComment.setTcAll(tcAll);
        System.out.println("top--teacherComment.toString()"+teacherComment.toString());
        commentService.upd(teacherComment);
        return Msg.success();
    }

    /**
     * 查询我的学生提问
     */
    @ResponseBody
    @RequestMapping("/select/{tno}")
    public Msg select(@RequestParam(value = "pn", defaultValue = "1")Integer pn, @PathVariable("tno")Integer tno){
        PageHelper.startPage(pn, 5);
        List<StudentComment> studentCommentList = studentCommentService.selectByTno(tno);
        for (StudentComment studentComment : studentCommentList) {
            System.out.println("select--"+studentComment.toString());
        }
        PageInfo page = new PageInfo(studentCommentList, 2);
        System.out.println("select--"+page.toString());
        return Msg.success().add("pageInfo", page);
    }

    /**
     * 查询详细信息
     */
    @ResponseBody
    @RequestMapping("/detail/{scId}")
    public Msg detail(@PathVariable("scId")Integer scId){
        StudentComment studentComment = studentCommentService.selectById(scId);
        System.out.println("detail--"+studentComment.toString());
        return Msg.success().add("studentComment",studentComment);
    }

    /**
     * 查询我的联系人（学生）
     */
    @ResponseBody
    @RequestMapping("/people/{tno}")
    public Msg people(@PathVariable("tno")String tno, HttpServletRequest request){
        List<Comment> twoList = commentService.selectPeople(tno);
        List<String> personList = new ArrayList<String>();
        List<Student> peopleList = new ArrayList<Student>();
        if(twoList != null){
            if(twoList.get(0).getcFrom().equals(tno)){
                personList.add(twoList.get(0).getcTo());
            }
            if(twoList.get(0).getcTo().equals(tno)){
                personList.add(twoList.get(0).getcFrom());
            }
            for (Comment comment : twoList) {
                String person = comment.getcFrom();
                String person2 = comment.getcTo();
                boolean f1 = true;
                boolean f2 = true;
                if (!person.equals(tno)) {
                    for (String s : personList) {
                        if (s.equals(person)) {
                            f1 = false;
                            break;
                        }
                    }
                    if (f1) {
                        personList.add(person);
                    }
                }
                if (!person2.equals(tno)) {
                    for (String s : personList) {
                        if (s.equals(person2)) {
                            f2 = false;
                            break;
                        }
                    }
                    if (f2) {
                        personList.add(person2);
                    }
                }
            }
            if(!personList.isEmpty()){
                for (String s : personList) {
                    peopleList.add(studentService.studentFindBySno(s));
                }
            }
            for (String s : personList) {
                System.out.println("personList--" + s);
            }
            for (Student student : peopleList) {
                System.out.println("peopleList--" + student.toString());
            }
            request.getSession().setAttribute("peopleList", peopleList);
            return Msg.success().add("peopleList", peopleList);
        }
        else
            return Msg.fail();
    }
    /**
     * 查询某个两个人的聊天记录（教师-学生）
     */
    @ResponseBody
    @RequestMapping("/chat")
    public Msg chat(String one,String two, HttpServletRequest request){
        List<Comment> commentList = commentService.selectByTwo(one,two);
        for (Comment comment:commentList){
            System.out.println(one+"--"+two+"--chat--" + comment.toString());
        }
        Student student = studentService.studentFindBySno(two);
        request.getSession().setAttribute("commentList", commentList);
        return Msg.success().add("student", student).add("commentList", commentList);
    }
    /**
     * 添加记录
     */
    @ResponseBody
    @RequestMapping(value="/add",method= RequestMethod.POST)
    public Msg add(String cContent,String one,String  two) {
        Comment comment = new Comment();
        comment.setcFrom(one);
        comment.setcTo(two);
        comment.setcContent(cContent);
        comment.setcIdentity(12);
        TopicSelect topicSelect = topicSelectService.selectBySno(two);
        comment.setcTsId(topicSelect.getId());
        System.out.print("add--"+comment.toString());
        commentService.insert(comment);
        return Msg.success();
    }
}