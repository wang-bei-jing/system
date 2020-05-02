package edu.zzti.bean;

import java.util.Date;

public class TeacherComment {
    private Integer tcId;

    private Integer tcTpsId;

    private Integer tcScId;

    private String tcContent;

    private Date tcTime;

    private StudentComment studentComment;

    public Integer getTcId() {
        return tcId;
    }

    public void setTcId(Integer tcId) {
        this.tcId = tcId;
    }

    public Integer getTcTpsId() {
        return tcTpsId;
    }

    public void setTcTpsId(Integer tcTpsId) {
        this.tcTpsId = tcTpsId;
    }

    public Integer getTcScId() {
        return tcScId;
    }

    public void setTcScId(Integer tcScId) {
        this.tcScId = tcScId;
    }

    public String getTcContent() {
        return tcContent;
    }

    public void setTcContent(String tcContent) {
        this.tcContent = tcContent == null ? null : tcContent.trim();
    }

    public Date getTcTime() {
        return tcTime;
    }

    public void setTcTime(Date tcTime) {
        this.tcTime = tcTime;
    }

    public StudentComment getStudentComment() {
        return studentComment;
    }

    public void setStudentComment(StudentComment studentComment) {
        this.studentComment = studentComment;
    }

    @Override
    public String toString() {
        return "TeacherComment{" +
                "tcId=" + tcId +
                ", tcTpsId=" + tcTpsId +
                ", tcScId=" + tcScId +
                ", tcContent='" + tcContent + '\'' +
                ", tcTime=" + tcTime +
                ", studentComment=" + studentComment +
                '}';
    }
}