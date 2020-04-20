package edu.zzti.service;

import edu.zzti.bean.GradeScale;

public interface GradeScaleService {

    //xwq开始
    int add(GradeScale gradeScale);

    int del(Integer gsId);

    int upd(GradeScale gradeScale);

    GradeScale selectByGsStatus(Integer gsStatus);
    //xwq结束
}




