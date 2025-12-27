<template>
  <div class="home">
    <!-- 顶部导航栏 -->
    <HeaderNav />

    <!-- 今日热门视频菜谱 -->
    <HomeHotTodayVideo
      v-if="isHotTodayVideoColumnAvailable"
      :hotTodayVideoList="state.hotTodayVideoList"
    />

    <!-- 今日热搜、今日三餐 -->
    <HomeCenterArea
      v-if="isHotTodaySearchColumnAvailable || isThreeMealsTodayColumnAvailable"
      :showHotTodaySearchColumn="isHotTodaySearchColumnAvailable"
      :showThreeMealsTodayColumn="isThreeMealsTodayColumnAvailable"
      :hotTodaySearchList="state.hotTodaySearchList"
      :threeMealsTodayList="state.threeMealsTodayList"
    />

    <!-- 首页自定义栏位 -->
    <HomeCustomColumns :columnList="state.homeCustomColumnList" />

    <HomeFooter />
  </div>
</template>

<script setup lang="ts">
import { reactive, computed } from 'vue'
import {
  getHomeSystemColumnConfig,
  getHotTodayVideoList,
  getHotTodaySearchList,
  getThreeMealsTodayList,
  getHomeCustomColumns,
} from '@/service/home'
import {
  IHomeSystemColumnConfig,
  IHotTodayVideoItem,
  IHotTodaySearchItem,
  IThreeMealsTodayItem,
  IHomeCustomColumns,
} from './types'
import HomeHotTodayVideo from './components/HomeHotTodayVideo.vue'
import HomeCenterArea from './components/HomeCenterArea.vue'
import HomeCustomColumns from './components/HomeCustomColumns.vue'
import HomeFooter from './components/HomeFooter.vue'

const state = reactive<{
  homeSystemColumnConfig: IHomeSystemColumnConfig[] // 首页系统栏位配置
  hotTodayVideoList: IHotTodayVideoItem[] // 今日热门视频菜谱列表
  hotTodaySearchList: IHotTodaySearchItem[] // 今日热搜列表
  threeMealsTodayList: IThreeMealsTodayItem[] // 今日三餐列表
  homeCustomColumnList: IHomeCustomColumns[] // 首页自定义栏位列表
}>({
  homeSystemColumnConfig: [],
  hotTodayVideoList: [],
  hotTodaySearchList: [],
  threeMealsTodayList: [],
  homeCustomColumnList: [],
})

// '今日热门视频菜谱'栏位是否启用
const isHotTodayVideoColumnAvailable = computed<boolean>(() => {
  if (!state.homeSystemColumnConfig.length) return false
  return (
    state.homeSystemColumnConfig.find(
      (column) => column.id === 'TODAY_HOT_VIDEO_RECIPE'
    )?.available === 1
  )
})

// '今日热搜'栏位是否启用
const isHotTodaySearchColumnAvailable = computed<boolean>(() => {
  if (!state.homeSystemColumnConfig.length) return false
  return (
    state.homeSystemColumnConfig.find(
      (column) => column.id === 'TODAY_HOT_SEARCH'
    )?.available === 1
  )
})

// '今日三餐'栏位是否启用
const isThreeMealsTodayColumnAvailable = computed<boolean>(() => {
  if (!state.homeSystemColumnConfig.length) return false
  return (
    state.homeSystemColumnConfig.find(
      (column) => column.id === 'TODAY_THREE_MEALS'
    )?.available === 1
  )
})

/**
 * 获取首页系统栏位配置
 */
const fetchHomeSystemColumnConfig = () => {
  getHomeSystemColumnConfig<IHomeSystemColumnConfig[]>().then((res: any) => {
    if (!res.data?.length) return
    state.homeSystemColumnConfig = res.data
    for (const column of res.data) {
      if (column.available) {
        switch (column.id) {
          case 'TODAY_HOT_VIDEO_RECIPE':
            // 获取今日热门视频菜谱
            fetchHotTodayVideoList()
            break
          case 'TODAY_HOT_SEARCH':
            // 获取今日热搜
            fetchHotTodaySearchList()
            break
          case 'TODAY_THREE_MEALS':
            // 获取今日三餐
            fetchThreeMealsTodayList()
            break
        }
      } else {
        // 未启用的栏位
      }
    }
  })
}

/**
 * 获取今日热门视频菜谱列表
 */
const fetchHotTodayVideoList = async () => {
  const res = await getHotTodayVideoList<IHotTodayVideoItem[]>()
  state.hotTodayVideoList = res.data ?? []
}

/**
 * 获取今日热搜列表
 */
const fetchHotTodaySearchList = async () => {
  const res = await getHotTodaySearchList<IHotTodaySearchItem[]>()
  state.hotTodaySearchList = res.data ?? []
}

/**
 * 获取今日三餐列表
 */
const fetchThreeMealsTodayList = async () => {
  const res = await getThreeMealsTodayList<IThreeMealsTodayItem[]>()
  state.threeMealsTodayList = res.data ?? []
}

/**
 * 获取首页自定义栏位
 */
const fetchHomeCustomColumns = async () => {
  const res = await getHomeCustomColumns<IHomeCustomColumns[]>()
  state.homeCustomColumnList = res.data ?? []
}

/**
 * 初始化数据
 */
const initData = () => {
  // 获取首页系统栏位配置
  fetchHomeSystemColumnConfig()
  // 获取首页自定义栏位
  fetchHomeCustomColumns()
}

initData()
</script>
