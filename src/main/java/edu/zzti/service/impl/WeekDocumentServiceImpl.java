package edu.zzti.service.impl;

import edu.zzti.bean.WeekDocument;
import edu.zzti.dao.WeekDocumentMapper;
import edu.zzti.service.WeekDocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WeekDocumentServiceImpl implements WeekDocumentService {
    final WeekDocumentMapper weekDocumentMapper;

    public WeekDocumentServiceImpl(WeekDocumentMapper weekDocumentMapper) {
        this.weekDocumentMapper = weekDocumentMapper;
    }

    public int upd(WeekDocument weekDocument) {
        return weekDocumentMapper.updateByPrimaryKeySelective(weekDocument);
    }

    //xwq开始
    public List<WeekDocument> findBy(Integer tpsId, String category) {
        return weekDocumentMapper.findBy(tpsId,category);
    }

    public WeekDocument selectById(Integer dId) {
        return weekDocumentMapper.selectById(dId);
    }
    //xwq结束

    public int addWeekDocument(WeekDocument weekDocument) {
        System.out.println("进来咯");
        return weekDocumentMapper.addWeekDocumentSelective(weekDocument);
    }

    public List<WeekDocument> findByCateory(Integer tpsId, String category) {
        return weekDocumentMapper.findByCateory(tpsId, category);
    }


    public int deleteByPrimaryKey(Integer dId) {
        return weekDocumentMapper.deleteByPrimaryKey(dId);
    }
}
