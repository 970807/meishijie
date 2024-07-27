import axios, { AxiosRequestConfig, AxiosResponse } from 'axios'
import { useUserStore } from '@/store/user'

interface IResponseData<T = any> {
  code: string
  data: T
}

axios.defaults.baseURL = import.meta.env.VITE_REQUEST_BASE_URL

const userStore = useUserStore()

axios.interceptors.request.use((config: AxiosRequestConfig) => {
  if (!config.headers) {
    config.headers = {}
  }
  if (userStore.hasToken) {
    config.headers.Authorization = `Bearer ${userStore.token}`
  }
  return config
})

axios.interceptors.response.use((res: AxiosResponse<IResponseData>) => {
  if (res.data.code !== '200') {
    if (res.data.code === '401') {
      // token过期或不正确
      localStorage.removeItem('token')
      userStore.$reset()
    }
    return Promise.reject(res.data)
  }
  return res.data
})

// 常用方法封装
const request = {
  get<T>(url: string, params?: object): Promise<IResponseData<T>> {
    return axios.get(url, { params })
  },
  post<T>(url: string, params?: object): Promise<IResponseData<T>> {
    return axios.post(url, params)
  },
  put<T>(url: string, params?: object): Promise<IResponseData<T>> {
    return axios.put(url, params)
  },
  delete<T>(url: string, params?: object): Promise<IResponseData<T>> {
    return axios.delete(url, { params })
  },
}

export default request
