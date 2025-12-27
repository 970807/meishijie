<template>
  <div class="mobile-recipe-detail">
    <div class="cover-wrap" @click="onCoverClick">
      <img class="cover-image" :src="recipeInfo.coverUrl" />
      <div class="view-play-icon" v-if="recipeInfo.isVideo">
        <SvgIcon name="play_2" :size="36" />
      </div>
    </div>

    <div class="title">{{ recipeInfo.recipeName }}</div>
    <div class="author-info">
      <div
        class="avatar"
        :style="{
          backgroundImage: `url(${
            recipeInfo.authorAvatar || defaultAvatarImg
          })`,
        }"
      ></div>
      <div class="author-name">{{ recipeInfo.authorNickname }}</div>
    </div>
    <div class="evaluation">
      <div class="item">
        <SvgIcon name="clock" color="#e94e3c" :size="24" />
        <span>烹饪时间</span>
        <span>{{ recipeInfo.simpleIntroductionTime }}</span>
      </div>
      <div class="item">
        <SvgIcon name="fork" color="#e94e3c" :size="24" />
        <span>口味</span>
        <span>{{ recipeInfo.simpleIntroductionTaste }}</span>
      </div>
      <div class="item">
        <!-- 这个图标比其他的小一号，要放大1.2倍（TODO：后续更换一样大小的图片） -->
        <SvgIcon name="chef" color="#e94e3c" :size="24" />
        <span>难度</span>
        <span>{{ recipeInfo.simpleIntroductionDifficulty }}</span>
      </div>
      <div class="item">
        <SvgIcon name="fire" color="#e94e3c" :size="24" />
        <span>烹饪方式</span>
        <span>{{ recipeInfo.simpleIntroductionTechnology }}</span>
      </div>
    </div>
    <div class="recipe">
      <div class="head-title">食材</div>
      <!-- 主料 -->
      <div class="recipe-main-box">
        <div class="recipe-title">主料</div>
        <div
          class="recipe-item"
          v-for="(item, index) in recipeInfo.mainIngredientList"
          :key="index"
        >
          <div class="recipe-name">{{ item.ingredientName }}</div>
          <div class="recipe-quantity">{{ item.ingredientDose }}</div>
        </div>
      </div>
      <!-- 辅料 -->
      <div class="recipe-sub-box">
        <div class="recipe-title">辅料</div>
        <div
          class="recipe-item"
          v-for="(item, index) in recipeInfo.subIngredientList"
          :key="index"
        >
          <div class="recipe-name">{{ item.ingredientName }}</div>
          <div class="recipe-quantity">{{ item.ingredientDose }}</div>
        </div>
      </div>
    </div>
    <div class="step-box">
      <div class="head-title">步骤</div>
      <div
        class="step-item"
        v-for="(item, index) in recipeInfo.stepList"
        :key="index"
      >
        <div class="step-num">步骤 {{ index + 1 }}</div>
        <div class="step-image">
          <img v-if="item.img" :src="item.img" :title="item.content" />
        </div>
        <div class="step-desc" v-if="item.content">
          {{ item.content }}
        </div>
      </div>
    </div>
    <div class="finish-images">
      <div class="head-title">成品图</div>
      <div class="finish-images-swiper">
        <div class="swiper-wrapper">
          <div
            class="swiper-slide"
            v-for="(item, index) in recipeInfo.finishFoodImgList"
            :key="index"
          >
            <div class="image-wrap">
              <img :src="item" />
            </div>
          </div>
        </div>
        <div class="swiper-pagination"></div>
      </div>
    </div>
    <div class="recipe-tip" v-if="recipeInfo.recipeTips">
      <div class="head-title">烹饪技巧</div>
      <div class="tips-words">
        <p>{{ recipeInfo.recipeTips }}</p>
      </div>
    </div>

    <VideoPlayer ref="videoPlayerRef" />
  </div>
</template>

<script lang="ts" setup>
import Swiper, { Pagination } from 'swiper'
import { watch, nextTick, ref } from 'vue'
import VideoPlayer from '@/components/VideoPlayer.vue'
import defaultAvatarImg from '@/assets/images/avatar_default.png'
import type { IRecipeInfo } from '../../types'
import 'swiper/swiper-bundle.min.css'

Swiper.use([Pagination])

const videoPlayerRef = ref<InstanceType<typeof VideoPlayer>>()

const props = defineProps<{
  recipeInfo: IRecipeInfo
}>()

if (props.recipeInfo.finishFoodImgList.length) {
  nextTick(() => {
    initSwipper()
  })
}

watch(
  () => props.recipeInfo.finishFoodImgList,
  () => {
    nextTick(() => {
      initSwipper()
    })
  }
)

const initSwipper = () => {
  new Swiper('.finish-images-swiper', {
    pagination: {
      el: '.swiper-pagination',
      clickable: true,
    },
  })
}

const onCoverClick = () => {
  if (!props.recipeInfo.isVideo) {
    // 非视频菜谱，不做任何操作
    return
  }

  // 视频菜谱，弹窗播放视频
  if (props.recipeInfo.videoUrl)
    videoPlayerRef.value?.show(props.recipeInfo.videoUrl)
}
</script>

