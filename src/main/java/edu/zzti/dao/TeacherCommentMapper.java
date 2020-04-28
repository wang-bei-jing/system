package edu.zzti.dao;

import edu.zzti.bean.TeacherComment;

public interface TeacherCommentMapper {
    int deleteByPrimaryKey(Integer tcId);

    int insert(TeacherComment record);

    int insertSelective(TeacherComment record);

    TeacherComment selectByPrimaryKey(Integer tcId);

    int updateByPrimaryKeySelective(TeacherComment record);

    int updateByPrimaryKey(TeacherComment record);
}