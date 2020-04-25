package edu.zzti.dao;

import edu.zzti.bean.Student;
import edu.zzti.bean.StudentExample;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface StudentMapper {


    //xwq开始
    int accept(String sno);
    //xwq结束

    //shc
    int studentLogin(HashMap map);

    Student findBySno(String sno);

    int updateByAll(HashMap map);

    void updatePassword(@Param("sno") String sno,@Param("password") String password);

    List<Student> findAllStudent();

    List<Student> findAllStudentByName(String name);

    Integer studentDel(String sno);

    List<Student> findAllStudentByStatus(String status);
    int batchInsert(List<Student> studentList);
    //shc

    long countByExample(StudentExample example);

    int deleteByExample(StudentExample example);

    int deleteByPrimaryKey(String sno);

    int insert(Student record);

    int insertSelective(Student record);

    List<Student> selectByExample(StudentExample example);

    Student selectByPrimaryKey(String sno);

    int updateByExampleSelective(@Param("record") Student record, @Param("example") StudentExample example);

    int updateByExample(@Param("record") Student record, @Param("example") StudentExample example);

    int updateByPrimaryKeySelective(Student record);

    int updateByPrimaryKey(Student record);
}