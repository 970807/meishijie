<!-- 今日热门视频菜谱 -->
<template>
  <div class="hot-today-video-wrap">
    <!-- pc端 -->
    <div v-if="pcDevice" class="inner__pc">
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
            :ref="(el: any) => setVideoRef(el)"
            :src="item.videoUrl"
            @click="onPauseVideo(index)"
            v-show="isPlayingVideoNow && currentPlayVideoIndex === index"
          ></video>
          <div class="info">
            <div class="t ellipsis-l1">{{ item.recipeName }}</div>
            <div class="row">
              <div
                class="avatar"
                :style="{ backgroundImage: `url(${item.authorAvatar})` }"
              ></div>
              <div class="username ellipsis-l1">{{ item.authorName }}</div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- 手机端 -->
    <div v-else class="inner__mobile">
      <h1 class="title">今日热门视频菜谱</h1>
      <div class="video-list">
        <router-link
          class="item"
          :to="{ path: `/recipe-detail/${item.id}` }"
          v-for="(item, index) in hotTodayVideoList"
          :key="item.id"
          :style="{ backgroundImage: `url(${item.coverUrl})` }"
        >
          <div class="icon-play">
            <SvgIcon name="play" :size="32" color="#ffffff" />
          </div>
          <div class="info">
            <div class="t ellipsis-l1">{{ item.recipeName }}</div>
            <div class="row">
              <div
                class="avatar"
                :style="{ backgroundImage: `url(${item.authorAvatar})` }"
              ></div>
              <div class="username ellipsis-l1">{{ item.authorName }}</div>
            </div>
          </div>
        </router-link>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { IHotTodayVideoItem } from '../types'
import { useDeviceStore } from '@/store/device'

const pcDevice = useDeviceStore().pcDevice

interface IProps {
  hotTodayVideoList?: IHotTodayVideoItem[]
}

withDefaults(defineProps<IProps>(), {
  hotTodayVideoList: () => [], // 今日热门视频菜谱列表
})

const videoRefList: (HTMLVideoElement | null)[] = []

const isPlayingVideoNow = ref(false) // 当前是否有视频在播放
const currentPlayVideoIndex = ref(0) // 当前播放的视频索引

/**
 * 播放按钮被点击
 * @param index 点击的item索引
 */
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

/**
 * 视频播放中，再点击时，暂停视频
 * @param index 点击的item索引
 */
function onPauseVideo(index: number): void {
  if (videoRefList[index]) {
    videoRefList[index]!.pause()
    isPlayingVideoNow.value = false
  }
}

function setVideoRef(el: HTMLVideoElement | null): void {
  videoRefList.push(el)
}

/**
 * 获取视频包裹容器的宽度
 * @param index 点击的item索引
 */
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
  @include pc {
    background: #efeeec;
  }
  @include mobile {
    margin-top: 16px;
  }

  .inner__pc {
    width: $pc-min-width;
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

        &:nth-child(n + 5) {
          margin-top: 20px;
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
              background-size: 100% 100%;
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

  .inner__mobile {
    .title {
      color: #000;
      font-size: 24px;
      padding: 0 16px;
    }

    .video-list {
      margin-top: 16px;
      display: flex;
      overflow-x: auto;

      // 隐藏滚动条
      &::-webkit-scrollbar {
        display: none;
      }
      .item {
        position: relative;
        flex-shrink: 0;
        width: 140px;
        height: 180px;
        background-size: cover;
        border-radius: 12px;
        overflow: hidden;

        &:first-child {
          margin-left: 16px;
        }

        &:last-child {
          margin-right: 16px;
        }

        &:nth-child(n + 2) {
          margin-left: 12px;
        }

        .icon-play {
          position: absolute;
          top: 4px;
          right: 4px;
        }

        .info {
          position: absolute;
          left: 0;
          bottom: 0;
          width: 100%;
          height: 72px;
          padding: 12px;
          box-sizing: border-box;
          background: linear-gradient(
            to top,
            rgba(0, 0, 0, 0.6),
            rgba(0, 0, 0, 0)
          );

          .t {
            color: #fff;
            font-size: 14px;
          }

          .row {
            margin-top: 8px;
            display: flex;
            align-items: center;

            .avatar {
              flex-shrink: 0;
              width: 20px;
              height: 20px;
              border-radius: 50%;
              background-size: cover;
            }

            .username {
              margin-left: 8px;
              color: #fff;
              font-size: 12px;
            }
          }
        }
      }
    }
  }
}
</style>
