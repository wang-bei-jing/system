package edu.zzti.dao;

import edu.zzti.bean.Topic;
import edu.zzti.bean.TopicExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

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

    long countByExample(TopicExample example);

    int deleteByExample(TopicExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Topic record);

    int insertSelective(Topic record);

    List<Topic> selectByExample(TopicExample example);

    Topic selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Topic record, @Param("example") TopicExample example);

    int updateByExample(@Param("record") Topic record, @Param("example") TopicExample example);

    int updateByPrimaryKeySelective(Topic record);

    int updateByPrimaryKey(Topic record);
}