package edu.zzti.service;

import edu.zzti.bean.Student;

import java.util.HashMap;
import java.util.List;

public interface StudentService {

    List<Student> selectStudentByTno(Integer tno);


    //shc
    Integer studentLogin(String sno,String password);
    Student studentFindBySno(String sno);
    void studentUpdateByAll(HashMap map);
    void studentUpdatePassword(String sno,String newPassword);


}




