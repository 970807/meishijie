// 今日热门视频菜谱
export interface IHotTodayVideoItem {
  id: number
  title: string
  coverUrl: string
  linkUrl: string
  userAvatar: string
  username: string
  videoUrl: string
}

// 是否今日热搜
export enum EnumHotTodaySearchIsHot {
  hot = 1,
  normal = 0
}

// 今日热搜
export interface IHotTodaySearchItem {
  id: number
  label: string
  isHot: EnumHotTodaySearchIsHot
}

// 今日三餐
export interface IThreeMealsTodayItem {
  id: number
  label: string
  list: Array<{
    id: string
    recipeName: string
    coverUrl: string
    desc: string
  }>
}

// 推荐列表
export interface IRecommentItem {
  id: number
  columnTitle: string
  list: Array<{
    id: string
    authorId: number
    authorAvatar: string
    authorName: string
    coverUrl: string
    ingredientStr: string
    recipeName: string
    isVideo: boolean
  }>
}
