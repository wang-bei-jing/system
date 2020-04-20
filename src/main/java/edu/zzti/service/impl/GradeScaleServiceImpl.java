package edu.zzti.service.impl;

import edu.zzti.service.GradeScaleService;
import org.springframework.stereotype.Service;

@Service
public class GradeScaleServiceImpl implements GradeScaleService {

    private GradeScaleMapper gradeScaleMapper;


    public GradeScaleServiceImpl(GradeScaleMapper gradeScaleMapper) {
        this.gradeScaleMapper = gradeScaleMapper;
    }

    //xwq开始
    public int add(GradeScale gradeScale) {
        return gradeScaleMapper.insertSelective(gradeScale);
    }

    public int del(Integer gsId) {
        return gradeScaleMapper.deleteByPrimaryKey(gsId);
    }


    public int upd(GradeScale gradeScale) {
        return gradeScaleMapper.updateByPrimaryKeySelective(gradeScale);
    }

    public GradeScale selectByGsStatus(Integer gsStatus) {
        return gradeScaleMapper.selectByGsStatus(gsStatus);
    }
    //xwq结束
}




