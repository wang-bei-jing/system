package edu.zzti.bean;

import java.util.Date;

public class TeacherComment {
    private Integer tcId;

    private Integer tcTpsId;

    private Integer tcScId;

    private String tcContent;

    private Date tcTime;

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
}