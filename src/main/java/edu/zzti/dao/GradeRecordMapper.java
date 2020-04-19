package edu.zzti.dao;

import edu.zzti.bean.GradeRecord;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GradeRecordMapper {

    //xwq开始
    GradeRecord selectById(Integer grId);

    Integer selectTopId(@Param("tsId") Integer tsId, @Param("grType") Integer grType, @Param("tno") Integer tno);

    List<GradeRecord> select(@Param("grType") Integer grType, @Param("grType1") Integer grType1, @Param("tno") Integer tno);

    List<GradeRecord> selectByTno(@Param("grType") Integer grType, @Param("tno") Integer tno);

    List<GradeRecord> selectByTsId(@Param("tsId") Integer tsId, @Param("grType") Integer grType);

    //xwq结束

    //shc
    //shc

    int deleteByPrimaryKey(Integer grId);

    int insert(GradeRecord record);

    int insertSelective(GradeRecord record);

    GradeRecord selectByPrimaryKey(Integer grId);

    int updateByPrimaryKeySelective(GradeRecord record);

    int updateByPrimaryKey(GradeRecord record);
}