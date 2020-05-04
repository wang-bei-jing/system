package edu.zzti.service.impl;

import edu.zzti.bean.Comment;
import edu.zzti.bean.TeacherComment;
import edu.zzti.dao.CommentMapper;
import edu.zzti.dao.TeacherCommentMapper;
import edu.zzti.service.CommentService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    private TeacherCommentMapper teacherCommentMapper;

    private CommentMapper commentMapper;

    //xwq
    public CommentServiceImpl(TeacherCommentMapper teacherCommentMapper, CommentMapper commentMapper) {
        this.teacherCommentMapper = teacherCommentMapper;
        this.commentMapper = commentMapper;
    }

    public int insert(TeacherComment teacherComment) {
        return teacherCommentMapper.insertSelective(teacherComment);
    }

    public int del(Integer tcId) {
        return teacherCommentMapper.deleteByPrimaryKey(tcId);
    }

    public int upd(TeacherComment teacherComment) {
        return teacherCommentMapper.updateByPrimaryKeySelective(teacherComment);
    }

    public int insert(Comment comment) {
        return commentMapper.insertSelective(comment);
    }

    public List<Comment> selectPeople(String id) {
        return commentMapper.selectPeople(id);
    }

    public List<Comment> selectByTwo(String one, String two) {
        return commentMapper.selectByTwo(one,two);
    }

    public List<Comment> selectAll(String id) {
        return commentMapper.selectAll(id);
    }

    public int insertSelective(TeacherComment teacherComment) {
        return teacherCommentMapper.insertSelective(teacherComment);
    }
    //xwq


    //shc

    //shc
}
