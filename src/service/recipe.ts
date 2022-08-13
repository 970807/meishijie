import request from '@/utils/axios'

// 获取菜谱详情
export function getDetail<T>({ id }: { id: string | number }) {
  return request.get<T>(`/recipe/getDetail/${id}`)
}
