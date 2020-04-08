package edu.zzti.service;

import edu.zzti.bean.TopicSelect;

import java.util.List;

public interface TopicSelectService {

    int acceptStudent(Integer id);

    List<TopicSelect> selectStudentByTno(Integer tno);





    //shc
    int addTopicSelect(TopicSelect topicSelect);
    List<TopicSelect> findBySSno(String sSno);
    int findExistBySSno(String sSno);
    int findExistBySSnoandtpid(String sSno,int tpId);
    int deleteBySSnoandtpid(String sSno,int tpId);
    TopicSelect myTopicSelect(String sSno,String status);








}




