<template>
  <div>
    <el-card>
      <div slot="header" class="clearfix">
        <span>课程详情</span>
        <el-button type="text" @click="goBack" class="button">返回</el-button>
      </div>
      <div>
        <el-form label-width="100px">
          <el-form-item label="课程名称">
            <span>{{ course.name }}</span>
          </el-form-item>
          <el-form-item label="课程等级">
            <span>{{ course.levelName }}</span>
          </el-form-item>
          <el-form-item label="课程视频：">
            <video controls style="width: 100%;">
              <source :src="videoStreamUrl" type="video/mp4">
            </video>
          </el-form-item>
          <el-form-item label="课件列表：">
            <el-table
              :data="fileList"
              style="width: 100%">
              <el-table-column
                label="名称"
                prop="fileName">
              </el-table-column>
              <el-table-column align="right">
                <template slot-scope="scope">
                  <el-button size="mini" type="success" @click="downloadFile(scope.row)">下载</el-button>
                </template>
              </el-table-column>
            </el-table>
          </el-form-item>
        </el-form>
      </div>
    </el-card>
  </div>
</template>

<script>

import fileApi from '@/api/file'
import axios from 'axios'

export default {
  data () {
    return {
      course: null,
      formLoading: false,
      dialogImageUrl: '',
      dialogVisible: false,
      disabled: false,
      fileList: [],
      file: '',
      videoStreamUrl: '' // 返回的视频流地址
    }
  },
  created () {
    // 从路由参数中获取课程ID
    const courseId = this.$route.params.id
    // 这里可以使用课程ID向后端请求获取课程详情数据，这里仅为示例，假设已经从后端获取了课程详情数据
    this.course = {
      id: courseId,
      name: '测试课程',
      levelName: '大一'
    }
    this.getVideoStreamUrl(this.$route.params.id)
    this.getFiles(courseId)
  },
  methods: {
    goBack () {
      this.$router.go(-1) // 返回上一页
    },
    getFiles (courseId) {
      fileApi.getFiles(courseId).then(data => {
        if (data.code === 1) {
          // 清空现有的文件列表
          this.fileList = []
          // 解析后端返回的文件信息并添加到文件列表中
          for (let i = 0; i < data.response.length; i++) {
            // 解析每个文件对象的 JSON 字符串
            const fileObject = JSON.parse(data.response[i])
            // 将文件对象添加到文件列表中
            this.fileList.push(fileObject)
          }
        } else {
          this.$message.error(data.message)
        }
      }).catch(e => {
        this.$message.error('文件获取失败')
        console.error('文件获取失败:', e)
      })
    },
    async getVideoStreamUrl (id) {
      try {
        const response = await axios.post('/api/student/file/videos', id, {
          responseType: 'blob' // 设置响应类型为 Blob 对象
        })

        if (response.status === 200) {
          const blob = response.data
          this.videoStreamUrl = URL.createObjectURL(blob, { type: 'video/mp4' })
          console.log(this.videoStreamUrl)
        } else {
          console.error('Failed to fetch video URL')
        }
      } catch (error) {
        console.error('Error fetching video URL:', error)
      }
    },
    async blobToBase64 (blob) {
      return new Promise((resolve, reject) => {
        const reader = new FileReader()
        reader.onload = () => {
          const base64String = reader.result.split(',')[1] // 移除 data URL 前缀
          resolve(base64String)
        }
        reader.onerror = error => {
          reject(error)
        }
        reader.readAsDataURL(blob)
      })
    },
    downloadFile (file) {
    // 发起 POST 请求到后端下载文件
      fetch('/api/student/file/downloadFile', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: file.fileName
      })
        .then(response => {
        // 如果响应状态码为 200，表示下载成功
          if (response.ok) {
          // 获取文件名和后缀名
            const contentDisposition = response.headers.get('Content-Disposition')
            const fileNameRegex = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/
            const matches = fileNameRegex.exec(contentDisposition)
            let fileName = 'downloaded'
            if (matches != null && matches[1]) {
              fileName = matches[1].replace(/['"]/g, '')
            }

            // 将响应流转换为 Blob 对象
            return response.blob()
              .then(blob => {
                return { blob, fileName }
              })
          } else {
            throw new Error('下载失败')
          }
        })
        .then(({ blob, fileName }) => {
        // 创建下载链接
          const downloadLink = document.createElement('a')
          downloadLink.href = URL.createObjectURL(blob)
          downloadLink.download = fileName
          downloadLink.click()
        })
        .catch(error => {
          console.error('文件下载失败:', error)
        })
    }
  }
  // mounted () {
  //   //this.getVideoStreamUrl(this.$route.params.id)
  // }
}
</script>

<style scoped>
.button {
  float: right;
}
</style>
