package edu.zzti.service;

import edu.zzti.bean.Comment;
import edu.zzti.bean.TeacherComment;

import java.util.List;

public interface CommentService {

    int insert(TeacherComment teacherComment);

    //xwq
    int insert(Comment comment);

    List<Comment> selectPeople(String id);

    List<Comment> selectByTwo(String one,String two);

    List<Comment> selectAll(String tno);

    int insertSelective(TeacherComment record);
    //xwq


    //shc

    //shc
}

