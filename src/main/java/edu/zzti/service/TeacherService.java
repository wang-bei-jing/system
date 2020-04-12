package edu.zzti.service;

import edu.zzti.bean.Teacher;

import java.util.List;

public interface TeacherService {

    Integer countTeacher(Integer tno, String password);

    Teacher selectTeacherByTno(Integer tno);

    Integer updateByPrimaryKeySelective(Teacher teacher);

    Integer updatePassword(Integer tno, String newPassword);


    //shc
    List<Teacher> finAllTeacher();
    List<Teacher> selectAllTeacherByName(String name);
    Integer deleteTeacherByTno(Integer tno);
    int addteacher(Teacher teacher);
    int updateTeacher(Teacher teacher);


}




