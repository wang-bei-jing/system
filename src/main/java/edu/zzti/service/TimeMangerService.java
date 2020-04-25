package edu.zzti.service;

import edu.zzti.bean.TimeManger;

public interface TimeMangerService {


    //shc
    TimeManger findTimeMangerByCategory(Integer category);
    int insertSelective(TimeManger record);
    int updateByPrimaryKeySelective(TimeManger record);
    int deleteByPrimaryKey(Integer tiId);
    //shc
}
