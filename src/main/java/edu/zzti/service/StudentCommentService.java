package edu.zzti.service;

import edu.zzti.bean.StudentComment;

import java.util.List;

public interface StudentCommentService {

    //xwq
    List<StudentComment> findAllBySno(String sno);
    //xwq

    //shc
    List<StudentComment> findAllCommentsBySnoAndStatus(String sno);

    int insertSelective(StudentComment record);
    //shc
}

