export interface IMainIngredientListItem {
  ingredientName: string
  ingredientDose: string
}

export interface ISubIngredientListItem {
  ingredientName: string
  ingredientDose: string
}

export interface IStepListItem {
  content: string
  img: string
}

export interface IRecipeInfo {
  authorAvatar: string
  authorFanCount: number
  authorId: number
  authorNickname: string
  authorRecipeCount: number
  authorWords: string
  browerCount: number
  coverUrl: string
  createTime: string
  favCount: number
  finishFoodImgList: string[]
  id: string
  isVideo: number
  mainIngredientList: IMainIngredientListItem[]
  subIngredientList: ISubIngredientListItem[]
  originWebLink: string
  peopleCount: number
  recipeName: string
  recipeQrcode: string
  recipeTips: string
  simpleIntroductionDifficulty: string
  simpleIntroductionTaste: string
  simpleIntroductionTechnology: string
  simpleIntroductionTime: string
  stepList: IStepListItem[]
  updateTime: string
  videoUrl: string | null
}
