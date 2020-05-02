package edu.zzti.service;

import edu.zzti.bean.StudentComment;
import edu.zzti.bean.TeacherComment;

import java.util.List;

public interface CommentService {

    //xwq
    List<TeacherComment> selectByTsId(Integer tsId);

    int insertSelective(TeacherComment record);
    //xwq


    //shc

    //shc
}

