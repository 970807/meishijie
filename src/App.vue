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
import { useSystemConfigsStore } from '@/store/systemConfigs'
import { getSystemConfigs } from '@/service/common'

// pc/移动端设备检测
const deviceStore = useDeviceStore()
deviceStore.initJudgeisMobile()

// 获取系统参数配置列表
getSystemConfigs<any[]>().then((res) => {
  const systemConfigsStore = useSystemConfigsStore()
  systemConfigsStore.systemConfigs = res.data ?? []
})
</script>
