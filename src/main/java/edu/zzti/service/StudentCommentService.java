package edu.zzti.service;

import edu.zzti.bean.StudentComment;

import java.util.List;

public interface StudentCommentService {

    //xwq
    List<StudentComment> selectByTno(Integer tno);

    List<StudentComment> findAllBySno(String sno);

    StudentComment selectById(Integer scId);
    //xwq

    //shc
    List<StudentComment> findAllCommentsBySnoAndStatus(String sno);
    List<StudentComment> findTopCommentsBySno(String sno);

    int insertSelective(StudentComment record);
    //shc
}

