import axios from 'axios'

axios.defaults.baseURL =
  process.env.NODE_ENV === 'development'
    ? '//localhost:3000'
    : '//meishijie.ggh0807.cn:3000'

axios.interceptors.response.use((res) => {
  return res.data
})

export default axios
