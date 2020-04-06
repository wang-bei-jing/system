package edu.zzti.dao;

import edu.zzti.bean.Topic;
import edu.zzti.bean.Topicselect;
import edu.zzti.bean.TopicselectExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TopicselectMapper {
    List<Topicselect> findBySSno(String sSno);
    int findExistBySSno(String sSno);
    int findExistBySSnoandtpid(@Param("sSno") String sSno, @Param("tpId") int tpId);
    int deleteBySSnoandtpid(@Param("sSno") String sSno, @Param("tpId") int tpId);
    long countByExample(TopicselectExample example);

    int deleteByExample(TopicselectExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Topicselect record);

    int insertSelective(Topicselect record);

    List<Topicselect> selectByExample(TopicselectExample example);

    Topicselect selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Topicselect record, @Param("example") TopicselectExample example);

    int updateByExample(@Param("record") Topicselect record, @Param("example") TopicselectExample example);

    int updateByPrimaryKeySelective(Topicselect record);

    int updateByPrimaryKey(Topicselect record);
}