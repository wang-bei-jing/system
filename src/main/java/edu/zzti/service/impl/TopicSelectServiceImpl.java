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

    //xwq开始
    public List<TopicSelect> selectAll() {
        return topicSelectMapper.selectAll();
    }

    public TopicSelect selectBySno(String sno) {
        return topicSelectMapper.selectBySno(sno);
    }

    public TopicSelect selectByTpId(Integer tpId) {
        return topicSelectMapper.selectByTpId(tpId);
    }

    public int countByTpId(Integer tpId) {
        return topicSelectMapper.countByTpId(tpId);
    }

    public TopicSelect selectBytTsId(Integer id) {
        return topicSelectMapper.selectBytTsId(id);
    }

    public int acceptStudent(Integer id) {
        return topicSelectMapper.acceptStudent(id);
    }

    public int refuseStudent(Integer id) {
        return topicSelectMapper.refuseStudent(id);
    }

    public List<TopicSelect> selectStudent(Integer tno) {
        return topicSelectMapper.selectStudent(tno);
    }

    public List<TopicSelect> selectMyStudent(Integer tno) {
        return topicSelectMapper.selectMyStudent(tno);
    }

    public List<TopicSelect> getStudent(Integer tno) {
        return topicSelectMapper.getStudent(tno);
    }
    //xwq结束

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

    public Integer findTpsId(String sSno, String status) {
        return topicSelectMapper.findTpsId(sSno, status);
    }


    public List<TopicSelect> adminFindAllStudentAndTopicAndTeacher(String status) {
        return topicSelectMapper.adminFindAllStudentAndTopicAndTeacher(status);
    }

    public List<TopicSelect> adminFindAllStudentAndTopicAndTeacherByName(String name, String status) {
        return topicSelectMapper.adminFindAllStudentAndTopicAndTeacherByName(name, status);
    }
}




