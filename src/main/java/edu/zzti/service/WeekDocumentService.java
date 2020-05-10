package edu.zzti.service;

import edu.zzti.bean.WeekDocument;

import java.util.List;


public interface WeekDocumentService {

    //xwq开始
    int add(WeekDocument weekDocument);

    int upd(WeekDocument weekDocument);

    List<WeekDocument> findTopic(Integer dTId,String category);

    List<WeekDocument> findTopicBy(Integer tno,String category);

    List<WeekDocument> findBy(Integer tpsId,String category);

    WeekDocument selectBy(Integer dId);

    List<WeekDocument> findAll(String category);

    WeekDocument selectById(Integer dId);
    //xwq结束

    //shc
    int addWeekDocument(WeekDocument weekDocument);

    List<WeekDocument> findByCategory(Integer tpsId,String category);

    int deleteByPrimaryKey(Integer dId);


    List<WeekDocument> findDIdlist(Integer dTId);
    //shc
}




