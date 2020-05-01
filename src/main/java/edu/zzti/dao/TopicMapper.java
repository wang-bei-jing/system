package edu.zzti.dao;

import edu.zzti.bean.Topic;

import java.util.List;

public interface TopicMapper {
    //xwq开始
    Integer applyTopic(Integer id);

    Integer reApplyTopic(Integer id);

    Integer acceptTopic(Integer id);

    Integer refuseTopic(Integer id);

    List<Topic> selectTopicByTno(Integer tno);

    List<Topic> selectAllWithTeacher();
    //xwq结束

    //shc
    List<Topic> selectByName(String name);

    List<Topic> selectAll();
    //shc
    int deleteByPrimaryKey(Integer id);

    int insert(Topic record);

    int insertSelective(Topic record);

    Topic selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Topic record);

    int updateByPrimaryKey(Topic record);
}