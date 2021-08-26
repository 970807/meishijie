import axios from '@/utils/axios'

export function getHotTodayVideoList() {
  return axios.get('/home/getHotTodayVideoList')
}

export function getHotTodaySearchList() {
  return axios.get('/home/getHotTodaySearchList')
}

export function getThreeMealsTodayList() {
  return axios.get('/home/getThreeMealsTodayList')
}

export function getRecommentList() {
  return axios.get('/home/getRecommentList')
}
