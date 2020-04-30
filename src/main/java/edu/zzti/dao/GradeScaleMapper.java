package edu.zzti.dao;

import edu.zzti.bean.GradeScale;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GradeScaleMapper {

    //xwq开始

    List<GradeScale> select(String gsDepartment);

    GradeScale selectBy(@Param("gsDepartment") String gsDepartment, @Param("gsStatus") Integer gsStatus);

    //xwq结束

    //shc
    List<GradeScale> findNewApplyGradeScale();
    int updateGradeScaleByIdAndGsStatus(@Param("gsId") Integer gsId, @Param("gsStatus") Integer gsStatus);
    //shc


    int deleteByPrimaryKey(Integer gsId);

    int insert(GradeScale record);

    int insertSelective(GradeScale record);

    GradeScale selectByPrimaryKey(Integer gsId);

    int updateByPrimaryKeySelective(GradeScale record);

    int updateByPrimaryKey(GradeScale record);
}