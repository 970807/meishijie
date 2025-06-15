<template>
  <div
    :class="{
      'is-pc-device': deviceStore.pcDevice,
      'is-mobile-device': deviceStore.mobileDevice,
    }"
  >
    <router-view />
  </div>
</template>

<script lang="ts" setup>
import { useDeviceStore } from '@/store/device'

const deviceStore = useDeviceStore()

deviceStore.initJudgeisMobile()
</script>
