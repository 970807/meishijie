import axios from 'axios'
import router from '../router'
import store from '../store'

axios.defaults.baseURL =
  process.env.NODE_ENV === 'development'
    ? '//localhost:3000'
    : '//120.24.190.100:3000'

axios.interceptors.request.use((config) => {
  const token = store.state.token
  if (token) {
    config.headers.Authorization = `Bearer ${token}`
  }
  return config
})

axios.interceptors.response.use((res) => {
  if (res.data.code !== '200') {
    if (res.data.code === '401') {
      // token过期或不正确
      localStorage.removeItem('token')
      store.commit('setToken', '')
    }
    return Promise.reject(res.data)
  }
  return res.data
})

export default axios
