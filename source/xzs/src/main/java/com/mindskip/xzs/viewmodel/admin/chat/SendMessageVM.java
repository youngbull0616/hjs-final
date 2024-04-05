package com.mindskip.xzs.viewmodel.admin.chat;

public class SendMessageVM {
    private String userId; // 发送者用户ID
    private String message; // 聊天消息内容

    public SendMessageVM(){}

    public SendMessageVM(String userId, String message) {
        this.userId = userId;
        this.message = message;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }


    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
