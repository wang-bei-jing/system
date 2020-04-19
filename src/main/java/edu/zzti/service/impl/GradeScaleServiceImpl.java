package edu.zzti.service.impl;

import edu.zzti.bean.GradeScale;
import edu.zzti.dao.GradeScaleMapper;
import edu.zzti.service.GradeScaleService;
import org.springframework.stereotype.Service;

@Service
public class GradeScaleServiceImpl implements GradeScaleService {

    private GradeScaleMapper gradeScaleMapper;

    public GradeScaleServiceImpl(GradeScaleMapper gradeScaleMapper) {
        this.gradeScaleMapper = gradeScaleMapper;
    }

    public GradeScale selectByGsStatus(Integer gsStatus) {
        return gradeScaleMapper.selectByGsStatus(gsStatus);
    }
}




