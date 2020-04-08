package edu.zzti.dao;

import edu.zzti.bean.TopicSelect;
import edu.zzti.bean.TopicSelectExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TopicSelectMapper {

    int acceptStudent(Integer id);

    List<TopicSelect> selectStudentByTno(Integer tno);

    //shc
    List<TopicSelect> findBySSno(String sSno);
    int findExistBySSno(String sSno);
    int findExistBySSnoandtpid(@Param("sSno") String sSno, @Param("tpId") int tpId);
    int deleteBySSnoandtpid(@Param("sSno") String sSno, @Param("tpId") int tpId);
    int addSelective(TopicSelect record);
    TopicSelect myTopicSelect(@Param("sSno") String sSno, @Param("status") String status);
    //shc
    long countByExample(TopicSelectExample example);

    int deleteByExample(TopicSelectExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TopicSelect record);

    int insertSelective(TopicSelect record);

    List<TopicSelect> selectByExample(TopicSelectExample example);

    TopicSelect selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TopicSelect record, @Param("example") TopicSelectExample example);

    int updateByExample(@Param("record") TopicSelect record, @Param("example") TopicSelectExample example);

    int updateByPrimaryKeySelective(TopicSelect record);

    int updateByPrimaryKey(TopicSelect record);
}