package edu.zzti.bean;

import java.util.Date;

public class StudentComment {
    private Integer scId;

    private Integer scTpsId;

    private String scContent;

    private Date scTime;
    private TeacherComment teacherComment;
    public TeacherComment getTeacherComment() {
        return teacherComment;
    }

    public void setTeacherComment(TeacherComment teacherComment) {
        this.teacherComment = teacherComment;
    }



    public Integer getScId() {
        return scId;
    }

    public void setScId(Integer scId) {
        this.scId = scId;
    }

    public Integer getScTpsId() {
        return scTpsId;
    }

    public void setScTpsId(Integer scTpsId) {
        this.scTpsId = scTpsId;
    }

    public String getScContent() {
        return scContent;
    }

    public void setScContent(String scContent) {
        this.scContent = scContent == null ? null : scContent.trim();
    }

    public Date getScTime() {
        return scTime;
    }

    public void setScTime(Date scTime) {
        this.scTime = scTime;
    }
}