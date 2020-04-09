package edu.zzti.service.impl;

import edu.zzti.bean.TopicSelect;
import edu.zzti.dao.TopicSelectMapper;
import edu.zzti.service.TopicSelectService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TopicSelectServiceImpl implements TopicSelectService {

    private TopicSelectMapper topicSelectMapper;

    public TopicSelectServiceImpl(TopicSelectMapper TopicSelectMapper) {
        this.topicSelectMapper = TopicSelectMapper;
    }

    public int acceptStudent(Integer id) {
        return topicSelectMapper.acceptStudent(id);
    }

    public List<TopicSelect> selectStudentByTno(Integer tno) {
        return topicSelectMapper.selectStudentByTno(tno);
    }






    public int addTopicSelect(TopicSelect topicSelect) {

        return topicSelectMapper.addSelective(topicSelect);
    }


    public List<TopicSelect> findBySSno(String sSno) {
        return topicSelectMapper.findBySSno(sSno);
    }


    public int findExistBySSno(String sSno) {
        return topicSelectMapper.findExistBySSno(sSno);
    }


    public int findExistBySSnoandtpid(String sSno, int tpId) {
        return topicSelectMapper.findExistBySSnoandtpid(sSno, tpId);
    }


    public int deleteBySSnoandtpid(String sSno, int tpId) {
        return topicSelectMapper.deleteBySSnoandtpid(sSno, tpId);
    }

    public TopicSelect myTopicSelect(String sSno, String status) {
        return topicSelectMapper.myTopicSelect(sSno, status);
    }

    public TopicSelect myWeekfile(String sSno, String status) {
        return topicSelectMapper.myWeekfile(sSno, status);
    }
}




