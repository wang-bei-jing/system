package edu.zzti.dao;

import edu.zzti.bean.Midterm;

import java.util.List;

public interface MidtermMapper {

    List<Midterm> selectByTno(Integer tno);

    Midterm selectById(Integer mId);

    //分界线
    int deleteByPrimaryKey(Integer mId);

    int insert(Midterm record);

    int insertSelective(Midterm record);

    Midterm selectByPrimaryKey(Integer mId);

    int updateByPrimaryKeySelective(Midterm record);

    int updateByPrimaryKey(Midterm record);
}