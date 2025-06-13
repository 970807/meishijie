<template>
  <div class="recipe-detail">
    <HeaderArea />
    <RecipeDetailHeader
      :isVideo="recipeInfo.isVideo"
      :coverUrl="recipeInfo.coverUrl"
      :videoUrl="recipeInfo.videoUrl"
      :recipeName="recipeInfo.recipeName"
      :authorNickname="recipeInfo.authorNickname"
      :favCount="recipeInfo.favCount"
      :browerCount="recipeInfo.browerCount"
      :simpleIntroductionTechnology="recipeInfo.simpleIntroductionTechnology"
      :simpleIntroductionTaste="recipeInfo.simpleIntroductionTaste"
      :simpleIntroductionTime="recipeInfo.simpleIntroductionTime"
      :simpleIntroductionDifficulty="recipeInfo.simpleIntroductionDifficulty"
      :mainIngredientList="recipeInfo.mainIngredientList"
      :subIngredientList="recipeInfo.subIngredientList"
      :createTime="recipeInfo.createTime"
    />
    <RecipeDetailAuthorInfo
      :authorNickname="recipeInfo.authorNickname"
      :authorAvatar="recipeInfo.authorAvatar"
      :authorRecipeCount="recipeInfo.authorRecipeCount"
      :authorFanCount="recipeInfo.authorFanCount"
      :authorWords="recipeInfo.authorWords"
    />
    <RecipeDetailRecipeStep
      :recipeName="recipeInfo.recipeName"
      :stepList="recipeInfo.stepList"
    />
    <RecipeDetailFinishImage
      v-if="recipeInfo.finishFoodImgList && recipeInfo.finishFoodImgList.length"
      :recipeName="recipeInfo.recipeName"
      :finishFoodImgList="recipeInfo.finishFoodImgList"
    />
    <RecipeDetailRecipeTip
      v-if="recipeInfo.recipeTips"
      :recipeTips="recipeInfo.recipeTips"
      :recipeName="recipeInfo.recipeName"
    />
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { useRoute } from 'vue-router'
import { getDetail } from '@/service/recipe'
import HeaderArea from '@/components/HeaderArea.vue'
import RecipeDetailHeader from './components/RecipeDetailHeader.vue'
import RecipeDetailAuthorInfo from './components/RecipeDetailAuthorInfo.vue'
import RecipeDetailRecipeStep from './components/RecipeDetailRecipeStep.vue'
import RecipeDetailFinishImage from './components/RecipeDetailFinishImage.vue'
import RecipeDetailRecipeTip from './components/RecipeDetailRecipeTip.vue'
import type { IRecipeInfo } from './types'

const route = useRoute()

let recipeId = route.params.id as string
const recipeInfo = ref<IRecipeInfo>({
  authorAvatar: '', // 作者头像url
  authorFanCount: 0, // 作者粉丝数
  authorId: '', // 作者Id
  authorNickname: '', // 作者昵称
  authorRecipeCount: 0, // 作者菜谱数
  authorWords: '', // 作者语录
  browerCount: 0, // 浏览数
  coverUrl: '', // 封面图url
  createTime: '', // 创建时间
  favCount: 0, // 收藏数
  finishFoodImgList: [], // 菜谱成品图url列表
  id: '', // 菜谱id
  isVideo: 0, // 是否是视频菜谱 1 => 是 0 => 否
  mainIngredientList: [], // 主料列表
  subIngredientList: [], // 辅料列表
  originWebLink: '', // 美食杰官方对应的链接
  peopleCount: 0, // 人份 例：3人份
  recipeName: '', // 菜谱名称
  recipeTips: '', // 烹饪技巧
  simpleIntroductionDifficulty: '', // 难度
  simpleIntroductionTaste: '', // 口味
  simpleIntroductionTechnology: '', // 工艺
  simpleIntroductionTime: '', // 时间
  stepList: [], // 菜谱步骤列表
  updateTime: '', // 更新时间
  videoUrl: null, // 视频url
})

/**
 * 获取菜谱详情
 * @param id 菜谱id
 */
function getRecipeDetail(id: string | number) {
  getDetail<IRecipeInfo>({ id }).then((res) => {
    recipeInfo.value = res.data
  })
}

getRecipeDetail(recipeId)
</script>
