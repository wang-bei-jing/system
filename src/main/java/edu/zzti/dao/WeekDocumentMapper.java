package edu.zzti.dao;

import edu.zzti.bean.WeekDocument;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface WeekDocumentMapper {

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