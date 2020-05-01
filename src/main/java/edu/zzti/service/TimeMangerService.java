package edu.zzti.service;

import edu.zzti.bean.TimeManger;

import java.util.List;

public interface TimeMangerService {

    //xwq
    List<TimeManger> findByCategory(Integer category);

    TimeManger selectByPrimaryKey(Integer tiId);
    //xwq

    //shc
    TimeManger findTimeMangerByCategory(Integer category);

    int insertSelective(TimeManger record);

    int updateByPrimaryKeySelective(TimeManger record);

    int deleteByPrimaryKey(Integer tiId);
    //shc
}
