import { post } from '@/utils/request'

export default {
  list: query => post('/api/admin/education/course/list'),
  pageList: query => post('/api/admin/education/course/page', query),
  edit: query => post('/api/admin/education/course/edit', query),
  select: id => post('/api/admin/education/course/select/' + id),
  deleteSubject: id => post('/api/admin/education/course/delete/' + id)
}
