<template>
  <div class="recipe-detail-header">
    <img class="cover" v-if="!isVideo" :src="coverUrl" />
    <div class="video-wrap" v-else @click="toggleVideoPlayStatus">
      <img class="video-bg" :src="coverUrl" />
      <video
        v-if="videoUrl"
        ref="videoRef"
        :loop="true"
        :src="videoUrl"
      ></video>
      <div class="btn play-btn" v-show="!isPlayingVideoNow"></div>
      <div class="btn pause-btn" v-show="isPlayingVideoNow"></div>
    </div>
    <div class="info">
      <h1 class="title">{{ recipeName }}</h1>
      <div class="statistics">
        by {{ authorNickname }} · {{ favCount }} 收藏 · {{ browerCount }} 浏览
      </div>
      <div class="evaluation">
        <div class="item">
          <span>工艺</span>
          <span>{{ simpleIntroductionTechnology }}</span>
        </div>
        <div class="item">
          <span>口味</span>
          <span>{{ simpleIntroductionTaste }}</span>
        </div>
        <div class="item">
          <span>时间</span>
          <span>{{ simpleIntroductionTime }}</span>
        </div>
        <div class="item">
          <span>难度</span>
          <span>{{ simpleIntroductionDifficulty }}</span>
        </div>
      </div>
      <div class="recipe">
        <div class="box">
          <div class="left">
            <strong>主料</strong>
            <span>main</span>
          </div>
          <div class="right">
            <strong v-for="(item, index) in mainIngredientList" :key="index"
              >{{ item.ingredientName }} {{ item.ingredientDose }}</strong
            >
          </div>
        </div>
        <div class="box">
          <div class="left">
            <strong>辅料</strong>
            <span>main</span>
          </div>
          <div class="right">
            <strong v-for="(item, index) in subIngredientList" :key="index"
              >{{ item.ingredientName }} {{ item.ingredientDose }}</strong
            >
          </div>
        </div>
      </div>
    </div>
    <div class="qrcode-box">
      <div class="qrcode">
        <img v-if="recipeQrcode" :src="recipeQrcode" />
      </div>
      <div class="qrcode-des">
        <span class="t">扫描手机二维码</span>
        <span class="des">用手机查看这篇菜谱</span>
      </div>
      <div class="fav-btn">
        <i class="icon"></i>
        <span>收藏({{ favCount }})</span>
      </div>
      <div class="dotline">
        <span class="dot1"></span>
        <span class="dot" v-for="item in 26" :key="item"></span>
        <span class="dot2"></span>
      </div>
      <div class="copyright">
        创建时间：{{ createDate }}
        <br />
        {{
          recipeName
        }}的版权归作者所有，没有作者本人的书面许可任何人不得转载或使用其中整体或任何部分内容。
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed } from 'vue'
import type { IMainIngredientListItem, ISubIngredientListItem } from '../types'

const props = defineProps<{
  isVideo: number // 是否是视频菜谱 1 => 是 0 => 否
  coverUrl: string // 封面图url
  videoUrl: string | null // 视频url
  recipeName: string // 菜谱名称
  authorNickname: string // 作者昵称
  favCount: number // 收藏数
  browerCount: number // 浏览数
  simpleIntroductionTechnology: string // 工艺
  simpleIntroductionTaste: string // 口味
  simpleIntroductionTime: string // 时间
  simpleIntroductionDifficulty: string // 难度
  mainIngredientList: IMainIngredientListItem[] // 主料列表
  subIngredientList: ISubIngredientListItem[] // 辅料列表
  recipeQrcode: string // 菜谱二维码url
  createTime: string // 创建时间
}>()
const createDate = computed(
  () => props.createTime && props.createTime.split(' ')[0]
)
const isPlayingVideoNow = ref(false)
const videoRef = ref<HTMLVideoElement | null>(null)
function toggleVideoPlayStatus() {
  if (!videoRef.value) {
    return
  }
  if (isPlayingVideoNow.value) {
    videoRef.value.pause()
  } else {
    videoRef.value.play()
  }
  isPlayingVideoNow.value = !isPlayingVideoNow.value
}
</script>

