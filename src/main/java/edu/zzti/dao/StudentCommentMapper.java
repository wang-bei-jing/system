package edu.zzti.dao;

import edu.zzti.bean.StudentComment;

import java.util.List;

public interface StudentCommentMapper {

    //xwq开始
    List<StudentComment> findAllBySno(String sno);
    //xwq结束

    //shc
    List<StudentComment> findAllCommentsBySnoAndStatus(String sno);
    //shc
    int deleteByPrimaryKey(Integer scId);

    int insert(StudentComment record);

    int insertSelective(StudentComment record);

    StudentComment selectByPrimaryKey(Integer scId);

    int updateByPrimaryKeySelective(StudentComment record);

    int updateByPrimaryKey(StudentComment record);
}