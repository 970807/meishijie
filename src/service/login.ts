import request from '../utils/axios'

// 账号密码方式注册
export function registerByAccount<T>(params: any) {
  return request.post<T>('/login/registerByAccount', params)
}

// 账号密码方式登录
export function loginByAccount<T>(params: any) {
  return request.post<T>('/login/loginByAccount', params)
}
