<template>
  <div class="home-center-area">
    <!-- pc端 -->
    <template v-if="pcDevice">
      <!-- 今日热搜-start -->
      <div class="hot-today-search">
        <h1 class="title">今日热搜</h1>
        <ul class="list">
          <li
            class="item"
            :class="{ hot: item.isHot }"
            v-for="item in hotTodaySearchList"
            :key="item.id"
          >
            {{ item.label }}
          </li>
        </ul>
      </div>
      <!-- 今日热搜-end -->

      <!-- 今日三餐-start -->
      <div class="three-meals-today__pc" v-if="threeMealsTodayList.length">
        <h1 class="title">
          今日三餐
          <ul class="tabs">
            <li
              class="item"
              :class="{ current: index === currentThreeMealsTabIndex }"
              v-for="(item, index) in threeMealsTodayList"
              :key="item.id"
              @click="onThreeMealsTabItemClick(index)"
            >
              {{ item.label }}
            </li>
          </ul>
        </h1>
        <swiper
          class="swiper"
          @swiper="onThreeMealsSwiper"
          @slideChange="onThreeMealsSlideChange"
        >
          <swiper-slide
            :swiperRef="'swiper' as any"
            v-for="item in threeMealsTodayList"
            :key="item.id"
          >
            <router-link
              class="item"
              v-for="item2 in item.list"
              :key="item2.id"
              :to="`/recipe-detail/${item2.id}`"
            >
              <img class="cover" :src="item2.coverUrl" />
              <strong class="t ellipsis-l1">{{ item2.recipeName }}</strong>
              <p class="desc ellipsis-l1">{{ item2.desc }}</p>
            </router-link>
          </swiper-slide>
        </swiper>
      </div>
      <!-- 今日三餐-end -->

      <!-- 二维码-start -->
      <div class="qrcode">
        <img class="bg-img" src="@/assets/images/qr-code-bg.jpg" />
        <img class="qr-img" src="@/assets/images/qr-code.png" />
        <img class="phone-img" src="@/assets/images/qr-code-phone.png" />
        <div class="desc">
          <strong>让吃饭变简单</strong>
          <span>www.Meishi.cc</span>
        </div>
      </div>
      <!-- 二维码-end -->
    </template>
    <!-- 手机端 -->
    <template v-else>
      <!-- 今日三餐-start -->
      <div class="three-meals-today__mobile" v-if="threeMealsTodayList.length">
        <h1 class="title">
          今日{{ threeMealsTodayList[currentThreeMealsTabIndex].label }}
        </h1>
        <swiper
          class="swiper"
          @swiper="onThreeMealsSwiper"
          @slideChange="onThreeMealsSlideChange"
        >
          <swiper-slide
            :swiperRef="'swiper' as any"
            v-for="item in threeMealsTodayList"
            :key="item.id"
          >
            <div class="slide-item-box">
              <router-link
                v-for="item2 in item.list.slice(0, 3)"
                :key="item2.id"
                class="item"
                :to="`/recipe-detail/${item2.id}`"
              >
                <img class="cover" :src="item2.coverUrl" />
                <strong class="t ellipsis-l1">{{ item2.recipeName }}</strong>
                <p class="desc ellipsis-l1">{{ item2.desc }}</p>
              </router-link>
            </div>
          </swiper-slide>
        </swiper>
        <div class="swiper-dots">
          <div
            class="dot"
            v-for="(item, index) in threeMealsTodayList"
            :key="item.id"
            :class="{ active: index === currentThreeMealsTabIndex }"
          ></div>
        </div>
      </div>
      <!-- 今日三餐-end -->
    </template>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { Swiper, SwiperSlide } from 'swiper/vue'
import 'swiper/swiper.min.css'
import { IHotTodaySearchItem, IThreeMealsTodayItem } from '../types'
import { useDeviceStore } from '@/store/device'

const pcDevice = useDeviceStore().pcDevice

withDefaults(
  defineProps<{
    hotTodaySearchList?: IHotTodaySearchItem[] // 今日热搜列表
    threeMealsTodayList?: IThreeMealsTodayItem[] // 今日三餐列表
  }>(),
  {
    hotTodaySearchList: () => [],
    threeMealsTodayList: () => [],
  }
)

const currentThreeMealsTabIndex = ref(0) // 当前轮播的index

let threeMealsSwiper: any = null // 轮播图实例

/**
 * 今日三餐tab被点击
 */
function onThreeMealsTabItemClick(index: number) {
  currentThreeMealsTabIndex.value = index
  threeMealsSwiper && threeMealsSwiper.slideTo(index)
}

/**
 * 今日三餐轮播初始化完成
 * @param swiper swiper实例
 */
const onThreeMealsSwiper = (swiper: any) => {
  threeMealsSwiper = swiper
}

/**
 * 今日三餐轮播切换
 * @param swiper swiper实例
 */
const onThreeMealsSlideChange = (swiper: any) => {
  currentThreeMealsTabIndex.value = swiper.activeIndex
}
</script>

