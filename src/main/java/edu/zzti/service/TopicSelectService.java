package edu.zzti.service;

import edu.zzti.bean.TopicSelect;

import java.util.List;

public interface TopicSelectService {

    //xwq开始
    List<TopicSelect> selectAll();

    TopicSelect selectBytTsId(Integer id);

    TopicSelect selectBySno(String sno);

    TopicSelect selectByTpId(Integer tpId);

    int countByTpId(Integer tpId);

    int acceptStudent(Integer id);

    int refuseStudent(Integer id);

    List<TopicSelect> selectStudent(Integer tno);

    List<TopicSelect> selectMyStudent(Integer tno);

    List<TopicSelect> getStudent(Integer tno);
    //xwq结束

    //shc
    int addTopicSelect(TopicSelect topicSelect);

    List<TopicSelect> findBySSno(String sSno);

    int findExistBySSno(String sSno);

    int findExistBySSnoandtpid(String sSno,int tpId);

    int deleteBySSnoandtpid(String sSno,int tpId);

    TopicSelect myTopicSelect(String sSno,String status);

    TopicSelect myWeekfile(String sSno,String status);

    List<TopicSelect> adminFindAllStudentAndTopicAndTeacher(String status);

    List<TopicSelect> adminFindAllStudentAndTopicAndTeacherByName(String name,String status);
}




