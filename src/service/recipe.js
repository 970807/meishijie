import axios from '@/utils/axios'

export function getDetail({ id }) {
  return axios.get(`/recipe/getDetail/${id}`)
}
