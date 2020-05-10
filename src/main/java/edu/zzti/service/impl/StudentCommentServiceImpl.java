package edu.zzti.service.impl;

import edu.zzti.bean.StudentComment;
import edu.zzti.dao.StudentCommentMapper;
import edu.zzti.service.StudentCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentCommentServiceImpl implements StudentCommentService {
    final StudentCommentMapper studentCommentMapper;

    //xwq
    public StudentCommentServiceImpl(StudentCommentMapper studentCommentMapper) {
        this.studentCommentMapper = studentCommentMapper;
    }

    public List<StudentComment> selectByTno(Integer tno) {
        return studentCommentMapper.selectByTno(tno);
    }

    public List<StudentComment> findAllBySno(String sno) {
        return studentCommentMapper.findAllBySno(sno);
    }

    public StudentComment selectById(Integer scId) {
        return studentCommentMapper.selectById(scId);
    }
    //xwq

    //shc
    public List<StudentComment> findAllCommentsBySnoAndStatus(String sno) {
        return studentCommentMapper.findAllCommentsBySnoAndStatus(sno);
    }

    public List<StudentComment> findTopCommentsBySno(String sno) {
        return studentCommentMapper.findTopCommentsBySno(sno);
    }

    public int insertSelective(StudentComment record) {
        return studentCommentMapper.insertSelective(record);
    }

    //shc
}
