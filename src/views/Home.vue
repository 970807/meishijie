<template>
  <div class="home">
    <HeaderArea />

    <!-- 今日热门视频菜谱 -->
    <HomeHotTodayVideo :hotTodayVideoList="hotTodayVideoList" />

    <HomeCenterArea
      :hotTodaySearchList="hotTodaySearchList"
      :threeMealsTodayList="threeMealsTodayList"
    />

    <HomeRecommentArea :recommentList="recommentList" />

    <HomeFooter/>
  </div>
</template>

<script>
import { reactive, toRefs } from 'vue'
import { getHotTodayVideoList, getHotTodaySearchList, getThreeMealsTodayList, getRecommentList } from '@/service/home'
import HeaderArea from '@/components/HeaderArea'
import HomeHotTodayVideo from '@/components/HomeHotTodayVideo'
import HomeCenterArea from '@/components/HomeCenterArea'
import HomeRecommentArea from '@/components/HomeRecommentArea'
import HomeFooter from '@/components/HomeFooter'

export default {
  name: 'Home',
  components: {
    HeaderArea,
    HomeHotTodayVideo,
    HomeCenterArea,
    HomeRecommentArea,
    HomeFooter
  },
  setup() {
    const state = reactive({
      hotTodayVideoList: [],
      hotTodaySearchList: [],
      threeMealsTodayList: [],
      recommentList: []
    })

    getHotTodayVideoList().then(res => {
      state.hotTodayVideoList = res.data
    }).catch(err => {
      console.error(err)
    })

    getHotTodaySearchList().then(res => {
      state.hotTodaySearchList = res.data
    }).catch(err => {
      console.error(err)
    })

    getThreeMealsTodayList().then(res => {
      state.threeMealsTodayList = res.data
    }).catch(err => {
      console.error(err)
    })

    getRecommentList().then(res => {
      state.recommentList = res.data
    }).catch(err => {
      console.error(err)
    })

    return {
      ...toRefs(state)
    }
  }
}
</script>