<style lang="scss" scoped>
.mobile-recipe-detail {
  margin-top: $app-head-height;
  padding-bottom: 16px;

  .cover-wrap {
    position: relative;
    width: calc(100% - 32px);
    margin: 0 16px;
    aspect-ratio: 3/2;

    .cover-image {
      width: 100%;
      height: 100%;
      object-fit: cover;
      border-radius: 16px;
    }

    .view-play-icon {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      display: flex;
      justify-content: center;
      align-items: center;
      width: 70px;
      height: 70px;
      background: rgba(0, 0, 0, 0.5);
      border-radius: 50%;
    }
  }

  .title {
    margin-top: 24px;
    padding: 0 16px;
    color: #111827;
    font-size: 24px;
    font-weight: bold;
    line-height: 32px;
  }

  .author-info {
    margin-top: 16px;
    padding: 0 16px;
    display: flex;
    align-items: center;

    .avatar {
      flex-shrink: 0;
      width: 32px;
      height: 32px;
      background-size: 100% 100%;
      border-radius: 50%;
    }

    .author-name {
      flex: 1;
      margin-left: 12px;
      color: #374151;
      font-size: 16px;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
    }
  }

  .evaluation {
    margin-top: 16px;
    padding: 0 16px;
    display: flex;
    justify-content: space-between;
    gap: 8px;

    @media (min-width: 400px) {
      gap: 16px;
    }

    .item {
      flex: 1;
      display: flex;
      flex-direction: column;
      align-items: center;
      padding: 12px;
      background: #f9fafb;
      border-radius: 12px;

      > span {
        text-align: center;

        &:nth-of-type(1) {
          margin-top: 8px;
          color: #6b7280;
          font-size: 12px;
        }

        &:nth-of-type(2) {
          margin-top: 4px;
          color: #111827;
          font-size: 14px;
        }
      }
    }
  }

  .recipe {
    margin-top: 30px;
    padding: 0 16px;

    .head-title {
      color: #111827;
      font-weight: bold;
      font-size: 18px;
    }

    .recipe-main-box,
    .recipe-sub-box {
      padding: 16px;
      border-radius: 12px;

      .recipe-title {
        font-size: 16px;
      }

      .recipe-item {
        display: flex;

        &:nth-child(1) {
          margin-top: 10px;
        }

        &:nth-child(n + 2) {
          margin-top: 8px;
        }

        .recipe-name {
          flex-grow: 1;
          color: #374151;
          font-size: 16px;
          white-space: nowrap;
          overflow: hidden;
          text-overflow: ellipsis;
        }

        .recipe-quantity {
          flex-shrink: 0;
          margin-left: 6px;
          color: #374151;
          font-size: 16px;
        }
      }
    }

    .recipe-main-box {
      margin-top: 22px;
      background: #fff9e5;

      .recipe-title {
        color: #e94e3c;
      }
    }

    .recipe-sub-box {
      margin-top: 16px;
      background: #f9fafb;

      .recipe-title {
        color: #4b5563;
      }
    }
  }

  .step-box {
    margin-top: 34px;
    padding: 0 16px;

    .head-title {
      padding-bottom: 12px;
      color: #111827;
      font-weight: bold;
      font-size: 18px;
    }

    .step-item {
      padding: 16px;
      border-radius: 12px;
      background: #f9fafb;

      &:nth-child(n + 2) {
        margin-top: 24px;
      }

      .step-num {
        display: inline-block;
        padding: 4px 12px;
        font-size: 14px;
        line-height: 20px;
        color: #fff;
        background: #e94e3c;
        border-radius: 99px;
      }

      .step-image {
        margin-top: 16px;

        > img {
          width: 100%;
          border-radius: 12px;
        }
      }

      .step-desc {
        margin-top: 16px;
        font-size: 16px;
        line-height: 24px;
        color: #374151;
      }
    }
  }

  .finish-images {
    margin-top: 34px;
    width: 100%;
    overflow: hidden;

    .head-title {
      padding: 0 16px;
      display: flex;
      align-items: center;
      color: #111827;
      font-size: 18px;
      font-weight: bold;

      &::before {
        content: '';
        margin-right: 12px;
        width: 4px;
        height: 16px;
        border-radius: 2px;
        background: #e94e3c;
      }

      &::after {
        content: '';
        margin-left: 30px;
        width: 4px;
        height: 16px;
        border-radius: 2px;
        background: #e94e3c;
      }
    }

    .finish-images-swiper {
      position: relative;
      margin-top: 16px;
      overflow: hidden;

      .swiper-wrapper {
        padding: 12px 0 25px;

        .swiper-slide {
          width: 100%;
          aspect-ratio: 358 / 200;

          .image-wrap {
            width: calc(100% - 16px * 2);
            height: 100%;
            border-radius: 12px;
            margin: 0 16px;
            overflow: hidden;

            > img {
              width: 100%;
              height: 100%;
              object-fit: cover;
            }
          }
        }
      }

      .swiper-pagination {
        bottom: 18px;
        height: 8px;

        :deep(.swiper-pagination-bullet-active) {
          background: #f42e2b;
        }
      }
    }
  }

  .recipe-tip {
    margin-top: 34px;
    padding: 0 16px;

    .head-title {
      padding: 0 16px;
      display: flex;
      align-items: center;
      color: #111827;
      font-size: 18px;
      font-weight: bold;

      &::before {
        content: '';
        margin-right: 12px;
        width: 4px;
        height: 16px;
        border-radius: 2px;
        background: #e94e3c;
      }

      &::after {
        content: '';
        margin-left: 30px;
        width: 4px;
        height: 16px;
        border-radius: 2px;
        background: #e94e3c;
      }
    }

    .tips-words {
      margin-top: 16px;
      background: linear-gradient(to right, #fff9f8 0%, #ffffff 100%);
      border-radius: 12px;
      box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.05);

      p {
        margin: 0;
        padding: 16px;
        color: #374151;
        font-size: 16px;
        line-height: 22px;
      }
    }
  }
}
</style>
