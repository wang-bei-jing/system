package edu.zzti.service;

import edu.zzti.bean.Teacher;

import java.util.List;

public interface TeacherService {

    //xwq开始
    Integer countTeacher(Integer tno, String password);

    Teacher selectTeacherByTno(Integer tno);

    Integer updTeacher(Teacher teacher);

    Integer updPwd(Integer tno, String newPassword);
    //xwq结束

    //shc
    List<Teacher> finAllTeacher();

    List<Teacher> selectAllTeacherByName(String name);

    Integer deleteTeacherByTno(Integer tno);

    int addteacher(Teacher teacher);

    int updateTeacher(Teacher teacher);
    int batchInsertTeacher(List<Teacher> teacherList);
}




