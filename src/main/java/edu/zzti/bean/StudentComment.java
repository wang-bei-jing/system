package edu.zzti.bean;

import java.util.Date;

public class StudentComment {
    private Integer scId;

    private Integer scTpsId;

    private String scContent;

    private Date scTime;

    private TeacherComment teacherComment;

    private TopicSelect topicSelect;

    private Student student;

    private Topic topic;

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

    public TeacherComment getTeacherComment() {
        return teacherComment;
    }

    public void setTeacherComment(TeacherComment teacherComment) {
        this.teacherComment = teacherComment;
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

    @Override
    public String toString() {
        return "StudentComment{" +
                "scId=" + scId +
                ", scTpsId=" + scTpsId +
                ", scContent='" + scContent + '\'' +
                ", scTime=" + scTime +
                ", teacherComment=" + teacherComment +
                ", topicSelect=" + topicSelect +
                ", student=" + student +
                ", topic=" + topic +
                '}';
    }
}