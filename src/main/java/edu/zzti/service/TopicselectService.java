package edu.zzti.service;


import edu.zzti.bean.Topic;
import edu.zzti.bean.Topicselect;

import java.util.List;

public interface TopicselectService {
    int addTopicselect(Topicselect topicselect);
    List<Topicselect> findBySSno(String sSno);
}
