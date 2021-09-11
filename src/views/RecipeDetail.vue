<template>
  <div class="recipe-detail">
    <HeaderArea />
    <RecipeDetailHeader />
  </div>
</template>

<script>
import { useRoute } from 'vue-router'
import HeaderArea from '../components/HeaderArea.vue'
import RecipeDetailHeader from '../components/RecipeDetailHeader.vue'

export default {
  components: {
    HeaderArea,
    RecipeDetailHeader
  },
  setup() {
    const route = useRoute()
    const recipeId = route.params.id
    console.log(recipeId)
  }
}
</script>
