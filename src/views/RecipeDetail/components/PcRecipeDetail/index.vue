<template>
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
</template>

<script lang="ts" setup>
import RecipeDetailHeader from './RecipeDetailHeader.vue'
import RecipeDetailAuthorInfo from './RecipeDetailAuthorInfo.vue'
import RecipeDetailRecipeStep from './RecipeDetailRecipeStep.vue'
import RecipeDetailFinishImage from './RecipeDetailFinishImage.vue'
import RecipeDetailRecipeTip from './RecipeDetailRecipeTip.vue'
import type { IRecipeInfo } from '../../types'

defineProps<{
  recipeInfo: IRecipeInfo
}>()
</script>
