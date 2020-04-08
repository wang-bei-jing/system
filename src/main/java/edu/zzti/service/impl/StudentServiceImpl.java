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

    public List<Student> selectStudentByTno(Integer tno) {
        return studentMapper.selectStudentByTno(tno);
    }






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


}




