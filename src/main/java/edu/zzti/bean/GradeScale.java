package edu.zzti.bean;

public class GradeScale {
    private Integer gsId;

    private Integer gradeA;

    private Integer gradeB;

    private Integer gradeC;

    private Integer gradeD;

    private Integer gsStatus;

    private String gsTerm;

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

    public Integer getGsStatus() {
        return gsStatus;
    }

    public void setGsStatus(Integer gsStatus) {
        this.gsStatus = gsStatus;
    }

    public String getGsTerm() {
        return gsTerm;
    }

    public void setGsTerm(String gsTerm) {
        this.gsTerm = gsTerm == null ? null : gsTerm.trim();
    }
}