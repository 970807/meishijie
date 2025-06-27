<!-- 手机端页面顶部标题 -->
<template>
  <div class="app-head-wrap">
    <div class="icon-back" @click="goBack">
      <img width="24" height="24" :src="BackIcon" />
    </div>
    <span>{{ title }}</span>
  </div>
</template>

<script lang="ts" setup>
import BackIcon from '@/assets/images/back.svg'
import { useRouter } from 'vue-router'

const router = useRouter()

defineProps<{
  title: string // 页面标题
}>()

const goBack = () => {
  router.back()
}
</script>

<style lang="scss" scoped>
.app-head-wrap {
  position: fixed;
  top: 0;
  left: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: $app-head-height;
  font-size: 16px;
  color: #111827;
  background: #fff;
  z-index: 9999;

  .icon-back {
    position: absolute;
    left: 0;
    top: 50%;
    transform: translateY(-50%);
    width: 40px;
    height: 40px;
    display: flex;
    justify-content: center;
    align-items: center;
  }

  > span {
    color: #111827;
    font-weight: bold;
    font-size: 18px;
  }
}
</style>
