package edu.zzti.service.impl;

import edu.zzti.bean.Student;
import edu.zzti.dao.StudentMapper;
import edu.zzti.service.StudentService;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {

    private StudentMapper studentMapper;

    public StudentServiceImpl(StudentMapper studentMapper) {
        this.studentMapper = studentMapper;
    }

    //xwq开始
    public Integer accept(String sno) {
        return studentMapper.accept(sno);
    }
    //xwq结束

    public Integer studentLogin(String sno, String password){
        HashMap map=new HashMap();
        map.put("sno",sno);
        map.put("password",password);
        return  studentMapper.studentLogin(map);
    }

    public Student studentFindBySno(String sno){
        return studentMapper.findBySno(sno);
    }

    public void studentUpdateByAll(HashMap map) {
        studentMapper.updateByAll(map);
    }

    public void studentUpdatePassword(String sno,String newPassword){
        studentMapper.updatePassword(sno, newPassword);
    }

    public List<Student> findAllStudent() {
        return studentMapper.findAllStudent();
    }

    public List<Student> findAllStudentByName(String name) {
        return studentMapper.findAllStudentByName(name);
    }

    public int studentDel(String sno) {
        return studentMapper.studentDel(sno);
    }

    public int studentAdd(Student student) {
        return studentMapper.insertSelective(student);
    }

    public int studentUpdSelective(Student student) {
        return studentMapper.updateByPrimaryKeySelective(student);

    }

    public List<Student> findAllStudentByStatus(String status) {
        return studentMapper.findAllStudentByStatus(status);
    }
}




