package edu.zzti.service;

import edu.zzti.bean.Topic;

import java.util.List;

public interface TopicService {
    List<Topic> selectByCname(String cname);
    List<Topic> selectAll();

}
