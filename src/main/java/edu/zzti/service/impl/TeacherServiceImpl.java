package edu.zzti.service.impl;

import edu.zzti.bean.Teacher;
import edu.zzti.dao.TeacherMapper;
import edu.zzti.service.TeacherService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeacherServiceImpl implements TeacherService {

    private TeacherMapper teacherMapper;

    public TeacherServiceImpl(TeacherMapper teacherMapper) {
        this.teacherMapper = teacherMapper;
    }

    //xwq开始
    public Integer countTeacher(Integer tno, String password) {
        return teacherMapper.countTeacher(tno,password);
    }

    public Teacher selectTeacherByTno(Integer tno) {
        return teacherMapper.selectTeacherByTno(tno);
    }

    public Integer updTeacher(Teacher teacher) {
        return teacherMapper.updateByPrimaryKeySelective(teacher);
    }

    public Integer updPwd(Integer tno, String newPassword) {
        return teacherMapper.updPwd(tno, newPassword);
    }
    //xwq结束

    //shc
    public List<Teacher> finAllTeacher() {
        return teacherMapper.finAllTeacher();
    }

    public List<Teacher> selectAllTeacherByName(String name) {
        return teacherMapper.selectAllTeacherByName(name);
    }

    public Integer deleteTeacherByTno(Integer tno) {
        System.out.println("进来咯+"+tno);
        return teacherMapper.deleteTeacherByTno(tno);
    }

    public int addteacher(Teacher teacher) {
        return teacherMapper.insertSelective(teacher);
    }

    public int updateTeacher(Teacher teacher) {
        return teacherMapper.updateByPrimaryKeySelective(teacher);
    }

    public int batchInsertTeacher(List<Teacher> teacherList) {
        return teacherMapper.batchInsertTeacher(teacherList);
    }
}




