package edu.zzti.service.impl;

import edu.zzti.bean.Topic;
import edu.zzti.dao.TopicMapper;
import edu.zzti.service.TopicService;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class TopicServiceImpl implements TopicService {

    private TopicMapper topicMapper;

    public TopicServiceImpl(TopicMapper topicMapper) {
        this.topicMapper = topicMapper;
    }

    public Integer insertTopic(Topic topic) {
        return topicMapper.insertSelective(topic);
    }

    public Integer deleteTopicById(Integer id) {
        return topicMapper.deleteByPrimaryKey(id);
    }

    public Integer updateTopic(Topic topic) {
        return topicMapper.updateByPrimaryKeySelective(topic);
    }

    public Topic selectTopicById(Integer id) {
        return topicMapper.selectTopicById(id);
    }

    public List<Topic> selectTopicByTno(Integer tno) {
        return topicMapper.selectTopicByTno(tno);
    }






    public List<Topic> selectByName(String name) {
        return  topicMapper.selectByName(name);

    }

    public List<Topic> selectAll() {
        return topicMapper.selectAll();

    }
}




