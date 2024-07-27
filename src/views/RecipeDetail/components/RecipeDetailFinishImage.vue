<template>
  <h2 class="title">{{ recipeName }}的成品图</h2>
  <!-- <div class="finish-images-swiper">
    <img :src="finishFoodImgList[0]">
  </div> -->
  <div class="finish-images-swiper">
    <div class="swiper-wrapper">
      <div
        class="swiper-slide"
        v-for="(item, index) in finishFoodImgList"
        :key="index"
      >
        <img :src="item" />
      </div>
    </div>
    <div class="swiper-pagination"></div>
  </div>
</template>

<script setup lang="ts">
import Swiper, { Pagination } from 'swiper'
import { onMounted } from 'vue'
import 'swiper/swiper-bundle.min.css'
Swiper.use([Pagination])

interface IProps {
  recipeName: string
  finishFoodImgList: string[]
}

defineProps<IProps>()

onMounted(() => {
  const swiper = new Swiper('.finish-images-swiper', {
    pagination: {
      el: '.swiper-pagination',
      clickable: true,
    },
  })
})
</script>

<style lang="scss" scoped>
h2.title {
  width: 900px;
  height: 32px;
  line-height: 32px;
  margin: 20px auto 0;
  padding: 20px 0;
  font-size: 24px;
  color: #222;
  font-weight: 600;
}

.finish-images-swiper {
  position: relative;
  width: 900px;
  height: 500px;
  margin: 0 auto;
  padding: 24px 0;
  background: #fff;
  border-radius: 12px;
  box-sizing: border-box;
  overflow: hidden;

  .swiper-slide {
    position: relative;

    img {
      width: calc(900px - 48px);
      height: calc(500px - 48px);
      padding: 0 24px;
      object-fit: cover;
    }
  }

  .swiper-pagination {
    bottom: 36px;
    left: 0;
    right: 0;
    :deep(.swiper-pagination-bullet-active) {
      background: #f42e2b;
    }
  }
}
</style>
