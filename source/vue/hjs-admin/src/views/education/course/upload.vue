<template>
  <div class="app-container">

    <el-form :model="form" ref="form" label-width="100px" v-loading="formLoading">
      <el-form-item label="课程id：">
        <el-input v-model="form.id" :readonly="true"></el-input>
      </el-form-item>
      <el-form-item label="课程名称：">
        <el-input v-model="form.name" :readonly="true"></el-input>
      </el-form-item>
      <el-form-item label="学科id：">
        <el-input v-model="form.subjectId" :readonly="true"></el-input>
      </el-form-item>
      <el-form-item label="年级：">
        <el-input v-model="form.levelName" :readonly="true"></el-input>
      </el-form-item>
      <el-form-item label="课程视频：">
        <el-card style="width: auto">
          <video controls>
            <!-- 使用动态绑定的方式设置视频源链接 -->
            <source :src="customVideoLink" type="video/mp4">
          </video>
        </el-card>
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
              <el-button size="mini" type="danger" @click="handleDelete(scope.row)">删除</el-button>
            </template>
          </el-table-column>
        </el-table>
      </el-form-item>
      <el-form-item label="上传课件：">
        <el-upload
          action="#"
          :http-request="uploadFile"
          :with-credentials="true"
          list-type="picture-card"
          :auto-upload="true"
          @change="handleFileChange">
          <i slot="default" class="el-icon-plus"></i>
          <div slot="file" slot-scope="{file}">
            <img
              class="el-upload-list__item-thumbnail"
              :src="file.url" alt=""
            >
            <p>{{file.name}}</p>
            <span class="el-upload-list__item-actions">

            <span
              class="el-upload-list__item-preview"
              @click="handlePictureCardPreview(file)"
             >
          <i class="el-icon-zoom-in"></i>
        </span>
        <span
          v-if="!disabled"
          class="el-upload-list__item-delete"
          @click="handleDownload(file)"
        >
          <i class="el-icon-download"></i>
        </span>
        <span
          v-if="!disabled"
          class="el-upload-list__item-delete"
          @click="handleRemove(file)"
        >
          <i class="el-icon-delete"></i>
        </span>
      </span>
          </div>
        </el-upload>
        <el-dialog :visible.sync="dialogVisible">
          <img width="100%" :src="dialogImageUrl" alt="">
        </el-dialog>
      </el-form-item>
      <el-form-item label="上传视频：" >
        <el-upload
          class="upload-demo"
          drag
          action="#"
          :http-request="uploadVideo"
          multiple
          :auto-upload="true"
          accept=".avi, .mp4, .dat, .mkv, .flv, .vob, .mpeg, .mov, .asf, .wmv, .3gp, .rm, .rmvb, .ts, .navi">
          <i class="el-icon-upload"></i>
          <div class="el-upload__text">将视频拖到此处，或<em>点击上传</em></div>
        </el-upload>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="submitForm">提交</el-button>
        <el-button @click="resetForm">重置</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import { mapGetters, mapState, mapActions } from 'vuex'
import courseApi from '@/api/course'
import fileApi from '@/api/file'

export default {
  data () {
    return {
      form: {
        subjectId: '',
        id: null,
        name: '',
        level: 1,
        levelName: ''
      },
      formLoading: false,
      dialogImageUrl: '',
      dialogVisible: false,
      disabled: false,
      fileList: [],
      file: '',
      customVideoLink: ''
    }
  },
  created () {
    this.initSubject()
    let id = this.$route.query.id
    let _this = this

    if (id && parseInt(id) !== 0) {
      _this.formLoading = true
      courseApi.select(id).then(re => {
        _this.form = re.response
        _this.formLoading = false
      })
    }
    this.getFiles(id)
    this.getVideoLink(id)
  },
  methods: {
    submitForm () {
      let _this = this
      this.formLoading = true
      this.form.levelName = this.enumFormat(this.levelEnum, this.form.level)
      courseApi.edit(this.form).then(data => {
        if (data.code === 1) {
          _this.$message.success(data.message)
          _this.delCurrentView(_this).then(() => {
            _this.$router.push('/education/course/list')
          })
        } else {
          _this.$message.error(data.message)
          _this.formLoading = false
        }
      }).catch(e => {
        _this.formLoading = false
      })
    },
    uploadFile (item) {
      this.file = item.file
      if (!this.file) {
        this.$message.error('请选择要上传的文件')
        return
      }
      let formData = new FormData()
      formData.append('file', this.file)
      formData.append('courseId', this.form.id)
      console.log(formData)
      // 发送HTTP请求
      fileApi.upload(formData).then(data => {
        if (data.code === 1) {
          this.$message.success(data.message)
        } else {
          this.$message.error(data.message)
        }
      }).catch(e => {
        this.$message.error('文件上传失败')
        console.error('文件上传失败:', e)
      })
    },
    uploadVideo (file) {
      this.file = file.file
      if (!this.file) {
        this.$message.error('请选择要上传的文件')
        return
      }
      let formData = new FormData()
      formData.append('file', this.file)
      formData.append('courseId', this.form.id)
      console.log(formData)
      // 发送HTTP请求
      fileApi.uploadVideo(formData).then(data => {
        if (data.code === 1) {
          this.$message.success(data.message)
        } else {
          this.$message.error(data.message)
        }
      }).catch(e => {
        this.$message.error('文件上传失败')
        console.error('文件上传失败:', e)
      })
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
    getVideoLink (id) {
      fileApi.getVideoLink(id).then(response => {
        console.log(response.response)
        if (response.code === 1) {
          if (response.response && response.response.length > 0) {
            this.customVideoLink = response.response[0]
          } else {
            this.$message.error('视频链接数组为空')
          }
        } else {
          this.$message.error(response.message)
        }
      }).catch(error => {
        this.$message.error('获取视频链接失败', error)
      })
    },
    handleFileChange (file, fileList) {
      // 获取选择的文件并将其分配给 this.file
      this.file = file.raw
    },
    resetForm () {
      let lastId = this.form.id
      this.$refs['form'].resetFields()
      this.form = {
        id: null,
        name: '',
        level: 1,
        levelName: ''
      }
      this.form.id = lastId
    },
    handleRemove (file) {
      console.log(file)
    },
    handlePictureCardPreview (file) {
      this.dialogImageUrl = file.url
      this.dialogVisible = true
    },
    handleDownload (file) {
      console.log(file)
    },
    handleDelete (row) {
      const fileId = row.id // 假设文件id存储在row对象的id属性中
      console.log(row)
      fileApi.deleteFile(fileId)
        .then(response => {
          if (response.code === 1) {
            this.$message.success('文件删除成功')
            this.getFiles(row.courseId)
          } else {
            this.$message.error('文件删除失败')
          }
        })
        .catch(error => {
          console.error('文件删除失败:', error)
          this.$message.error('文件删除失败')
        })
    },
    ...mapActions('tagsView', { delCurrentView: 'delCurrentView' }),
    ...mapActions('exam', { initSubject: 'initSubject' })
  },
  computed: {
    ...mapGetters('enumItem', [
      'enumFormat'
    ]),
    ...mapGetters('exam', ['subjectEnumFormat']),
    ...mapState('enumItem', {
      levelEnum: state => state.user.levelEnum
    }),
    ...mapState('exam', { subjects: state => state.subjects })
  }
}
</script>
