// 今日热门视频菜谱
export interface IHotTodayVideoItem {
  id: number
  title: string // 菜谱标题
  coverUrl: string // 封面图url
  linkUrl: string // 美食杰官方菜谱链接
  userAvatar: string // 菜谱作者头像
  username: string // 菜谱作者名称
  videoUrl: string // 视频url
}

// 是否热门热搜 (热门热搜会有红色背景)
export enum EnumHotTodaySearchIsHot {
  hot = 1, // 是
  normal = 0, // 否
}

// 今日热搜
export interface IHotTodaySearchItem {
  id: number
  label: string // 热搜标签
  isHot: EnumHotTodaySearchIsHot // 是否热门热搜
}

// 今日三餐
export interface IThreeMealsTodayItem {
  id: number
  label: string // 栏目标题
  list: Array<{
    id: string
    recipeName: string // 食谱标题
    coverUrl: string // 封面图url
    desc: string // 描述
  }>
}

// 推荐列表
export interface IRecommentItem {
  id: number
  columnTitle: string // 栏目标题
  list: Array<{
    id: string
    authorId: string // 作者id
    authorAvatar: string // 作者头像url
    authorName: string // 作者名称
    coverUrl: string // 封面图url
    ingredientStr: string // 菜谱材料
    recipeName: string // 菜谱名称
    isVideo: boolean // 是否视频菜谱 1：是 0：否
  }>
}
