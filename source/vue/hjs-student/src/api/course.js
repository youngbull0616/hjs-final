import { post } from '@/utils/request'

export default {
  list: query => post('/api/student/education/course/list'),
  pageList: query => post('/api/student/education/course/page', query),
  edit: query => post('/api/student/education/course/edit', query),
  select: id => post('/api/student/education/course/select/' + id),
  deleteSubject: id => post('/api/student/education/course/delete/' + id)
}
