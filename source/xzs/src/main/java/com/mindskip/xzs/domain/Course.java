package com.mindskip.xzs.domain;

import java.io.Serializable;

public class Course implements Serializable {


    private Integer id;

    /**
     * 课程名称
     */
    private String name;

    /**
     * 年级 (1-4) 大学年级
     */
    private Integer level;

    /**
     * 一年级、二年级等
     */
    private String levelName;

    /**
     * 排序
     */
    private Integer itemOrder;

    private Boolean deleted;

    /**
     * 学科
     */
    private Integer subjectId;

    public Integer getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(Integer subjectId) {
        this.subjectId = subjectId;
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
        this.name = name == null ? null : name.trim();
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
        this.levelName = levelName == null ? null : levelName.trim();
    }

    public Integer getItemOrder() {
        return itemOrder;
    }

    public void setItemOrder(Integer itemOrder) {
        this.itemOrder = itemOrder;
    }

    public Boolean getDeleted() {
        return deleted;
    }

    public void setDeleted(Boolean deleted) {
        this.deleted = deleted;
    }
}
