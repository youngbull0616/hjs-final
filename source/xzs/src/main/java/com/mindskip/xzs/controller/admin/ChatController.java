package com.mindskip.xzs.controller.admin;
import com.github.pagehelper.PageInfo;
import com.mindskip.xzs.base.BaseApiController;
import com.mindskip.xzs.base.RestResponse;
import com.mindskip.xzs.domain.User;
import com.mindskip.xzs.service.ChatService;
import com.mindskip.xzs.service.UserService;
import com.mindskip.xzs.utility.PageInfoHelper;
import com.mindskip.xzs.viewmodel.admin.chat.ChatPageRequestVM;
import com.mindskip.xzs.viewmodel.admin.chat.ChatPageResponseVM;
import com.mindskip.xzs.viewmodel.admin.chat.SendMessageVM;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController("AdminChatController")
@RequestMapping(value = "/api/admin/chat")
public class ChatController extends BaseApiController {

    private final ChatService chatService;

    private final UserService userService;

    @Autowired
    public ChatController(ChatService chatService,UserService userService) {
        this.chatService = chatService;
        this.userService = userService;
    }


    @RequestMapping(value = "/getChats", method = RequestMethod.POST)
    public RestResponse<PageInfo<ChatPageResponseVM>> getChats(@RequestBody ChatPageRequestVM model) {
    PageInfo<ChatPageResponseVM> pageInfo = chatService.getChats(model);
    PageInfo<ChatPageResponseVM> page = PageInfoHelper.copyMap(pageInfo, m -> {
      return modelMapper.map(m, ChatPageResponseVM.class);
    });
        return RestResponse.ok(page);
    }


    @RequestMapping(value = "/sendMessage", method = RequestMethod.POST)
    public RestResponse sendMessage(@RequestBody SendMessageVM request) {
        request.setUserId(getCurrentUser().getId().toString());
        chatService.sendMessage(request);
        return RestResponse.ok();
    }

    @RequestMapping(value = "/getReal", method = RequestMethod.POST)
    public  RestResponse getRealName(@RequestBody List<String> userIds) {
        List<String> realNames = new ArrayList<>();
        for (String userId : userIds) {
            int id = Integer.parseInt(userId);
            User user = userService.selectById(id);
            if (user != null) {
                realNames.add(user.getRealName());
            }
        }
        return RestResponse.ok(realNames);
    }
}
