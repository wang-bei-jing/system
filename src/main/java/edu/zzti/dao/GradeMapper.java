package edu.zzti.dao;

import edu.zzti.bean.Grade;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GradeMapper {

    //xwq开始
    Grade selectByGId(Integer gId);

    Grade selectByGTsId(Integer gTsId);

    List<Grade> student(Integer tno);
    //xwq结束

    //shc
    Grade findStudentGradeBySnoAndStatus(@Param("sno") String sno,@Param("status") String status);
    List<Grade> findStudentGradeByBoundary(@Param("min") Integer min,@Param("max") Integer max);
    List<Grade> findStudentGradeBySno(String sno);
    List<Grade> adminGradeFindByTeacherName(String sno);
    //shc

    int deleteByPrimaryKey(Integer gId);

    int insert(Grade record);

    int insertSelective(Grade record);

    Grade selectByPrimaryKey(Integer gId);

    int updateByPrimaryKeySelective(Grade record);

    int updateByPrimaryKey(Grade record);
}