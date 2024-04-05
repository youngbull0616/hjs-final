package com.mindskip.xzs.domain;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

public class FileDomain implements Serializable {


    private Integer id;


    /**
     * 上传用户id
     */
    private Integer userId;


    /**
     * 文件名
     */
    private String fileName;


    /**
     * 文件地址
     */
    private String fileURL;

    /**
     * 课件状态
     */
    private Integer status;

    /**
     * 课程编号
     */
    private Integer courseId;
    /**
     * 是否删除
     */
    private Integer isDeleted;

    public Map<String, Object> getAllAttributes() {
        Map<String, Object> attributes = new HashMap<>();
        attributes.put("id", this.id);
        attributes.put("fileName", this.fileName);
        attributes.put("courId", this.courseId);
        attributes.put("isDeleted", this.isDeleted);
        attributes.put("fileURL", this.fileURL);
        attributes.put("userId", this.userId);
        attributes.put("status", this.status);
        // 如果还有其他属性，可以继续添加到 attributes 中
        return attributes;
    }

    public String toJsonString() {
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            return objectMapper.writeValueAsString(this);
        } catch (Exception e) {
            e.printStackTrace();
            return "{}"; // 返回空对象，表示转换失败
        }
    }

    @Override
    public String toString() {
        return "FileDomain{" +
                "id=" + id +
                ", userId=" + userId +
                ", fileName='" + fileName + '\'' +
                ", fileURL='" + fileURL + '\'' +
                ", status=" + status +
                ", courseId=" + courseId +
                ", isDeleted=" + isDeleted +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getFileURL() {
        return fileURL;
    }

    public void setFileURL(String fileURL) {
        this.fileURL = fileURL;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Integer isDeleted) {
        this.isDeleted = isDeleted;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

}
