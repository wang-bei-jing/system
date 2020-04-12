package edu.zzti.dao;

import edu.zzti.bean.WeekDocument;
import edu.zzti.bean.WeekDocumentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface WeekDocumentMapper {

    //shc
    int addWeekDocumentSelective(WeekDocument weekDocument);
    List<WeekDocument> findByCateory(@Param("tpsId") Integer tpsId,@Param("category")String category);
    //shc
    long countByExample(WeekDocumentExample example);

    int deleteByExample(WeekDocumentExample example);

    int deleteByPrimaryKey(Integer dId);

    int insert(WeekDocument record);

    int insertSelective(WeekDocument record);

    List<WeekDocument> selectByExample(WeekDocumentExample example);

    WeekDocument selectByPrimaryKey(Integer dId);

    int updateByExampleSelective(@Param("record") WeekDocument record, @Param("example") WeekDocumentExample example);

    int updateByExample(@Param("record") WeekDocument record, @Param("example") WeekDocumentExample example);

    int updateByPrimaryKeySelective(WeekDocument record);

    int updateByPrimaryKey(WeekDocument record);
}