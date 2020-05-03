package edu.zzti.bean;

import java.util.Date;

public class Comment {
    private Integer cId;

    private Integer cIdentity;

    private String cFrom;

    private String cTo;

    private Integer cTsId;

    private String cContent;

    private Date cTime;

    private Integer cAll;

    private Integer cStatus;

    private TopicSelect topicSelect;

    private Student student;

    private Topic topic;

    private Teacher teacher;

    public Integer getcId() {
        return cId;
    }

    public void setcId(Integer cId) {
        this.cId = cId;
    }

    public Integer getcIdentity() {
        return cIdentity;
    }

    public void setcIdentity(Integer cIdentity) {
        this.cIdentity = cIdentity;
    }

    public String getcFrom() {
        return cFrom;
    }

    public void setcFrom(String cFrom) {
        this.cFrom = cFrom == null ? null : cFrom.trim();
    }

    public String getcTo() {
        return cTo;
    }

    public void setcTo(String cTo) {
        this.cTo = cTo == null ? null : cTo.trim();
    }

    public Integer getcTsId() {
        return cTsId;
    }

    public void setcTsId(Integer cTsId) {
        this.cTsId = cTsId;
    }

    public String getcContent() {
        return cContent;
    }

    public void setcContent(String cContent) {
        this.cContent = cContent == null ? null : cContent.trim();
    }

    public Date getcTime() {
        return cTime;
    }

    public void setcTime(Date cTime) {
        this.cTime = cTime;
    }

    public Integer getcAll() {
        return cAll;
    }

    public void setcAll(Integer cAll) {
        this.cAll = cAll;
    }

    public Integer getcStatus() {
        return cStatus;
    }

    public void setcStatus(Integer cStatus) {
        this.cStatus = cStatus;
    }

    public TopicSelect getTopicSelect() {
        return topicSelect;
    }

    public void setTopicSelect(TopicSelect topicSelect) {
        this.topicSelect = topicSelect;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Topic getTopic() {
        return topic;
    }

    public void setTopic(Topic topic) {
        this.topic = topic;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "cId=" + cId +
                ", cIdentity=" + cIdentity +
                ", cFrom='" + cFrom + '\'' +
                ", cTo='" + cTo + '\'' +
                ", cTsId=" + cTsId +
                ", cContent='" + cContent + '\'' +
                ", cTime=" + cTime +
                ", cAll=" + cAll +
                ", cStatus=" + cStatus +
                ", topicSelect=" + topicSelect +
                ", student=" + student +
                ", topic=" + topic +
                ", teacher=" + teacher +
                '}';
    }
}