package edu.zzti.service.impl;

import edu.zzti.bean.TopicSelect;
import edu.zzti.dao.TopicSelectMapper;
import edu.zzti.service.TopicSelectService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TopicSelectServiceImpl implements TopicSelectService {

    private TopicSelectMapper TopicSelectMapper;

    public TopicSelectServiceImpl(TopicSelectMapper TopicSelectMapper) {
        this.TopicSelectMapper = TopicSelectMapper;
    }

    public int acceptStudent(Integer id) {
        return TopicSelectMapper.acceptStudent(id);
    }

    public List<TopicSelect> selectStudentByTno(Integer tno) {
        return TopicSelectMapper.selectStudentByTno(tno);
    }






    public int addTopicSelect(TopicSelect topicSelect) {
        System.out.println("实现类");
        return TopicSelectMapper.addSelective(topicSelect);
    }


    public List<TopicSelect> findBySSno(String sSno) {
        return TopicSelectMapper.findBySSno(sSno);
    }


    public int findExistBySSno(String sSno) {
        return TopicSelectMapper.findExistBySSno(sSno);
    }


    public int findExistBySSnoandtpid(String sSno, int tpId) {
        return TopicSelectMapper.findExistBySSnoandtpid(sSno, tpId);
    }


    public int deleteBySSnoandtpid(String sSno, int tpId) {
        return TopicSelectMapper.deleteBySSnoandtpid(sSno, tpId);
    }
}




