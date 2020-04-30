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

  public int del(Integer gId) {
    return gradeMapper.deleteByPrimaryKey(gId);
  }

  public int upd(Grade grade) {
    return gradeMapper.updateByPrimaryKeySelective(grade);
  }

  public Grade selectByGId(Integer gId) {
    return gradeMapper.selectByGId(gId);
  }

  public Grade selectByGTsId(Integer gTsId) {
    return gradeMapper.selectByGTsId(gTsId);
  }

  public List<Grade> student(Integer tno) {
    return gradeMapper.student(tno);
  }
  //xwq结束

  //shc
  public Grade findStudentGradeBySnoAndStatus(String sno, String status) {
      return gradeMapper.findStudentGradeBySnoAndStatus(sno, status);
  }

  public List<Grade> findStudentGradeByBoundary(Integer min, Integer max) {
    return gradeMapper.findStudentGradeByBoundary(min, max);
  }

  public List<Grade> findStudentGradeBySno(String sno) {
    return gradeMapper.findStudentGradeBySno(sno);
  }

  public List<Grade> adminGradeFindByTeacherName(String sno) {
    return gradeMapper.adminGradeFindByTeacherName(sno);
  }
  //shc
}
