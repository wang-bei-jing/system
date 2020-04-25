package edu.zzti.bean;


import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class TimeManger {
    private Integer tiId;

    private Integer tiCategory;
    @JsonFormat(timezone="GMT+8",pattern = "yyyy-MM-dd hh:mm")
    @DateTimeFormat(pattern ="yyyy-MM-dd hh:mm:ss" )
    private Date tiBegin;
    @JsonFormat(timezone="GMT+8",pattern = "yyyy-MM-dd hh:mm")
    @DateTimeFormat(pattern ="yyyy-MM-dd hh:mm:ss" )
    private Date tiEnd;

    public Integer getTiId() {
        return tiId;
    }

    public void setTiId(Integer tiId) {
        this.tiId = tiId;
    }

    public Integer getTiCategory() {
        return tiCategory;
    }

    public void setTiCategory(Integer tiCategory) {
        this.tiCategory = tiCategory;
    }

    public Date getTiBegin() {
        return tiBegin;
    }

    public void setTiBegin(Date tiBegin) {
        this.tiBegin = tiBegin;
    }

    public Date getTiEnd() {
        return tiEnd;
    }

    public void setTiEnd(Date tiEnd) {
        this.tiEnd = tiEnd;
    }

    @Override
    public String toString() {
        return "TimeManger{" +
                "tiId=" + tiId +
                ", tiCategory=" + tiCategory +
                ", tiBegin=" + tiBegin +
                ", tiEnd=" + tiEnd +
                '}';
    }
}