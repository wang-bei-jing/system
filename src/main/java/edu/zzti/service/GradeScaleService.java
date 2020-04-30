package edu.zzti.service;

import edu.zzti.bean.GradeScale;

import java.util.List;

public interface GradeScaleService {

    //xwq开始
    int add(GradeScale gradeScale);

    int del(Integer gsId);

    int upd(GradeScale gradeScale);

    GradeScale selectById(Integer gsId);

    List<GradeScale> select(String gsDepartment);

    GradeScale selectBy(String gsDepartment,Integer gsStatus);
    //xwq结束

    //shc
    List<GradeScale> findNewApplyGradeScale();
    int updateGradeScaleByIdAndGsStatus(Integer gsId,Integer gsStatus);
    //shc
}




