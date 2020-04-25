package edu.zzti.service.impl;

import edu.zzti.bean.TimeManger;
import edu.zzti.dao.TimeMangerMapper;
import edu.zzti.service.TimeMangerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TimeMangerServiceImpl implements TimeMangerService {
   @Autowired
    TimeMangerMapper timeMangerMapper;

    //shc
    public TimeManger findTimeMangerByCategory(Integer category) {
        return timeMangerMapper.findTimeMangerByCategory(category);
    }
}
