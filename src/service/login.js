import axios from '@/utils/axios'

export function registerByAccount(params) {
  return axios.post('/login/registerByAccount', params)
}

export function loginByAccount(params) {
  return axios.post('/login/loginByAccount', params)
}
