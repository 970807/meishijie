import axios from 'axios'

axios.defaults.baseURL = '//localhost:3000'

axios.interceptors.response.use((res) => {
  return res.data
})

export default axios
