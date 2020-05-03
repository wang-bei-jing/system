package edu.zzti.bean;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class WeekDocument {
    private Integer dId;

    private Integer tpsId;

    private String category;

    private String week;

    private String documentname;

    private String remark;

    private String annotation;
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date wkTime;

    public Integer getdId() {
        return dId;
    }

    public void setdId(Integer dId) {
        this.dId = dId;
    }

    public Integer getTpsId() {
        return tpsId;
    }

    public void setTpsId(Integer tpsId) {
        this.tpsId = tpsId;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category == null ? null : category.trim();
    }

    public String getWeek() {
        return week;
    }

    public void setWeek(String week) {
        this.week = week == null ? null : week.trim();
    }

    public String getDocumentname() {
        return documentname;
    }

    public void setDocumentname(String documentname) {
        this.documentname = documentname == null ? null : documentname.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getAnnotation() {
        return annotation;
    }

    public void setAnnotation(String annotation) {
        this.annotation = annotation == null ? null : annotation.trim();
    }

    public Date getWkTime() {
        return wkTime;
    }

    public void setWkTime(Date wkTime) {
        this.wkTime = wkTime;
    }

    @Override
    public String toString() {
        return "WeekDocument{" +
                "dId=" + dId +
                ", tpsId=" + tpsId +
                ", category='" + category + '\'' +
                ", week='" + week + '\'' +
                ", documentname='" + documentname + '\'' +
                ", remark='" + remark + '\'' +
                ", annotation='" + annotation + '\'' +
                ", wkTime=" + wkTime +
                '}';
    }
}