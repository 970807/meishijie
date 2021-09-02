import axios from '@/utils/axios'

export function getVerificationCode(params) {
  return axios.get('/login/getVerificationCode', { params })
}

export function registerByPhone(params) {
  return axios.post('/login/registerByPhone', params)
}
