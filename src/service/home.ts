import request from '@/utils/axios'

// 今日热门视频菜谱
export function getHotTodayVideoList<T>() {
  return request.get<T>('/home/getHotTodayVideoList')
}

// 今日热搜
export function getHotTodaySearchList<T>() {
  return request.get<T>('/home/getHotTodaySearchList')
}

// 今日三餐
export function getThreeMealsTodayList<T>() {
  return request.get<T>('/home/getThreeMealsTodayList')
}

// 推荐列表
export function getRecommentList<T>() {
  return request.get<T>('/home/getRecommentList')
}
