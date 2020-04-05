
package edu.zzti.service;

import edu.zzti.bean.Student;

import java.util.HashMap;


public interface StudentService {
    Integer studentLogin(String sno,String password);
    Student studentFindBySno(String sno);
    void studentUpdateByAll(HashMap map);
    void studentUpdatePassword(String sno,String newPassword);
}

