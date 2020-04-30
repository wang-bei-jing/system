package edu.zzti.dao;

import edu.zzti.bean.TimeManger;

import java.util.List;

public interface TimeMangerMapper {

    //xwq
    List<TimeManger> findByCategory(Integer category);
    //xwq

    //shc
    TimeManger findTimeMangerByCategory(Integer category);
    //shc
    int deleteByPrimaryKey(Integer tiId);

    int insert(TimeManger record);

    int insertSelective(TimeManger record);

    TimeManger selectByPrimaryKey(Integer tiId);

    int updateByPrimaryKeySelective(TimeManger record);

    int updateByPrimaryKey(TimeManger record);

}