import { post } from '@/utils/request'

export default {
  getChats: query => post('/api/student/chat/getChats', query),
  sendAMessage: query => post('/api/student/chat/sendMessage', query),
  getReal: query => post('/api/student/chat/getReal', query)
}
