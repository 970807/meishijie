<template>
  <div class="recipe-detail">
    <HeaderArea />
    <RecipeDetailHeader />
    <RecipeDetailAuthorInfo />
    <RecipeDetailRecipeStep />
    <RecipeDetailFinishImage />
    <RecipeDetailRecipeTip />
  </div>
</template>

<script>
import { defineComponent } from 'vue'
import { useRoute } from 'vue-router'
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
    console.log(recipeId)
  }
})
</script>
