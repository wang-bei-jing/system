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

    //xwq开始
    public Integer insertTopic(Topic topic) {
        return topicMapper.insertSelective(topic);
    }

    public Integer deleteTopicById(Integer id) {
        return topicMapper.deleteByPrimaryKey(id);
    }

    public Integer updateTopic(Topic topic) {
        return topicMapper.updateByPrimaryKeySelective(topic);
    }

    public Integer applyTopic(Integer id) {
        return topicMapper.applyTopic(id);
    }

    public Integer reApplyTopic(Integer id) {
        return topicMapper.reApplyTopic(id);
    }

    public Integer acceptTopic(Integer id) {
        return topicMapper.acceptTopic(id);
    }

    public Integer refuseTopic(Integer id) {
        return topicMapper.refuseTopic(id);
    }

    public Topic selectTopicById(Integer id) {
        return topicMapper.selectByPrimaryKey(id);
    }

    public List<Topic> selectTopicByTno(Integer tno) {
        return topicMapper.selectTopicByTno(tno);
    }

    public List<Topic> selectAllWithTeacher() {
        return topicMapper.selectAllWithTeacher();
    }
    //xwq结束

    public List<Topic> selectByName(String name) {
        return  topicMapper.selectByName(name);

    }

    public List<Topic> selectAll() {
        return topicMapper.selectAll();

    }
}




