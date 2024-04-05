import { post } from '@/utils/request'

export default {
  upload: query => post('/api/admin/file/upload', query),
  getFiles: query => post('/api/admin/file/getFiles', query),
  deleteFile: query => post('/api/admin/file/deleteFile', query),
  uploadVideo: query => post('/api/admin/file/uploadVideo', query),
  getVideoLink: query => post('/api/admin/file/getVideoLink', query)
}
