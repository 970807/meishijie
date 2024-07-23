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
      :recipeQrcode="recipeInfo.recipeQrcode"
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
import { IRecipeInfo } from '@/types/recipeDetail'
import { getDetail } from '@/service/recipe'
import HeaderArea from '@/components/HeaderArea.vue'
import RecipeDetailHeader from '@/components/RecipeDetailHeader.vue'
import RecipeDetailAuthorInfo from '@/components/RecipeDetailAuthorInfo.vue'
import RecipeDetailRecipeStep from '@/components/RecipeDetailRecipeStep.vue'
import RecipeDetailFinishImage from '@/components/RecipeDetailFinishImage.vue'
import RecipeDetailRecipeTip from '@/components/RecipeDetailRecipeTip.vue'

const route = useRoute()

let recipeId = route.params.id
if (Array.isArray(recipeId)) {
  recipeId = recipeId[0]
}
const recipeInfo = ref<IRecipeInfo>({} as IRecipeInfo)

function getRecipeDetail(id: string | number) {
  getDetail<IRecipeInfo>({ id }).then((res) => {
    recipeInfo.value = res.data
  })
}

getRecipeDetail(recipeId)
</script>
