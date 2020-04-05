package edu.zzti.service.impl;

import edu.zzti.bean.Topic;
import edu.zzti.dao.TopicMapper;
import edu.zzti.service.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class TopicServiceImpl implements TopicService {

    @Autowired
    TopicMapper topicMapper;
    @Override
    public List<Topic> selectByCname(String cname) {
        return  topicMapper.selectByCname(cname);

    }

    @Override
    public List<Topic> selectAll() {
        return topicMapper.selectAll();

    }
}
