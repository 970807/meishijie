<template>
  <div class="home">
    <HeaderArea />

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
import HeaderArea from '@/components/HeaderArea.vue'
import HomeHotTodayVideo from './components/HomeHotTodayVideo.vue'
import HomeCenterArea from './components/HomeCenterArea.vue'
import HomeRecommentArea from './components/HomeRecommentArea.vue'
import HomeFooter from './components/HomeFooter.vue'

const state = reactive<{
  hotTodayVideoList: IHotTodayVideoItem[]
  hotTodaySearchList: IHotTodaySearchItem[]
  threeMealsTodayList: IThreeMealsTodayItem[]
  recommentList: IRecommentItem[]
}>({
  hotTodayVideoList: [],
  hotTodaySearchList: [],
  threeMealsTodayList: [],
  recommentList: [],
})

getHotTodayVideoList<IHotTodayVideoItem[]>().then((res) => {
  state.hotTodayVideoList = res.data
})

getHotTodaySearchList<IHotTodaySearchItem[]>().then((res) => {
  state.hotTodaySearchList = res.data
})

getThreeMealsTodayList<IThreeMealsTodayItem[]>().then((res) => {
  state.threeMealsTodayList = res.data
})

getRecommentList<IRecommentItem[]>().then((res) => {
  state.recommentList = res.data
})
</script>
