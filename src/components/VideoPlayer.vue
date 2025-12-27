<template>
  <div class="video-dialog" v-if="visible">
    <div class="mask" @click="close"></div>
    <div class="video-container">
      <button class="close-btn" @click="close">x</button>
      <video :src="videoUrl" controls autoplay class="video-player" />
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue'

defineComponent({ name: 'VideoPlayer' })
</script>
<script lang="ts" setup>
import { reactive, toRefs, onUnmounted } from 'vue'

const state = reactive<{
  visible: boolean
  videoUrl: string
}>({
  visible: false,
  videoUrl: '',
})
const { visible, videoUrl } = toRefs(state)

const show = (videoUrl: string) => {
  state.visible = true
  state.videoUrl = videoUrl
  // 隐藏底部页面的滚动条
  document.body.style.overflow = 'hidden'
}

const close = () => {
  state.visible = false
  // 恢复滚动
  document.body.style.overflow = ''
}

onUnmounted(() => {
  // 在组件销毁时，也恢复滚动(有可能直接点左上角的返回按钮返回到上一页，不经过close方法)
  document.body.style.overflow = ''
})

defineExpose({ show })
</script>

<style lang="scss" scoped>
.video-dialog {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 9998;

  .mask {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.6);
  }

  .video-container {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 90%;
    max-width: 600px;
    background: #000;
    border-radius: 12px;
    overflow: hidden;

    @include mobile {
      top: calc(50% + #{$app-head-height} / 2);
    }

    .close-btn {
      position: absolute;
      top: 12px;
      right: 12px;
      font-size: 24px;
      color: #fff;
      background: transparent;
      border: none;
      z-index: 10;
    }

    .video-player {
      width: 100%;
      height: auto;
      display: block;
    }
  }
}
</style>
