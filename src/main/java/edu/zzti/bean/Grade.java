package edu.zzti.bean;

public class Grade {
    private Integer gId;

    private Integer gTsId;

    private Integer gPeacetime;

    private Integer gMidterm;

    private Integer gPresentation;

    private Integer gCheck;

    private Integer gTotal;

    private TopicSelect topicSelect;

    private Student student;

    private Topic topic;

    public Integer getgId() {
        return gId;
    }

    public void setgId(Integer gId) {
        this.gId = gId;
    }

    public Integer getgTsId() {
        return gTsId;
    }

    public void setgTsId(Integer gTsId) {
        this.gTsId = gTsId;
    }

    public Integer getgPeacetime() {
        return gPeacetime;
    }

    public void setgPeacetime(Integer gPeacetime) {
        this.gPeacetime = gPeacetime;
    }

    public Integer getgMidterm() {
        return gMidterm;
    }

    public void setgMidterm(Integer gMidterm) {
        this.gMidterm = gMidterm;
    }

    public Integer getgPresentation() {
        return gPresentation;
    }

    public void setgPresentation(Integer gPresentation) {
        this.gPresentation = gPresentation;
    }

    public Integer getgCheck() {
        return gCheck;
    }

    public void setgCheck(Integer gCheck) {
        this.gCheck = gCheck;
    }

    public Integer getgTotal() {
        return gTotal;
    }

    public void setgTotal(Integer gTotal) {
        this.gTotal = gTotal;
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
        return "Grade{" +
                "gId=" + gId +
                ", gTsId=" + gTsId +
                ", gPeacetime=" + gPeacetime +
                ", gMidterm=" + gMidterm +
                ", gPresentation=" + gPresentation +
                ", gCheck=" + gCheck +
                ", gTotal=" + gTotal +
                ", topicSelect=" + topicSelect +
                ", student=" + student +
                ", topic=" + topic +
                '}';
    }
}