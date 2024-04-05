package com.mindskip.xzs.domain;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

public class Chat implements Serializable {
    // 主键ID
    private String id;



    private Date sendTime;

    // 聊天内容
    private String message;

    // 发送者ID
    private String userId;


    // 构造方法
    public Chat(String userId, String message ,Date sendTime) {
        this.userId = userId;
        this.message = message;
        this.sendTime = sendTime;
    }

    public Date getSendTime() {
        return sendTime;
    }

    public Chat() {

    }

    public void setSendTime(Date sendTime) {
        this.sendTime = sendTime;
    }

    // Getter和Setter方法
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

}
