package edu.zzti.service;

import edu.zzti.bean.Grade;

import java.util.List;

public interface GradeService {

    //xwq开始
    int add(Grade grade);

    int del(Integer gId);

    int upd(Grade grade);

    Grade selectByGId(Integer gId);

    Grade selectByGTsId(Integer gTsId);

    List<Grade> student(Integer tno);
    //xwq结束

    //shc
    Grade findStudentGradeBySnoAndStatus(String sno, String status);
    List<Grade> findStudentGradeByBoundary(Integer min, Integer max);
    List<Grade> findStudentGradeBySno(String sno);
    List<Grade> adminGradeFindByTeacherName(String sno);
    //shc
}
