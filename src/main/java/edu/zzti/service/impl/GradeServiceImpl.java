package edu.zzti.service.impl;

import edu.zzti.bean.Grade;
import edu.zzti.dao.GradeMapper;
import edu.zzti.service.GradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GradeServiceImpl implements GradeService {
  @Autowired
    GradeMapper gradeMapper;

    //shc
    public Grade findStudentGradeBySno(String sno, String status) {
        return gradeMapper.findStudentGradeBySno(sno, status);
    }

    //shc
}
