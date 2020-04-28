package edu.zzti.bean;

import java.util.Date;

public class Comment {
    private Integer cId;

    private Integer cTpsId;

    private String stucontent;

    private String teacontent;

    private Date cTime;

    public Integer getcId() {
        return cId;
    }

    public void setcId(Integer cId) {
        this.cId = cId;
    }

    public Integer getcTpsId() {
        return cTpsId;
    }

    public void setcTpsId(Integer cTpsId) {
        this.cTpsId = cTpsId;
    }

    public String getStucontent() {
        return stucontent;
    }

    public void setStucontent(String stucontent) {
        this.stucontent = stucontent == null ? null : stucontent.trim();
    }

    public String getTeacontent() {
        return teacontent;
    }

    public void setTeacontent(String teacontent) {
        this.teacontent = teacontent == null ? null : teacontent.trim();
    }

    public Date getcTime() {
        return cTime;
    }

    public void setcTime(Date cTime) {
        this.cTime = cTime;
    }
}