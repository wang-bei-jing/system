package edu.zzti.service;

import edu.zzti.bean.Topic;

import java.util.List;

public interface TopicService {

    Integer insertTopic(Topic topic);
    Integer deleteTopicById(Integer id);
    Integer updateTopic(Topic topic);
    Topic selectTopicById(Integer id);
    List<Topic> selectTopicByTno(Integer tno);

    //shc
    List<Topic> selectByName(String name);
    List<Topic> selectAll();



}




