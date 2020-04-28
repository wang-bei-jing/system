package edu.zzti.service.impl;

import edu.zzti.bean.StudentComment;
import edu.zzti.dao.StudentCommentMapper;
import edu.zzti.service.StudentCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentCommentServiceImpl implements StudentCommentService {
    @Autowired
    StudentCommentMapper studentCommentMapper;
    //xwq

    //xwq


    //shc
    public List<StudentComment> findAllCommentsBySnoAndStatus(String sno) {
        return studentCommentMapper.findAllCommentsBySnoAndStatus(sno);
    }

    public int insertSelective(StudentComment record) {
        return studentCommentMapper.insertSelective(record);
    }

    //shc
}
