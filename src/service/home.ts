import request from '@/utils/axios'

// 获取首页系统栏位配置
export function getHomeSystemColumnConfig<T>() {
  return request.get<T>('/home/getHomeSystemColumnConfig')
}

// 获取今日热门视频菜谱
export function getHotTodayVideoList<T>() {
  return request.get<T>('/home/getHotTodayVideoList')
}

// 获取今日热搜
export function getHotTodaySearchList<T>() {
  return request.get<T>('/home/getHotTodaySearchList')
}

// 获取今日三餐
export function getThreeMealsTodayList<T>() {
  return request.get<T>('/home/getThreeMealsTodayList')
}

// 获取首页自定义栏位
export function getHomeCustomColumns<T>() {
  return request.get<T>('/home/getHomeCustomColumns')
}
