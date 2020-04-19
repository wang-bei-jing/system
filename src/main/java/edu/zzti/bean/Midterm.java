package edu.zzti.bean;

public class Midterm {
    private Integer mId;

    private Integer tsId;

    private Integer mTno;

    private Integer presentation;

    private String speed;

    private String problem;

    private String comment;

    private Integer grId;

    private GradeRecord gradeRecord;

    private TopicSelect topicSelect;

    private Topic topic;

    private Student student;

    public Integer getmId() {
        return mId;
    }

    public void setmId(Integer mId) {
        this.mId = mId;
    }

    public Integer getTsId() {
        return tsId;
    }

    public void setTsId(Integer tsId) {
        this.tsId = tsId;
    }

    public Integer getmTno() {
        return mTno;
    }

    public void setmTno(Integer mTno) {
        this.mTno = mTno;
    }

    public Integer getPresentation() {
        return presentation;
    }

    public void setPresentation(Integer presentation) {
        this.presentation = presentation;
    }

    public String getSpeed() {
        return speed;
    }

    public void setSpeed(String speed) {
        this.speed = speed == null ? null : speed.trim();
    }

    public String getProblem() {
        return problem;
    }

    public void setProblem(String problem) {
        this.problem = problem == null ? null : problem.trim();
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment == null ? null : comment.trim();
    }

    public Integer getGrId() {
        return grId;
    }

    public void setGrId(Integer grId) {
        this.grId = grId;
    }

    public GradeRecord getGradeRecord() {
        return gradeRecord;
    }

    public void setGradeRecord(GradeRecord gradeRecord) {
        this.gradeRecord = gradeRecord;
    }

    public TopicSelect getTopicSelect() {
        return topicSelect;
    }

    public void setTopicSelect(TopicSelect topicSelect) {
        this.topicSelect = topicSelect;
    }

    public Topic getTopic() {
        return topic;
    }

    public void setTopic(Topic topic) {
        this.topic = topic;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    @Override
    public String toString() {
        return "Midterm{" +
                "mId=" + mId +
                ", tsId=" + tsId +
                ", mTno=" + mTno +
                ", presentation=" + presentation +
                ", speed='" + speed + '\'' +
                ", problem='" + problem + '\'' +
                ", comment='" + comment + '\'' +
                ", grId=" + grId +
                ", gradeRecord=" + gradeRecord +
                ", topicSelect=" + topicSelect +
                ", topic=" + topic +
                ", student=" + student +
                '}';
    }
}