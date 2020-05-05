package edu.zzti.service.impl;

import edu.zzti.bean.WeekDocument;
import edu.zzti.dao.WeekDocumentMapper;
import edu.zzti.service.WeekDocumentService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WeekDocumentServiceImpl implements WeekDocumentService {
    final WeekDocumentMapper weekDocumentMapper;

    public WeekDocumentServiceImpl(WeekDocumentMapper weekDocumentMapper) {
        this.weekDocumentMapper = weekDocumentMapper;
    }

    public int add(WeekDocument weekDocument) {
        return weekDocumentMapper.insertSelective(weekDocument);
    }

    public int upd(WeekDocument weekDocument) {
        return weekDocumentMapper.updateByPrimaryKeySelective(weekDocument);
    }

    public List<WeekDocument> findTopic(Integer dTId, String category) {
        return weekDocumentMapper.findTopic(dTId, category);
    }

    public List<WeekDocument> findTopicBy(Integer tno, String category) {
        return weekDocumentMapper.findTopicBy(tno, category);
    }

    //xwq开始
    public List<WeekDocument> findBy(Integer tpsId, String category) {
        return weekDocumentMapper.findBy(tpsId,category);
    }

    public WeekDocument selectBy(Integer dId) {
        return weekDocumentMapper.selectById(dId);
    }

    public WeekDocument selectById(Integer dId) {
        return weekDocumentMapper.selectByPrimaryKey(dId);
    }
    //xwq结束

    public int addWeekDocument(WeekDocument weekDocument) {
        System.out.println("进来咯");
        return weekDocumentMapper.addWeekDocumentSelective(weekDocument);
    }

    public List<WeekDocument> findByCategory(Integer tpsId, String category) {
        return weekDocumentMapper.findByCategory(tpsId, category);
    }

    public int deleteByPrimaryKey(Integer dId) {
        return weekDocumentMapper.deleteByPrimaryKey(dId);
    }
}
