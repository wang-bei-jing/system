package edu.zzti.dao;

import edu.zzti.bean.GradeScale;

public interface GradeScaleMapper {

    GradeScale selectByGsStatus(Integer gsStatus);

    int deleteByPrimaryKey(Integer gsId);

    int insert(GradeScale record);

    int insertSelective(GradeScale record);

    GradeScale selectByPrimaryKey(Integer gsId);

    int updateByPrimaryKeySelective(GradeScale record);

    int updateByPrimaryKey(GradeScale record);
}