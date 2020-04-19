package edu.zzti.service;

import edu.zzti.bean.GradeRecord;

import java.util.List;

public interface GradeRecordService {

    Integer add(GradeRecord gradeRecord);

    Integer del(Integer grId);

    Integer upd(GradeRecord gradeRecord);

    GradeRecord selectById(Integer grId);

    List<GradeRecord> selectByTno(Integer grType, Integer tno);

    List<GradeRecord> select(Integer grType, Integer grType1, Integer tno);

    List<GradeRecord> selectByTsId(Integer tsId, Integer grType);

    Integer selectTopId(Integer tsId, Integer grType, Integer tno);
    //分界线
}




