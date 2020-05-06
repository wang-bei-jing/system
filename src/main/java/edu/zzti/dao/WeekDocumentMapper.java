package edu.zzti.dao;

import edu.zzti.bean.WeekDocument;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface WeekDocumentMapper {

    //xwq开始
    List<WeekDocument> findTopic(@Param("dTId") Integer dTId, @Param("category")String category);

    List<WeekDocument> findTopicBy(@Param("tno") Integer tno, @Param("category")String category);

    List<WeekDocument> findBy(@Param("tno") Integer tno, @Param("category")String category);

    List<WeekDocument> findAll(String category);

    WeekDocument selectById(Integer dId);
    //xwq结束

    //shc
    int addWeekDocumentSelective(WeekDocument weekDocument);

    List<WeekDocument> findByCategory(@Param("tpsId") Integer tpsId, @Param("category")String category);
    //shc

    int deleteByPrimaryKey(Integer dId);

    int insert(WeekDocument record);

    int insertSelective(WeekDocument record);

    WeekDocument selectByPrimaryKey(Integer dId);

    int updateByPrimaryKeySelective(WeekDocument record);

    int updateByPrimaryKey(WeekDocument record);
}