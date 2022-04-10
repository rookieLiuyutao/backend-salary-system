import request from '@/utils/request'

// 查询出勤列表
export function listAttendance(query) {
  return request({
    url: '/system/attendance/list',
    method: 'get',
    params: query
  })
}

// 查询出勤详细
export function getAttendance(absenceId) {
  return request({
    url: '/system/attendance/' + absenceId,
    method: 'get'
  })
}

// 新增出勤
export function addAttendance(data) {
  return request({
    url: '/system/attendance',
    method: 'post',
    data: data
  })
}

// 修改出勤
export function updateAttendance(data) {
  return request({
    url: '/system/attendance',
    method: 'put',
    data: data
  })
}

// 删除出勤
export function delAttendance(absenceId) {
  return request({
    url: '/system/attendance/' + absenceId,
    method: 'delete'
  })
}

