package edu.zzti.controller;

import edu.zzti.bean.*;
import edu.zzti.service.CommentService;
import edu.zzti.service.StudentService;
import edu.zzti.service.TopicSelectService;
import org.springframework.stereotype.Controller;

import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/comment")
public class CommentController {

    private final CommentService commentService;

    private final TopicSelectService topicSelectService;

    private final StudentService studentService;

    public CommentController(CommentService commentService, TopicSelectService topicSelectService, StudentService studentService) {
        this.commentService = commentService;
        this.topicSelectService = topicSelectService;
        this.studentService = studentService;
    }

    /**
     * 查询我的学生
     */
    @ResponseBody
    @RequestMapping("/select/{tno}")
    public Msg select(@PathVariable("tno")Integer tno, HttpServletRequest request){
        List<TopicSelect> topicSelectList = topicSelectService.getStudent(tno);
        List<TeacherComment> teacherCommentList = new ArrayList<TeacherComment>();
        List<TeacherComment> teacherComments;
        if(!topicSelectList.isEmpty()){
            for (TopicSelect topicSelect : topicSelectList) {
                int tsId = topicSelect.getId();
                teacherComments = commentService.selectByTsId(tsId);
                if (!teacherComments.isEmpty()) {
                    teacherCommentList.addAll(teacherComments);
                }
            }
        }
        for (TeacherComment teacherComment : teacherCommentList) {
            System.out.println(teacherComment.toString());
        }
        request.getSession().setAttribute("teacherCommentList", teacherCommentList);
        return Msg.success().add("teacherCommentList", teacherCommentList);
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