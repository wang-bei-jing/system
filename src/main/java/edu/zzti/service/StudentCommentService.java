package edu.zzti.service;

import edu.zzti.bean.Admin;
import edu.zzti.bean.StudentComment;

import java.util.HashMap;
import java.util.List;

public interface StudentCommentService {
    //xwq

    //xwq


    //shc
    List<StudentComment> findAllCommentsBySnoAndStatus(String sno);
    int insertSelective(StudentComment record);
    //shc
}

