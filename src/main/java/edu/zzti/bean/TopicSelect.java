package edu.zzti.bean;

public class TopicSelect {
    private Integer id;

    private String sSno;

    private Integer tTno;

    private Integer tpId;

    private String status;

    private Student student;

    private Topic topic;

    private Teacher teacher;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getsSno() {
        return sSno;
    }

    public void setsSno(String sSno) {
        this.sSno = sSno == null ? null : sSno.trim();
    }

    public Integer gettTno() {
        return tTno;
    }

    public void settTno(Integer tTno) {
        this.tTno = tTno;
    }

    public Integer getTpId() {
        return tpId;
    }

    public void setTpId(Integer tpId) {
        this.tpId = tpId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
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
        return "TopicSelect{" +
                "id=" + id +
                ", sSno='" + sSno + '\'' +
                ", tTno=" + tTno +
                ", tpId=" + tpId +
                ", status='" + status + '\'' +
                ", student=" + student +
                ", topic=" + topic +
                ", teacher=" + teacher +
                '}';
    }

    public TopicSelect() {
    }
}