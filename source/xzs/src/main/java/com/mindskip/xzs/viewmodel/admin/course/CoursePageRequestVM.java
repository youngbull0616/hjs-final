package com.mindskip.xzs.viewmodel.admin.course;

import com.mindskip.xzs.base.BasePage;



public class CoursePageRequestVM extends BasePage {
    private Integer id;
    private Integer level;

    private Integer SubjectId;

    public Integer getSubjectId() {
        return SubjectId;
    }

    public void setSubjectId(Integer subjectId) {
        SubjectId = subjectId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }
}
