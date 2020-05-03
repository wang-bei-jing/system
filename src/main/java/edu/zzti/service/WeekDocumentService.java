package edu.zzti.service;

import edu.zzti.bean.WeekDocument;

import java.util.List;


public interface WeekDocumentService {

    //xwq开始
    int upd(WeekDocument weekDocument);

    List<WeekDocument> findBy(Integer tpsId,String category);

    WeekDocument selectById(Integer dId);
    //xwq结束

    //shc
    int addWeekDocument(WeekDocument weekDocument);

    List<WeekDocument> findByCateory(Integer tpsId,String category);

    int deleteByPrimaryKey(Integer dId);
}




