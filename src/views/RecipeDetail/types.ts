// 主料列表
export interface IMainIngredientListItem {
  ingredientName: string // 名称
  ingredientDose: string // 用量
}

// 辅料列表
export interface ISubIngredientListItem {
  ingredientName: string // 名称
  ingredientDose: string // 用量
}

// 做法步骤列表
export interface IStepListItem {
  content: string // 内容
  img: string // 图片url
}

// 菜谱详情
export interface IRecipeInfo {
  authorAvatar: string // 作者头像url
  authorFanCount: number // 作者粉丝数
  authorId: string // 作者Id
  authorNickname: string // 作者昵称
  authorRecipeCount: number // 作者菜谱数
  authorWords: string // 作者语录
  browerCount: number // 浏览数
  coverUrl: string // 封面图url
  createTime: string // 创建时间
  favCount: number // 收藏数
  finishFoodImgList: string[] // 菜谱成品图url列表
  id: string // 菜谱id
  isVideo: number // 是否是视频菜谱 1 => 是 0 => 否
  mainIngredientList: IMainIngredientListItem[] // 主料列表
  subIngredientList: ISubIngredientListItem[] // 辅料列表
  peopleCount: number // 人份 例：3人份
  recipeName: string // 菜谱名称
  recipeTips: string // 烹饪技巧
  simpleIntroductionDifficulty: string // 难度
  simpleIntroductionTaste: string // 口味
  simpleIntroductionTechnology: string // 工艺
  simpleIntroductionTime: string // 时间
  stepList: IStepListItem[] // 菜谱步骤列表
  updateTime: string // 更新时间
  videoUrl: string | null // 视频url
}
