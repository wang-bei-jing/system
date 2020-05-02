package edu.zzti.service.impl;

import edu.zzti.bean.TeacherComment;
import edu.zzti.dao.TeacherCommentMapper;
import edu.zzti.service.CommentService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {
    final TeacherCommentMapper teacherCommentMapper;

    public CommentServiceImpl(TeacherCommentMapper teacherCommentMapper) {
        this.teacherCommentMapper = teacherCommentMapper;
    }

    //xwq
    public List<TeacherComment> selectByTsId(Integer tsId) {
        return teacherCommentMapper.selectByTsId(tsId);
    }

    public int insertSelective(TeacherComment teacherComment) {
        return teacherCommentMapper.insertSelective(teacherComment);
    }
    //xwq


    //shc

    //shc
}
