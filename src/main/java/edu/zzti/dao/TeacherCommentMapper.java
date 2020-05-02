package edu.zzti.dao;

import edu.zzti.bean.TeacherComment;

import java.util.List;

public interface TeacherCommentMapper {

    List<TeacherComment> selectByTsId(Integer tsId);

    int deleteByPrimaryKey(Integer tcId);

    int insert(TeacherComment record);

    int insertSelective(TeacherComment record);

    TeacherComment selectByPrimaryKey(Integer tcId);

    int updateByPrimaryKeySelective(TeacherComment record);

    int updateByPrimaryKey(TeacherComment record);
}