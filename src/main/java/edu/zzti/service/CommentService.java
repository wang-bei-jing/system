package edu.zzti.service;

import edu.zzti.bean.Comment;
import edu.zzti.bean.StudentComment;
import edu.zzti.bean.TeacherComment;

import java.util.List;

public interface CommentService {

    //xwq
    int insert(Comment comment);

    List<Comment> selectPeople(String id);

    List<Comment> selectByTwo(String one,String two);

    List<Comment> selectAll(String tno);

    List<TeacherComment> selectByTsId(Integer tsId);

    int insertSelective(TeacherComment record);
    //xwq


    //shc

    //shc
}

