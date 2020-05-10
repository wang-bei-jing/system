package edu.zzti.dao;

import edu.zzti.bean.TopicSelect;
import edu.zzti.bean.TopicSelectExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TopicSelectMapper {

    //xwq开始
    int acceptStudent(Integer id);

    int refuseStudent(Integer id);

    List<TopicSelect> selectStudent(Integer tno);

    List<TopicSelect> selectMyStudent(Integer tno);

    List<TopicSelect> getStudent(Integer tno);

    TopicSelect selectBytTsId(Integer id);

    TopicSelect selectByTpId(Integer tpId);

    int countByTpId(Integer tpId);

    TopicSelect selectBySno(String sno);

    List<TopicSelect> selectAll();
    //xwq结束

    //shc
    List<TopicSelect> findBySSno(String sSno);

    int findExistBySSno(String sSno);

    int findExistBySSnoandtpid(@Param("sSno") String sSno, @Param("tpId") int tpId);

    int deleteBySSnoandtpid(@Param("sSno") String sSno, @Param("tpId") int tpId);

    int addSelective(TopicSelect record);

    TopicSelect myTopicSelect(@Param("sSno") String sSno, @Param("status") String status);

    Integer findTpsId(@Param("sSno") String sSno, @Param("status") String status);



    List<TopicSelect> adminFindAllStudentAndTopicAndTeacherByName(@Param("name") String name,@Param("status") String status);
    List<TopicSelect> findOneStudentWithTopicAndTeacherBySno(@Param("sno") String sno,@Param("status") String status);
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