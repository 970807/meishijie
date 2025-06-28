// 首页系统栏位配置
export interface IHomeSystemColumnConfig {
  id: string // 栏位id
  columnName: string // 栏位名称
  available: 1 | 0 // 是否启用
  sortNo: number // 排序值
}
// 今日热门视频菜谱
export interface IHotTodayVideoItem {
  id: string
  recipeName: string // 菜谱标题
  coverUrl: string // 封面图url
  linkUrl: string // 美食杰官方菜谱链接
  authorName: string // 菜谱作者名称
  authorAvatar: string // 菜谱作者头像
  videoUrl: string // 视频url
}

// 是否热门热搜 (热门热搜会有红色背景)
export enum EnumHotTodaySearchIsHot {
  hot = 1, // 是
  normal = 0, // 否
}

// 今日热搜
export interface IHotTodaySearchItem {
  id: string
  keyword: string // 热搜关键词
  superHot: EnumHotTodaySearchIsHot // 是否热门热搜
  sortNo: number
}

// 今日三餐
export interface IThreeMealsTodayItem {
  id: number
  label: string // 栏目标题
  list: Array<{
    id: string
    recipeName: string // 菜谱名称
    coverUrl: string // 封面图url
    recommendWords: string // 推荐词
  }>
}

// 首页自定义栏位
export interface IHomeCustomColumns {
  id: string // 栏位id
  columnName: string // 栏位名称
  list: Array<{
    id: string
    recipeName: string // 菜谱名称
    coverUrl: string // 封面图url
    isVideo: 1 | 0 // 是否是视频菜谱
    authorId: string // 作者id
    authorAvatar: string // 作者头像
    authorName: string // 作者名称
    ingredientStr: string // 食材
  }>
}
