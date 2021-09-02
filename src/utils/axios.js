import axios from 'axios'

axios.defaults.baseURL =
  process.env.NODE_ENV === 'development'
    ? '//localhost:3000'
    : '//120.24.190.100:3000'

axios.interceptors.response.use((res) => {
  if (res.data.code !== '200') {
    return Promise.reject(res.data)
  }
  return res.data
})

export default axios
