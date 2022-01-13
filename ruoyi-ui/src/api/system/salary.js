import request from '@/utils/request'

// 查询工资列表
export function listSalary(query) {
  return request({
    url: '/system/salary/list',
    method: 'get',
    params: query
  })
}

// 查询工资详细
export function getSalary(salaryId) {
  return request({
    url: '/system/salary/' + salaryId,
    method: 'get'
  })
}

// 新增工资
export function addSalary(data) {
  return request({
    url: '/system/salary',
    method: 'post',
    data: data
  })
}

// 修改工资
export function updateSalary(data) {
  return request({
    url: '/system/salary',
    method: 'put',
    data: data
  })
}

// 删除工资
export function delSalary(salaryId) {
  return request({
    url: '/system/salary/' + salaryId,
    method: 'delete'
  })
}

export function handleSalary() {
  return request({
    url: '/system/salary/handleSalary',
    method: 'post',
  })
}
