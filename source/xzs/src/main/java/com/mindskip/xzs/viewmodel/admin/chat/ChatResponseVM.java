package com.mindskip.xzs.viewmodel.admin.chat;

import com.mindskip.xzs.domain.Chat;
import com.mindskip.xzs.viewmodel.BaseVM;

import java.time.LocalDateTime;
import java.util.Date;

public class ChatResponseVM extends BaseVM {
    private String id; // 聊天记录ID
    private String userId; // 接收者用户ID
    private String message; // 聊天消息内容
    private Date createTime; // 创建时间

    // 构造函数
    public void ChatPageResponseVM() {}

    public void ChatPageResponseVM(Chat chat) {
        this.id = chat.getId();
        this.userId = userId;
        this.message = chat.getMessage();
        this.createTime = chat.getSendTime();
    }

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

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
