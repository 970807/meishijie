import axios from '@/utils/axios'

export function registerByAccount(params) {
  return axios.post('/login/registerByAccount', params)
}
