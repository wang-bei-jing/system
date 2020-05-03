package edu.zzti.dao;

import edu.zzti.bean.WeekDocument;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface WeekDocumentMapper {

    //xwq开始

    List<WeekDocument> findBy(@Param("tpsId") Integer tpsId, @Param("category")String category);

    WeekDocument selectById(Integer dId);
    //xwq结束

    //shc
    int addWeekDocumentSelective(WeekDocument weekDocument);

    List<WeekDocument> findByCateory(@Param("tpsId") Integer tpsId, @Param("category")String category);
    //shc
    int deleteByPrimaryKey(Integer dId);

    int insert(WeekDocument record);

    int insertSelective(WeekDocument record);

    WeekDocument selectByPrimaryKey(Integer dId);

    int updateByPrimaryKeySelective(WeekDocument record);

    int updateByPrimaryKey(WeekDocument record);
}