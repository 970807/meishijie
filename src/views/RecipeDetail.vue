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

<script>
import { defineComponent, reactive, toRefs } from 'vue'
import { useRoute } from 'vue-router'
import { getDetail } from '@/service/recipe'
import HeaderArea from '../components/HeaderArea.vue'
import RecipeDetailHeader from '../components/RecipeDetailHeader.vue'
import RecipeDetailAuthorInfo from '../components/RecipeDetailAuthorInfo.vue'
import RecipeDetailRecipeStep from '../components/RecipeDetailRecipeStep.vue'
import RecipeDetailFinishImage from '../components/RecipeDetailFinishImage.vue'
import RecipeDetailRecipeTip from '../components/RecipeDetailRecipeTip.vue'

export default defineComponent({
  components: {
    HeaderArea,
    RecipeDetailHeader,
    RecipeDetailAuthorInfo,
    RecipeDetailRecipeStep,
    RecipeDetailFinishImage,
    RecipeDetailRecipeTip
  },
  setup() {
    const route = useRoute()
    const recipeId = route.params.id

    const state = reactive({
      recipeInfo: []
    })

    function getRecipeDetail(id) {
      getDetail({ id }).then(res => {
        console.log(res.data)
        state.recipeInfo = res.data
      })
    }

    getRecipeDetail(recipeId)

    return {
      ...toRefs(state)
    }
  }
})
</script>
