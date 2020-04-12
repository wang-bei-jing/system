package edu.zzti.dao;

import edu.zzti.bean.Grade;
import edu.zzti.bean.GradeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface GradeMapper {



    //shc
    Grade findStudentGradeBySno(@Param("sno") String sno,@Param("status") String status);
    //shc
    long countByExample(GradeExample example);

    int deleteByExample(GradeExample example);

    int deleteByPrimaryKey(Integer gId);

    int insert(Grade record);

    int insertSelective(Grade record);

    List<Grade> selectByExample(GradeExample example);

    Grade selectByPrimaryKey(Integer gId);

    int updateByExampleSelective(@Param("record") Grade record, @Param("example") GradeExample example);

    int updateByExample(@Param("record") Grade record, @Param("example") GradeExample example);

    int updateByPrimaryKeySelective(Grade record);

    int updateByPrimaryKey(Grade record);
}