import request from '../utils/axios'

// 获取用户信息
export function getUserInfo<T>() {
  return request.get<T>('/user/getUserInfo')
}
