package edu.zzti.controller;

import edu.zzti.bean.Msg;
import edu.zzti.bean.TeacherComment;
import edu.zzti.bean.TopicSelect;
import edu.zzti.service.CommentService;
import edu.zzti.service.TopicSelectService;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("/comment")
public class CommentController {

    private final CommentService commentService;

    private final TopicSelectService topicSelectService;

    public CommentController(CommentService commentService, TopicSelectService topicSelectService) {
        this.commentService = commentService;
        this.topicSelectService = topicSelectService;
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
            for (int i = 0;i<topicSelectList.size();i++) {
                int tsId = topicSelectList.get(i).getId();
                teacherComments = commentService.selectByTsId(tsId);
                if(!teacherComments.isEmpty()){
                    for (int j = 0;j<teacherComments.size();j++) {
                        teacherCommentList.add(teacherComments.get(j));
                    }
                }
            }
        }
        for (int j = 0;j<teacherCommentList.size();j++) {
            System.out.println(teacherCommentList.get(j).toString());
        }
        request.getSession().setAttribute("teacherCommentList", teacherCommentList);
        return Msg.success().add("teacherCommentList", teacherCommentList);
    }
}