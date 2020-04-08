package edu.zzti.dao;

import edu.zzti.bean.Topic;
import edu.zzti.bean.TopicExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TopicMapper {

    Topic selectTopicById(Integer id);

    List<Topic> selectTopicByTno(Integer tno);



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