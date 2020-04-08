package edu.zzti.service.impl;

import edu.zzti.bean.Teacher;
import edu.zzti.dao.TeacherMapper;
import edu.zzti.service.TeacherService;
import org.springframework.stereotype.Service;

@Service
public class TeacherServiceImpl implements TeacherService {

    private TeacherMapper teacherMapper;

    public TeacherServiceImpl(TeacherMapper teacherMapper) {
        this.teacherMapper = teacherMapper;
    }


    public Integer countTeacher(Integer tno, String password) {
        return teacherMapper.countTeacher(tno,password);
    }

    public Teacher selectTeacherByTno(Integer tno) {
        return teacherMapper.selectTeacherByTno(tno);
    }

    public Integer updateByPrimaryKeySelective(Teacher teacher) {
        return teacherMapper.updateByPrimaryKeySelective(teacher);
    }

    public Integer updatePassword(Integer tno, String newPassword) {
        return teacherMapper.updatePassword(tno, newPassword);
    }
}




