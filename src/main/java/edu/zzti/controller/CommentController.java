package edu.zzti.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import edu.zzti.bean.*;
import edu.zzti.service.CommentService;
import edu.zzti.service.StudentCommentService;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {

    private final StudentCommentService studentCommentService;

    private final CommentService commentService;

    public CommentController(StudentCommentService studentCommentService,CommentService commentService) {
        this.studentCommentService = studentCommentService;
        this.commentService = commentService;
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
}