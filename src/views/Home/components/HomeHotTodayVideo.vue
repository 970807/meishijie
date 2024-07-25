<template>
  <div class="hot-today-video-wrap">
    <div class="inner">
      <h1 class="title">今日热门视频菜谱</h1>
      <div class="video-list">
        <div
          class="item"
          v-for="(item, index) in hotTodayVideoList"
          :key="item.id"
          :style="{ width: getVideoWrapperWidth(index) }"
        >
          <div class="mask"></div>
          <img class="cover" :src="item.coverUrl" />
          <i class="play-btn" @click="onPlayBtnClick(index)"></i>
          <video
            :loop="true"
            :ref="(el: HTMLVideoElement) => setVideoRef(el)"
            :src="item.videoUrl"
            @click="onPauseVideo(index)"
            v-show="isPlayingVideoNow && currentPlayVideoIndex === index"
          ></video>
          <div class="info">
            <div class="t">{{ item.title }}</div>
            <div class="row">
              <div
                class="avatar"
                :style="{ backgroundImage: `url(${item.userAvatar})` }"
              ></div>
              <div class="username">{{ item.username }}</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { IHotTodayVideoItem } from '../types'

interface IProps {
  hotTodayVideoList?: IHotTodayVideoItem[]
}

withDefaults(defineProps<IProps>(), {
  hotTodayVideoList: () => []
})

const videoRefList: (HTMLVideoElement | null)[] = []

const isPlayingVideoNow = ref(false)
const currentPlayVideoIndex = ref(0)
function onPlayBtnClick(index: number): void {
  isPlayingVideoNow.value = true
  currentPlayVideoIndex.value = index

  videoRefList.forEach((item, index) => {
    if (index !== currentPlayVideoIndex.value) {
      item?.pause()
    }
  })
  const willPlayVideEl = videoRefList[index]

  if (!willPlayVideEl) {
    return
  }
  willPlayVideEl.play()
}

function onPauseVideo(index: number): void {
  if (videoRefList[index]) {
    videoRefList[index]!.pause()
    isPlayingVideoNow.value = false
  }
}

function setVideoRef(el: HTMLVideoElement | null): void {
  videoRefList.push(el)
}

function getVideoWrapperWidth(index: number): string {
  if (!isPlayingVideoNow.value) {
    return '285px'
  }
  if (currentPlayVideoIndex.value === index) {
    return '350px'
  } else {
    return '263px'
  }
}
</script>

<style lang="scss" scoped>
.hot-today-video-wrap {
  background: #efeeec;

  .inner {
    width: 1200px;
    margin: 0 auto;
    padding: 14px 0 40px;

    .title {
      color: #222;
      font-size: 24px;
      font-weight: 600;
      padding: 20px 0;
    }

    .video-list {
      display: flex;
      flex-wrap: wrap;

      .item {
        position: relative;
        height: 526px;
        margin-right: 20px;
        border-radius: 12px;
        overflow: hidden;
        transition: width 0.4s ease;
        cursor: pointer;

        &:nth-child(4n) {
          margin-right: 0;
        }

        .mask {
          position: absolute;
          left: 0;
          right: 0;
          top: 0;
          bottom: 0;
          background: rgba(0, 0, 0, 0.5);
          z-index: 1;
        }

        .cover {
          width: 100%;
          height: 100%;
          object-fit: cover;
          filter: blur(8px);
          opacity: 0.5;
        }

        video {
          position: absolute;
          left: 50%;
          top: 50%;
          transform: translate(-50%, -50%);
          width: 350px;
          z-index: 20;
        }

        .play-btn {
          position: absolute;
          top: 50%;
          left: 50%;
          transform: translate(-50%, -50%);
          display: block;
          width: 100px;
          height: 100px;
          background: url(@/assets/images/sprite_03.png) 0px -20px no-repeat;
          background-size: 100px 250px;
          z-index: 10;
          opacity: 0.8;
          transform: all ease 0.3s;

          &:hover {
            opacity: 1;
          }
        }

        .info {
          position: absolute;
          bottom: 0;
          left: 0;
          width: 100%;
          padding: 0 20px;
          color: #fff;
          z-index: 5;
          box-sizing: border-box;

          .t {
            font-size: 22px;
            font-weight: 700;
          }

          .row {
            display: flex;
            align-items: center;
            padding: 16px 0 20px;

            .avatar {
              width: 32px;
              height: 32px;
              border-radius: 50%;
            }

            .username {
              font-size: 14px;
              font-weight: 600;
              padding-left: 10px;
            }
          }
        }
      }
    }
  }
}
</style>
