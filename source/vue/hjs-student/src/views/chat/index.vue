<template>
  <div id="chat-room">
    <el-card shadow="never">
      <!-- 聊天记录区域 -->
      <div class="chat-records">
        <transition-group name="list">
          <div v-for="(message) in fetchedMessages" :key="message.id" class="chat-record">
            <el-avatar :src="require('@/assets/avatar.gif')"></el-avatar>
            <span>{{ message.realName }}：</span>
            <p>{{ message.message }}</p>
            <p style="color:grey">{{ formatDate(message.startDate) }}</p>
          </div>
        </transition-group>
      </div>
      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :total="totalRecords"
        :page-size="pageSize"
        layout="prev, pager, next"        style="text-align: center;"
      />

      <!-- 输入及发送区域 -->
      <el-form>
        <el-form-item>
          <el-input placeholder="请输入消息内容" v-model="inputMessage" @keyup.enter.native="sendMessage"></el-input>
        </el-form-item>
        <el-button type="primary" @click="sendMessage">发送</el-button>
      </el-form>

    </el-card>
  </div>
</template>

<script>
import chatApi from '@/api/chat'
export default {
  data () {
    return {
      inputMessage: '',
      fetchedMessages: [],
      chatRequest: {
        userId: '',
        receiverId: '',
        message: '',
        startDate: '',
        pageIndex: 1,
        pageSize: 10
      },
      displayedMessages: [], // 用于存放当前显示页的聊天记录
      totalRecords: 0, // 总记录数
      pageSize: 10, // 每页记录数
      currentPage: 1 // 当前页码
    }
  },
  async created () {
    await this.fetchChats()
  },
  methods: {
    sendMessage () {
      if (this.inputMessage.trim()) {
        const newMessage = {
          message: this.inputMessage,
          start_time: new Date().toLocaleTimeString() // 添加当前时间戳
        }
        chatApi.sendAMessage(newMessage)

        // 清空输入框
        this.inputMessage = ''
      }
    },
    async fetchChats () {
      try {
        const response = await chatApi.getChats(this.chatRequest)
        this.totalRecords = response.total
        this.fetchedMessages = response.response.list
        const realNames = await this.getUserRealNames(response.response.list)
        this.fetchedMessages = response.response.list.map((message, index) => {
          return {
            ...message,
            realName: realNames[index] // 假设realNames与response.response.list一一对应
          }
        })
      } catch (error) {
        console.error('Failed to fetch chats:', error)
      }
    },
    handleSizeChange (size) {
      this.pageSize = size
      this.fetchChats(1, size) // 切换每页大小时重置到第一页
    },
    handleCurrentChange (page) {
      this.currentPage = page
      this.fetchChats(page, this.pageSize) // 切换页码时重新获取聊天记录
    },
    formatDate (timestamp) {
      const date = new Date(timestamp)
      return date.toLocaleTimeString() // 格式化为可读的时间字符串
    },
    async getUserRealNames (messages) {
      try {
        // 提取所有的userId
        const userIds = messages.map(message => message.userId)
        // 调用接口获取真实姓名
        const response = await chatApi.getReal(userIds)
        // 假设接口返回的数据结构是一个数组，包含了对应userId的真实姓名
        console.log(response.response)
        return response.response
      } catch (error) {
        console.error('Failed to get user real names:', error)
        return []
      }
    }
  }
}
</script>

<style scoped>
.chat-records {
  padding: 10px 0;
}

.chat-record {
  display: flex;
  align-items: center;
  margin-bottom: 10px;
  padding: 10px;
  border-radius: 4px;
  background-color: #f2f6fc;
}

.chat-time {
  font-size: smaller;
  color: #818796;
}

.chat-record > * {
  margin-right: 10px;
}
</style>
