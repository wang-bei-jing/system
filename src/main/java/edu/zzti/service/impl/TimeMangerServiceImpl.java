package edu.zzti.service.impl;

import edu.zzti.bean.TimeManger;
import edu.zzti.dao.TimeMangerMapper;
import edu.zzti.service.TimeMangerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TimeMangerServiceImpl implements TimeMangerService {
   final TimeMangerMapper timeMangerMapper;

    public TimeMangerServiceImpl(TimeMangerMapper timeMangerMapper) {
        this.timeMangerMapper = timeMangerMapper;
    }

    //xwq
    public List<TimeManger> findByCategory(Integer category) {
        return timeMangerMapper.findByCategory(category);
    }

    public TimeManger selectByPrimaryKey(Integer tiId) {
        return timeMangerMapper.selectByPrimaryKey(tiId);
    }
    //xwq

    //shc
    public TimeManger findTimeMangerByCategory(Integer category) {
        return timeMangerMapper.findTimeMangerByCategory(category);
    }

    public int insertSelective(TimeManger record) {
        return timeMangerMapper.insertSelective(record);
    }

    public int updateByPrimaryKeySelective(TimeManger record) {
        return timeMangerMapper.updateByPrimaryKeySelective(record);
    }

    public int deleteByPrimaryKey(Integer tiId) {
        return timeMangerMapper.deleteByPrimaryKey(tiId);
    }
}
