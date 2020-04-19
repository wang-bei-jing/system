package edu.zzti.service;

import edu.zzti.bean.Midterm;

import java.util.List;

public interface MidtermService {

    Integer add(Midterm midterm);

    Integer del(Integer mId);

    Integer upd(Midterm midterm);

    Midterm selectById(Integer mId);

    List<Midterm> selectByTno(Integer tno);

    //分界线
}




