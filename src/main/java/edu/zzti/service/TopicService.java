package edu.zzti.service;

import edu.zzti.bean.Topic;

import java.util.List;

public interface TopicService {

    //xwq开始
    Integer insertTopic(Topic topic);

    Integer deleteTopicById(Integer id);

    Integer updateTopic(Topic topic);

    Integer applyTopic(Integer id);

    Integer reApplyTopic(Integer id);

    Integer acceptTopic(Integer id);

    Integer refuseTopic(Integer id);

    Topic selectTopicById(Integer id);

    List<Topic> selectTopicByTno(Integer tno);

    List<Topic> selectAllWithTeacher();
    //xwq结束

    //shc
    List<Topic> selectByName(String name);

    List<Topic> selectAll();
}




