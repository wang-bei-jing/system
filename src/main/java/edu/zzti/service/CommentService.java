package edu.zzti.service;

import edu.zzti.bean.TeacherComment;

public interface CommentService {

    //xwq
    int insert(TeacherComment teacherComment);

    int del(Integer tcId);

    int upd(TeacherComment teacherComment);

    int insertSelective(TeacherComment record);
    //xwq
}

