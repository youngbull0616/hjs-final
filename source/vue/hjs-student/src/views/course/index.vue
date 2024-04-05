<template>
  <el-row>
    <el-col :span="4" v-for="(course, index) in courseList" :key="course.id" :offset="index > 0 ? 2 : 0">
      <el-card :body-style="{ padding: '0px' }" class="course-card">
        <img :src="courseImage" class="image">
        <div style="padding: 14px;">
          <span>{{ course.name }}</span>
          <div class="bottom clearfix">
            <time class="level name">{{ course.levelName }}</time>
            <!-- 点击查看课程按钮 -->
            <el-button type="text" class="button" @click="viewCourse(course.id)">查看课程</el-button>
          </div>
        </div>
      </el-card>
    </el-col>
  </el-row>
</template>

<script>
import courseApi from '@/api/course'
export default {
  data () {
    return {
      courseList: [], // 存储课程列表数据
      courseImage: 'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png' // 设置默认课程图片
    }
  },
  created () {
    // 在页面创建时调用课程列表接口，获取数据
    this.fetchCourseList()
  },
  methods: {
    // 获取课程列表数据的方法
    fetchCourseList () {
      courseApi.list()
        .then(response => {
          // 成功获取到数据时，将数据存储到 courseList 变量中
          this.courseList = response.response
        })
        .catch(error => {
          // 获取数据失败时，进行错误处理
          console.error('获取课程列表失败：', error)
        })
    },
    // 处理查看课程按钮点击事件
    viewCourse (courseId) {
      // 使用路由导航到课程详情页，并将课程ID作为参数传递
      this.$router.push({ name: 'CourseDetail', params: { id: courseId } })
    }
  }
}
</script>

<style scoped>
.level name {
  font-size: 13px;
  color: #999;
}

.bottom {
  margin-top: 13px;
  line-height: 12px;
}

.button {
  padding: 0;
  float: right;
}

.image {
  width: 100%;
  display: block;
}

.clearfix:before,
.clearfix:after {
  display: table;
  content: "";
}

.clearfix:after {
  clear: both
}

.course-card {
  width: 200px; /* 设置宽度 */
  height: 300px; /* 设置高度 */
}
</style>
