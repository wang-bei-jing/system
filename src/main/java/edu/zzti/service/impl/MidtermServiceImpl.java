package edu.zzti.service.impl;

import edu.zzti.bean.Midterm;
import edu.zzti.dao.MidtermMapper;
import edu.zzti.service.MidtermService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MidtermServiceImpl implements MidtermService {

    private MidtermMapper midtermMapper;

    public MidtermServiceImpl(MidtermMapper midtermMapper) {
        this.midtermMapper = midtermMapper;
    }

    public Integer add(Midterm midterm) {
        return midtermMapper.insertSelective(midterm);
    }

    public Integer del(Integer mId) {
        return midtermMapper.deleteByPrimaryKey(mId);
    }

    public Integer upd(Midterm midterm) {
        return midtermMapper.updateByPrimaryKeySelective(midterm);
    }

    public List<Midterm> selectByTno(Integer tno) {
        return midtermMapper.selectByTno(tno);
    }

    public Midterm selectById(Integer mId) {
        return midtermMapper.selectById(mId);
    }
}




