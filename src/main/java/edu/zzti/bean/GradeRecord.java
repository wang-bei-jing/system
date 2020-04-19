package edu.zzti.bean;

public class GradeRecord {
    private Integer grId;

    private Integer grTsId;

    private Integer grTno;

    private Integer grType;

    private Integer grGrade;

    private TopicSelect topicSelect;

    private Student student;

    private Topic topic;

    public Integer getGrId() {
        return grId;
    }

    public void setGrId(Integer grId) {
        this.grId = grId;
    }

    public Integer getGrTsId() {
        return grTsId;
    }

    public void setGrTsId(Integer grTsId) {
        this.grTsId = grTsId;
    }

    public Integer getGrTno() {
        return grTno;
    }

    public void setGrTno(Integer grTno) {
        this.grTno = grTno;
    }

    public Integer getGrType() {
        return grType;
    }

    public void setGrType(Integer grType) {
        this.grType = grType;
    }

    public Integer getGrGrade() {
        return grGrade;
    }

    public void setGrGrade(Integer grGrade) {
        this.grGrade = grGrade;
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
        return "GradeRecord{" +
                "grId=" + grId +
                ", grTsId=" + grTsId +
                ", grTno=" + grTno +
                ", grType=" + grType +
                ", grGrade=" + grGrade +
                ", topicSelect=" + topicSelect +
                ", student=" + student +
                ", topic=" + topic +
                '}';
    }
}