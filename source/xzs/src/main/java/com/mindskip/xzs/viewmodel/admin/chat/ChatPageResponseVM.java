package com.mindskip.xzs.viewmodel.admin.chat;

import com.mindskip.xzs.base.BasePage;

import java.util.Date;

public class ChatPageResponseVM extends BasePage {
    private String id;
    private String  userId; // 用户ID（可选，用于过滤特定用户参与的聊天记录）
    private String message; //
    private Date startDate; // 开始日期（可选，用于按时间范围筛选聊天记录）

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }



    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public String getId() {
        return id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {this.message = message;}

    public void setId(String  id) {this.id = id;
    }
}
