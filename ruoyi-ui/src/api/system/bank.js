import request from '@/utils/request'

// 查询银行扣税列表
export function listBank(query) {
  return request({
    url: '/system/bank/list',
    method: 'get',
    params: query
  })
}

// 查询银行扣税详细
export function getBank(bankcardId) {
  return request({
    url: '/system/bank/' + bankcardId,
    method: 'get'
  })
}

// 新增银行扣税
export function addBank(data) {
  return request({
    url: '/system/bank',
    method: 'post',
    data: data
  })
}

// 修改银行扣税
export function updateBank(data) {
  return request({
    url: '/system/bank',
    method: 'put',
    data: data
  })
}

// 删除银行扣税
export function delBank(bankcardId) {
  return request({
    url: '/system/bank/' + bankcardId,
    method: 'delete'
  })
}

//完成税率的计算
export function handleTax() {
  return request({
    url: '/system/bank/handleTax',
    method: 'post'

  })
}
