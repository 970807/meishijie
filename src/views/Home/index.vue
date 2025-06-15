<template>
  <div class="home">
    <!-- 顶部导航栏 -->
    <HeaderNav />

    <!-- 今日热门视频菜谱 -->
    <HomeHotTodayVideo :hotTodayVideoList="state.hotTodayVideoList" />

    <!-- 今日热搜、今日三餐 -->
    <HomeCenterArea
      :hotTodaySearchList="state.hotTodaySearchList"
      :threeMealsTodayList="state.threeMealsTodayList"
    />

    <!-- 推荐列表 -->
    <HomeRecommentArea :recommentList="state.recommentList" />

    <HomeFooter />
  </div>
</template>

<script setup lang="ts">
import { reactive } from 'vue'
import {
  getHotTodayVideoList,
  getHotTodaySearchList,
  getThreeMealsTodayList,
  getRecommentList,
} from '@/service/home'
import {
  IHotTodayVideoItem,
  IHotTodaySearchItem,
  IThreeMealsTodayItem,
  IRecommentItem,
} from './types'
import HeaderNav from '@/components/HeaderNav/index.vue'
import HomeHotTodayVideo from './components/HomeHotTodayVideo.vue'
import HomeCenterArea from './components/HomeCenterArea.vue'
import HomeRecommentArea from './components/HomeRecommentArea.vue'
import HomeFooter from './components/HomeFooter.vue'

const state = reactive<{
  hotTodayVideoList: IHotTodayVideoItem[] // 今日热门视频菜谱列表
  hotTodaySearchList: IHotTodaySearchItem[] // 今日热搜列表
  threeMealsTodayList: IThreeMealsTodayItem[] // 今日三餐列表
  recommentList: IRecommentItem[] // 推荐列表
}>({
  hotTodayVideoList: [],
  hotTodaySearchList: [],
  threeMealsTodayList: [],
  recommentList: [],
})

/**
 * 获取今日热门视频菜谱列表
 */
getHotTodayVideoList<IHotTodayVideoItem[]>().then((res) => {
  state.hotTodayVideoList = res.data
})

/**
 * 获取今日热搜列表
 */
getHotTodaySearchList<IHotTodaySearchItem[]>().then((res) => {
  state.hotTodaySearchList = res.data
})

/**
 * 获取今日三餐列表
 */
getThreeMealsTodayList<IThreeMealsTodayItem[]>().then((res) => {
  state.threeMealsTodayList = res.data
})

/**
 * 获取推荐列表
 */
getRecommentList<IRecommentItem[]>().then((res) => {
  state.recommentList = res.data
})
</script>
