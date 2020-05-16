package edu.zzti.service.impl;

import edu.zzti.bean.TeacherComment;
import edu.zzti.dao.TeacherCommentMapper;
import edu.zzti.service.CommentService;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImpl implements CommentService {

    private final TeacherCommentMapper teacherCommentMapper;

    //xwq
    public CommentServiceImpl(TeacherCommentMapper teacherCommentMapper) {
        this.teacherCommentMapper = teacherCommentMapper;
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

    public int insertSelective(TeacherComment teacherComment) {
        return teacherCommentMapper.insertSelective(teacherComment);
    }
    //xwq
}
