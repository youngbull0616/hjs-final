package com.mindskip.xzs.repository;

import com.mindskip.xzs.domain.Chat;
import com.mindskip.xzs.viewmodel.admin.chat.ChatPageRequestVM;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ChatMapper extends BaseMapper<Chat> {

    /**
     * 分页查询聊天记录
     * @param requestVM 查询参数
     * @return 聊天记录列表
     */
    List<Chat> findChats(@Param("requestVM") ChatPageRequestVM requestVM);

    /**
     * 插入新的聊天消息
     * @param chat 聊天实体
     * @return 影响行数
     */
    int insertSelective(@Param("chat") Chat chat);

    /**
     * 根据ID获取聊天记录详情
     * @param id 聊天记录ID
     * @return 聊天记录实体
     */
    Chat selectByPrimaryKey(@Param("id") Integer id);

    /**
     * 批量删除聊天记录
     * @param ids 聊天记录ID集合
     * @return 影响行数
     */
    int batchDelete(@Param("ids") List<Integer> ids);
}
