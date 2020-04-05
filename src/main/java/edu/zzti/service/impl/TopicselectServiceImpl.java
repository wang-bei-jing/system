package edu.zzti.service.impl;



import edu.zzti.bean.Topicselect;
import edu.zzti.dao.TopicselectMapper;
import edu.zzti.service.TopicselectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class TopicselectServiceImpl implements TopicselectService {
    @Autowired
    TopicselectMapper topicselectMapper;

    @Override
    public int addTopicselect(Topicselect topicselect) {
        return topicselectMapper.insertSelective(topicselect);
    }

    @Override
    public List<Topicselect> findBySSno(String sSno) {
        return topicselectMapper.findBySSno(sSno);
    }
}
