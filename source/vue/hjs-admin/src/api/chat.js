import { post } from '@/utils/request'

export default {
  getChats: query => post('/api/admin/chat/getChats', query),
  sendAMessage: query => post('/api/admin/chat/sendMessage', query),
  getReal: query => post('/api/admin/chat/getReal', query)
}
