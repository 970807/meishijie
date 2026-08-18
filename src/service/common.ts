import request from '@/utils/axios'

// 获取系统参数配置列表
export function getSystemConfigs<T>() {
  return request.get<T>('/common/getSystemConfigs')
}