<style lang="scss" scoped>
.recipe-detail-header {
  width: 1200px;
  margin: 0 auto;
  padding: 40px 0;

  .cover {
    width: 350px;
    height: 535px;
    object-fit: cover;
    border-radius: 4px;
  }

  .video-wrap {
    position: relative;
    display: inline-block;
    vertical-align: top;
    width: 350px;
    height: 535px;
    border-radius: 4px;
    overflow: hidden;
    cursor: pointer;

    &:hover {
      .pause-btn {
        visibility: visible;
      }
    }

    .video-bg {
      width: 100%;
      height: 100%;
      object-fit: cover;
      filter: blur(10px);
    }

    video {
      width: 350px;
      position: absolute;
      left: 50%;
      top: 50%;
      transform: translate(-50%, -50%);
      z-index: 20;
    }

    .btn {
      width: 100px;
      height: 100px;
      position: absolute;
      left: 50%;
      top: 50%;
      transform: translate(-50%, -50%);
      background: url(@/assets/images/sprite_03.png) no-repeat;
      background-size: 100px 250px;
      opacity: 0.8;

      &:hover {
        opacity: 1;
      }
    }

    .play-btn {
      background-position: 0px -20px;
      z-index: 22;
    }

    .pause-btn {
      visibility: hidden;
      background-position: 0px -120px;
      z-index: 22;
    }
  }

  .info {
    display: inline-block;
    width: 590px;
    padding-left: 30px;
    box-sizing: border-box;

    .title {
      font-size: 32px;
      color: #222;
      line-height: 42px;
      font-weight: 700;
      padding-top: 10px;
      margin-right: 40px;
    }

    .statistics {
      font-size: 16px;
      line-height: 26px;
      color: #666;
    }

    .evaluation {
      margin-top: 25px;

      .item {
        position: relative;
        display: inline-block;
        width: 80px;
        height: 160px;
        margin-right: 20px;
        background: #fff url(@/assets/images/sprite_06.png) no-repeat;
        background-size: 80px 640px;
        border-radius: 16px;

        &:nth-child(1) {
          background-position: 0 0;
        }

        &:nth-child(2) {
          background-position: 0 -160px;
        }

        &:nth-child(3) {
          background-position: 0 -320px;
        }

        &:nth-child(4) {
          background-position: 0 -480px;
        }

        span:nth-child(1) {
          position: absolute;
          left: 12px;
          bottom: 37px;
          font-size: 12px;
          color: #666;
          line-height: 18px;
        }

        span:nth-child(2) {
          position: absolute;
          left: 12px;
          bottom: 17px;
          font-size: 14px;
          color: #222;
          font-weight: 600;
          line-height: 20px;
        }
      }
    }

    .recipe {
      width: 520px;

      .box {
        position: relative;
        margin-top: 30px;

        .left {
          position: absolute;
          top: 0;
          left: 0;
          background: #ffe851;
          width: 80px;
          height: 100%;
          border-top-left-radius: 16px;
          border-bottom-left-radius: 16px;

          strong {
            display: block;
            font-size: 20px;
            text-align: center;
            color: #000;
            font-weight: 600;
            line-height: 22px;
            margin-top: 17px;
          }

          span {
            display: block;
            font-size: 12px;
            text-align: center;
            color: #000;
            font-weight: 600;
            line-height: 14px;
          }
        }

        .right {
          padding: 18px 20px 8px 20px;
          margin-left: 80px;
          background: #fff;
          border-top-right-radius: 16px;
          border-bottom-right-radius: 16px;

          strong {
            display: inline-block;
            color: #222;
            font-size: 15px;
            background: #f5f5f5;
            margin: 0 12px 12px 0;
            padding: 0 10px;
            height: 32px;
            line-height: 32px;
            border-radius: 8px;
          }

          span {
            position: absolute;
            top: -20px;
            right: 16px;
            padding: 0 10px;
            color: #666;
            font-size: 12px;
            height: 20px;
            line-height: 20px;
            background: rgba(0, 0, 0, 0.05);
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
          }
        }
      }
    }
  }

  .qrcode-box {
    display: inline-block;
    width: 260px;
    min-height: 535px;
    background: #fff;
    border-radius: 4px;
    vertical-align: top;

    .qrcode {
      width: 128px;
      height: 128px;
      margin: 40px auto 0;
    }

    .qrcode-des {
      margin-top: 15px;
      text-align: center;

      .t {
        display: block;
        font-size: 18px;
        color: #222;
        line-height: 30px;
        font-weight: 600;
      }

      .des {
        display: block;
        font-size: 14px;
        color: #222;
        line-height: 26px;
        font-weight: 600;
      }
    }
  }

  .fav-btn {
    height: 48px;
    line-height: 48px;
    text-align: center;
    margin: 34px 30px 0;
    color: #fff;
    font-size: 18px;
    font-weight: 600;
    background-image: linear-gradient(to right, #f67536, #f64d36);
    border-radius: 4px;
    transition: all ease 0.1s;
    cursor: pointer;

    &:hover {
      background-image: linear-gradient(to right, #f64d36, #eb4b34);
    }

    .icon {
      display: inline-block;
      width: 24px;
      height: 20px;
      margin: 14px 10px 0 0;
      background: url(@/assets/images/sprite_01.png) 0 -30px no-repeat;
      background-size: 30px 150px;
      vertical-align: top;
    }
  }

  .dotline {
    position: relative;
    height: 8px;
    margin-top: 38px;
    overflow: hidden;

    .dot1 {
      position: absolute;
      left: -4px;
      top: 0;
      width: 8px;
      height: 8px;
      border-radius: 50%;
      background: #efeeec;
    }

    .dot {
      width: 4px;
      height: 4px;
      border-radius: 50%;
      margin: 2px 3px;
      display: inline-block;
      background: #efeeec;
      vertical-align: top;
    }

    .dot2 {
      position: absolute;
      right: -4px;
      top: 0;
      width: 8px;
      height: 8px;
      border-radius: 50%;
      background: #efeeec;
    }
  }

  .copyright {
    font-size: 14px;
    color: #999;
    line-height: 22px;
    padding: 26px 30px;
  }
}
</style>
