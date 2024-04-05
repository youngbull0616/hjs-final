package com.mindskip.xzs.viewmodel.admin.chat;

import com.mindskip.xzs.base.BasePage;

import java.util.Date;

public class ChatPageRequestVM extends BasePage {
    private Integer userId; // 用户ID（可选，用于过滤特定用户参与的聊天记录）
    private Integer senderId; // 发送者ID（可选，用于过滤特定用户发送的聊天记录）
    private Integer receiverId; // 接收者ID（可选，用于过滤特定用户接收的聊天记录）

    private String message; //消息内容
    private Date startDate; // 开始日期（可选，用于按时间范围筛选聊天记录）

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Integer getSenderId() {
        return senderId;
    }

    public void setSenderId(Integer senderId) {
        this.senderId = senderId;
    }

    public Integer getReceiverId() {
        return receiverId;
    }

    public void setReceiverId(Integer receiverId) {
        this.receiverId = receiverId;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

}
