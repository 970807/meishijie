import request from '@/utils/axios'

// 获取菜谱详情
export function getDetail<T>({ id }: { id: string | number }) {
  return request.get<T>(`/recipe/getDetail/${id}`)
}

// 搜索菜谱
export function searchReipce<T>(data: object) {
  return request.post<T>('/recipe/search', data)
}
