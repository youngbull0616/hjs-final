package com.mindskip.xzs.service.impl;

import com.github.pagehelper.PageInfo;
import com.mindskip.xzs.domain.Chat;
import com.mindskip.xzs.repository.ChatMapper;
import com.mindskip.xzs.repository.UserMapper;
import com.mindskip.xzs.service.ChatService;
import com.mindskip.xzs.utility.PageInfoHelper;
import com.mindskip.xzs.viewmodel.admin.chat.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ChatServiceImpl extends BaseServiceImpl<Chat> implements ChatService {

    private final ChatMapper chatMapper;

    private final UserMapper userMapper;

    @Autowired
    public ChatServiceImpl(ChatMapper chatMapper, UserMapper userMapper) {
        super(chatMapper);
        this.chatMapper = chatMapper;
        this.userMapper = userMapper;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public PageInfo<ChatPageResponseVM> getChats(ChatPageRequestVM request) {
        List<Chat> chats = chatMapper.findChats(request); // 假设chatMapper有一个findChats方法来处理查询参数
        PageInfo<Chat> pageInfo = new PageInfo<>(chats);
        PageInfo<ChatPageResponseVM> result = PageInfoHelper.copyMap(pageInfo, chat -> {
            ChatPageResponseVM vm = new ChatPageResponseVM();
            // 将Chat实体转换为ChatPageResponseVM对象
            vm.setId(chat.getId());
            vm.setMessage(chat.getMessage());
            vm.setUserId(chat.getUserId());
            vm.setStartDate(chat.getSendTime());
            return vm;
        });
        return result;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void sendMessage(SendMessageVM sendMessageRequest) {
        Chat chat = new Chat();
        chat.setUserId(sendMessageRequest.getUserId());
        chat.setMessage(sendMessageRequest.getMessage());
        chatMapper.insertSelective(chat);
    }

    @Override
    public Chat getChatDetailById(Integer id) {
        return chatMapper.selectByPrimaryKey(id);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void batchDeleteChats(List<Integer> ids) {
        chatMapper.batchDelete(ids);
    }

}
