package edu.zzti.bean;

import java.util.Date;

public class GradeScale {
    private Integer gsId;

    private Integer gradeA;

    private Integer gradeB;

    private Integer gradeC;

    private Integer gradeD;

    private String gsDepartment;

    private Date gsTime;

    private Integer gsStatus;

    public Integer getGsId() {
        return gsId;
    }

    public void setGsId(Integer gsId) {
        this.gsId = gsId;
    }

    public Integer getGradeA() {
        return gradeA;
    }

    public void setGradeA(Integer gradeA) {
        this.gradeA = gradeA;
    }

    public Integer getGradeB() {
        return gradeB;
    }

    public void setGradeB(Integer gradeB) {
        this.gradeB = gradeB;
    }

    public Integer getGradeC() {
        return gradeC;
    }

    public void setGradeC(Integer gradeC) {
        this.gradeC = gradeC;
    }

    public Integer getGradeD() {
        return gradeD;
    }

    public void setGradeD(Integer gradeD) {
        this.gradeD = gradeD;
    }

    public String getGsDepartment() {
        return gsDepartment;
    }

    public void setGsDepartment(String gsDepartment) {
        this.gsDepartment = gsDepartment == null ? null : gsDepartment.trim();
    }

    public Date getGsTime() {
        return gsTime;
    }

    public void setGsTime(Date gsTime) {
        this.gsTime = gsTime;
    }

    public Integer getGsStatus() {
        return gsStatus;
    }

    public void setGsStatus(Integer gsStatus) {
        this.gsStatus = gsStatus;
    }

    @Override
    public String toString() {
        return "GradeScale{" +
                "gsId=" + gsId +
                ", gradeA=" + gradeA +
                ", gradeB=" + gradeB +
                ", gradeC=" + gradeC +
                ", gradeD=" + gradeD +
                ", gsDepartment='" + gsDepartment + '\'' +
                ", gsTime=" + gsTime +
                ", gsStatus=" + gsStatus +
                '}';
    }
}