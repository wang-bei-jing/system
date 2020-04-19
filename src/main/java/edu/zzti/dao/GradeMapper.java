package edu.zzti.dao;

import edu.zzti.bean.Grade;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GradeMapper {

    //xwq开始
    Grade selectByGTsId(Integer gTsId);

    List<Grade> student(Integer tno);
    //xwq结束

    //shc
    Grade findStudentGradeBySno(@Param("sno") String sno,@Param("status") String status);
    //shc

    int deleteByPrimaryKey(Integer gId);

    int insert(Grade record);

    int insertSelective(Grade record);

    Grade selectByPrimaryKey(Integer gId);

    int updateByPrimaryKeySelective(Grade record);

    int updateByPrimaryKey(Grade record);
}