package edu.zzti.service;

import edu.zzti.bean.WeekDocument;

import java.util.List;


public interface WeekDocumentService {

    //shc
    int addWeekDocument(WeekDocument weekDocument);
    List<WeekDocument> findByCateory(Integer tpsId,String category);
    int deleteByPrimaryKey(Integer dId);



}




