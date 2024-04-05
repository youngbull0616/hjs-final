import { post } from '@/utils/request'

export default {
  upload: query => post('/api/student/file/upload', query),
  getFiles: query => post('/api/student/file/getFiles', query),
  getVideoLink: query => post('/api/student/file/getVideoLink', query),
  downloadFile: query => post('/api/student/file/downloadFile', query)
}
