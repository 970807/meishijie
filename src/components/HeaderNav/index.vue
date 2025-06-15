<!-- 顶部导航栏 -->
<template>
  <!-- pc端导航栏 -->
  <PcHeaderNav v-if="pcDevice" />
  <!-- 手机端导航栏 -->
  <MobileHeaderNav v-else />
</template>

<script lang="ts" setup>
import PcHeaderNav from './PcHeaderNav/index.vue'
import MobileHeaderNav from './MobileHeaderNav/index.vue'
import { useDeviceStore } from '@/store/device'

const pcDevice = useDeviceStore().pcDevice
</script>
