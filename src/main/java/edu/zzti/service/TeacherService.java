package edu.zzti.service;

import edu.zzti.bean.Teacher;

public interface TeacherService {

    Integer countTeacher(Integer tno, String password);

    Teacher selectTeacherByTno(Integer tno);

    Integer updateByPrimaryKeySelective(Teacher teacher);

    Integer updatePassword(Integer tno, String newPassword);

}