<style lang="scss" scoped>
.home-center-area {
  position: relative;

  @include pc {
    width: $pc-min-width;
    margin: 40px auto 0;
  }

  .hot-today-search {
    width: 810px;
    background: #fff;
    border-radius: 12px;
    padding: 22px 0 16px;

    .title {
      font-size: 24px;
      font-weight: 600;
      color: #222;
      padding: 0 0 22px 22px;
    }

    .list {
      padding: 0 20px;

      .item {
        display: inline-block;
        font-size: 18px;
        height: 40px;
        line-height: 40px;
        border-radius: 20px;
        padding: 0 16px;
        margin: 0 15px 15px 0;
        color: #222;
        background: #f5f5f5;
        cursor: pointer;

        &:hover {
          background: #eee;
        }

        &.hot {
          background: rgba(246, 77, 54, 0.15);
          color: #f64d36;

          &:hover {
            background: rgba(246, 77, 54, 0.2);
          }
        }
      }
    }
  }

  .three-meals-today__pc {
    width: 810px;
    margin-top: 40px;
    border-radius: 12px;
    background: #fff;

    .title {
      font-size: 24px;
      color: #222;
      font-weight: 600;
      padding: 20px;

      .tabs {
        display: inline-block;
        padding-left: 20px;

        .item {
          display: inline-block;
          font-size: 18px;
          font-weight: 600;
          color: #999;
          background: #eee;
          padding: 0 15px;
          height: 32px;
          line-height: 32px;
          border-radius: 16px;
          margin-right: 15px;
          cursor: pointer;

          &:hover {
            background: #e8e8e8;
            color: #888;
          }

          &.current {
            color: #fff;
            background-image: linear-gradient(to right, #f67536, #f64d36);
          }
        }
      }
    }

    .swiper {
      padding-left: 20px;
      box-sizing: border-box;

      .item {
        display: inline-block;
        width: 240px;
        margin: 0 23px 23px 0;
        cursor: pointer;

        &:hover {
          .t {
            color: #f64d36;
          }
        }

        .cover {
          width: 240px;
          height: 240px;
          object-fit: cover;
          border-radius: 8px;
        }

        .t {
          display: block;
          color: #222;
          padding: 10px 0;
          font-size: 18px;
        }

        .desc {
          font-size: 14px;
          color: #999;
        }
      }
    }
  }

  .qrcode {
    position: absolute;
    top: 0;
    right: 0;
    width: 350px;
    height: 634px;
    border-radius: 12px;
    overflow: hidden;

    .bg-img {
      width: 100%;
      height: 100%;
      animation: qr-bg-ani 6s linear infinite;
    }

    .qr-img {
      position: absolute;
      width: 290px;
      height: 251px;
      top: 50px;
      left: 0;
      right: 0;
      margin: auto;
    }

    .phone-img {
      position: absolute;
      right: 0;
      bottom: 30px;
      width: 296px;
      height: 324px;
      animation: qr-phone-ani 6s linear infinite;
    }

    .desc {
      position: absolute;
      bottom: 24px;
      left: 0;
      width: 100%;
      text-align: center;

      strong {
        display: block;
        font-size: 19px;
        color: rgba(255, 255, 255, 0.95);
        text-shadow: 0 0 4px rgb(0 0 0 / 90%);
        line-height: 28px;
      }

      span {
        font-size: 14px;
        color: rgba(255, 255, 255, 0.8);
        text-shadow: 0 0 4px rgb(0 0 0 / 90%);
        line-height: 20px;
      }
    }
  }

  .three-meals-today__mobile {
    margin-top: 20px;

    .title {
      color: #000;
      font-size: 24px;
      padding: 0 16px 16px;
    }

    .slide-item-box {
      display: grid;
      grid-template-columns: repeat(7, 1fr);
      grid-template-rows: 1fr 1fr;
      grid-gap: 8px;
      padding: 0 16px;

      .item {
        position: relative;
        border-radius: 12px;
        overflow: hidden;

        &:nth-child(1) {
          grid-column-start: 1;
          grid-column-end: 5;
          grid-row-start: 1;
          grid-row-end: 3;
        }

        &:nth-child(2) {
          aspect-ratio: 1;
          grid-column-start: 5;
          grid-column-end: 8;
          grid-row-start: 1;
          grid-row-end: 2;
        }

        &:nth-child(3) {
          aspect-ratio: 1;
          grid-column-start: 5;
          grid-column-end: 8;
          grid-row-start: 2;
          grid-row-end: 3;
        }

        img {
          width: 100%;
          height: 100%;
          object-fit: cover;
        }

        .t {
          position: absolute;
          left: 12px;
          right: 12px;
          bottom: 43px;
          height: 28px;
          line-height: 28px;
          color: #fff;
          font-size: 18px;
        }

        .desc {
          position: absolute;
          left: 12px;
          right: 12px;
          bottom: 19px;
          height: 20px;
          line-height: 20px;
          color: rgba(255, 255, 255, 0.8);
          font-size: 14px;
        }
      }
    }
  }

  .swiper-dots {
    margin-top: 12px;
    display: flex;
    justify-content: center;
    .dot {
      width: 8px;
      height: 8px;
      border-radius: 50%;
      background: #e5e7eb;

      &.active {
        background: rgba(246, 77, 54, 0.8);
      }

      &:nth-child(n + 2) {
        margin-left: 6px;
      }
    }
  }
}

@keyframes qr-bg-ani {
  0% {
    transform: scale(1);
    filter: blur(0);
  }

  44% {
    transform: scale(1);
    filter: blur(0);
  }

  50% {
    transform: scale(1.2);
    filter: blur(4px);
  }

  94% {
    transform: scale(1.2);
    filter: blur(4px);
  }

  100% {
    transform: scale(1);
    filter: blur(0);
  }
}

@keyframes qr-phone-ani {
  0% {
    right: -296px;
    transform: rotate(45deg);
  }

  44% {
    right: -296px;
    transform: rotate(45deg);
  }

  50% {
    right: 0;
    transform: rotate(0);
  }

  94% {
    right: 0;
    transform: rotate(0);
  }

  100% {
    right: -296px;
    transform: rotate(45deg);
  }
}
</style>
