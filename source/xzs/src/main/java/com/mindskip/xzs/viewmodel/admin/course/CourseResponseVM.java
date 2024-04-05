package com.mindskip.xzs.viewmodel.admin.course;

import com.mindskip.xzs.viewmodel.BaseVM;



public class CourseResponseVM extends BaseVM {
    private Integer id;

    private String name;

    private Integer level;

    private String levelName;

    private Integer SubjectId;

    private String SubjectName;

    public String getSubjectName() {
        return SubjectName;
    }

    public void setSubjectName(String subjectName) {
        SubjectName = subjectName;
    }


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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public String getLevelName() {
        return levelName;
    }

    public void setLevelName(String levelName) {
        this.levelName = levelName;
    }
}
