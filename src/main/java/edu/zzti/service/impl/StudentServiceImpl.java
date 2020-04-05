
package edu.zzti.service.impl;

import edu.zzti.bean.Student;
import edu.zzti.dao.StudentMapper;
import edu.zzti.service.StudentService;
import org.springframework.stereotype.Service;
import java.util.HashMap;
@Service
public class StudentServiceImpl implements StudentService {

   private StudentMapper studentMapper;

    public StudentServiceImpl(StudentMapper studentMapper) {
        this.studentMapper = studentMapper;
    }
    @Override
    public Integer studentLogin(String sno, String password){
        HashMap map=new HashMap();
        map.put("sno",sno);
        map.put("password",password);
        return  studentMapper.studentLogin(map);
    }
    @Override
    public Student studentFindBySno(String sno){
        return studentMapper.findBySno(sno);
    }

    @Override
    public void studentUpdateByAll(HashMap map) {
        studentMapper.updateByAll(map);
    }

    @Override
    public void studentUpdatePassword(String sno,String newPassword){
       studentMapper.updatePassword(sno, newPassword);
    }

}

