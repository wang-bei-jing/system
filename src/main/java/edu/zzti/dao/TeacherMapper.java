package edu.zzti.dao;

import edu.zzti.bean.Teacher;
import edu.zzti.bean.TeacherExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TeacherMapper {

    Integer updatePassword(@Param("tno") Integer tno, @Param("newPassword") String newPassword);

    Teacher selectTeacherByTno(Integer tno);

    Integer countTeacher(@Param("tno") Integer tno, @Param("password") String password);

    //shc
    List<Teacher> finAllTeacher();
    List<Teacher> selectAllTeacherByName(String name);
    Integer deleteTeacherByTno(Integer tno);
    //shc

    long countByExample(TeacherExample example);

    int deleteByExample(TeacherExample example);

    int deleteByPrimaryKey(Integer tno);

    int insert(Teacher record);

    int insertSelective(Teacher record);

    List<Teacher> selectByExample(TeacherExample example);

    Teacher selectByPrimaryKey(Integer tno);

    int updateByExampleSelective(@Param("record") Teacher record, @Param("example") TeacherExample example);

    int updateByExample(@Param("record") Teacher record, @Param("example") TeacherExample example);

    int updateByPrimaryKeySelective(Teacher record);

    int updateByPrimaryKey(Teacher record);

}