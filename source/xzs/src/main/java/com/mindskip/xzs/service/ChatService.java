package com.mindskip.xzs.service;

import com.mindskip.xzs.domain.Chat;
import com.mindskip.xzs.viewmodel.admin.chat.ChatPageRequestVM;
import com.mindskip.xzs.viewmodel.admin.chat.ChatPageResponseVM;
import com.mindskip.xzs.viewmodel.admin.chat.SendMessageVM;

import com.github.pagehelper.PageInfo;
import java.util.List;

public interface ChatService extends BaseService<Chat> {

    /**
     * 获取聊天记录分页列表
     * @param request 查询参数
     * @return 分页结果
     */
    PageInfo<ChatPageResponseVM> getChats(ChatPageRequestVM request);

    /**
     * 发送聊天消息
     * @param sendMessageRequest 发送消息的请求参数
     */
    void sendMessage(SendMessageVM sendMessageRequest);

    /**
     * 根据ID获取聊天记录详情
     * @param id 聊天记录ID
     * @return 聊天记录详情
     */
    Chat getChatDetailById(Integer id);

    /**
     * 批量删除聊天记录
     * @param ids 要删除的聊天记录ID集合
     */
    void batchDeleteChats(List<Integer> ids);


    /**
     * 其他可能的聊天服务相关方法...
     */
}
