package edu.zzti.service.impl;

import edu.zzti.bean.GradeRecord;
import edu.zzti.dao.GradeRecordMapper;
import edu.zzti.service.GradeRecordService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GradeRecordServiceImpl implements GradeRecordService {

    private GradeRecordMapper gradeRecordMapper;

    public GradeRecordServiceImpl(GradeRecordMapper gradeRecordMapper) {
        this.gradeRecordMapper = gradeRecordMapper;
    }

    public Integer add(GradeRecord gradeRecord) {
        return gradeRecordMapper.insertSelective(gradeRecord);
    }

    public Integer del(Integer grId) {
        return gradeRecordMapper.deleteByPrimaryKey(grId);
    }

    public Integer upd(GradeRecord gradeRecord) {
        return gradeRecordMapper.updateByPrimaryKeySelective(gradeRecord);
    }

    public GradeRecord selectById(Integer grId) {
        return gradeRecordMapper.selectById(grId);
    }

    public List<GradeRecord> selectByTno(Integer grType, Integer tno) {
        return gradeRecordMapper.selectByTno(grType,tno);
    }

    public List<GradeRecord> select(Integer grType, Integer grType1, Integer tno) {
        return gradeRecordMapper.select(grType,grType1,tno);
    }

    public List<GradeRecord> selectByTsId(Integer tsId, Integer grType) {
        return gradeRecordMapper.selectByTsId(tsId,grType);
    }

    public Integer selectTopId(Integer tsId, Integer grType, Integer tno) {
        return gradeRecordMapper.selectTopId(tsId,grType,tno);
    }
}




