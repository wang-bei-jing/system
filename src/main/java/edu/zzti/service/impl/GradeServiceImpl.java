package edu.zzti.service.impl;

import edu.zzti.bean.Grade;
import edu.zzti.dao.GradeMapper;
import edu.zzti.service.GradeService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GradeServiceImpl implements GradeService {

  private GradeMapper gradeMapper;

  public GradeServiceImpl(GradeMapper gradeMapper) {
    this.gradeMapper = gradeMapper;
  }

  //xwq开始
  public int add(Grade grade) {
    return gradeMapper.insertSelective(grade);
  }

  public int upd(Grade grade) {
    return gradeMapper.updateByPrimaryKeySelective(grade);
  }

  public Grade selectByGId(Integer gId) {
    return gradeMapper.selectByPrimaryKey(gId);
  }

  public Grade selectByGTsId(Integer gTsId) {
    return gradeMapper.selectByGTsId(gTsId);
  }

  public List<Grade> student(Integer tno) {
    return gradeMapper.student(tno);
  }
  //xwq结束

  //shc
  public Grade findStudentGradeBySno(String sno, String status) {
      return gradeMapper.findStudentGradeBySno(sno, status);
  }
  //shc
}
