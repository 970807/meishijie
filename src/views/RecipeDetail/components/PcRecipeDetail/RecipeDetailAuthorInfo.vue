<template>
  <div class="author-info">
    <div class="author">
      <div
        class="avatar"
        :style="{
          backgroundImage: `url(${authorAvatar || defaultAvatarImg})`,
        }"
      ></div>
      <div class="info">
        <a href="javascript:;">{{ authorNickname }}</a>
        <span
          >{{ authorRecipeCount }}菜谱&nbsp;&nbsp;{{ authorFanCount }}粉丝</span
        >
      </div>
    </div>
    <i class="quote-icon"></i>
    <div class="author-words">
      <p>{{ authorWords }}</p>
    </div>
  </div>
</template>

<script setup lang="ts">
import defaultAvatarImg from '@/assets/images/avatar_default.png'

defineProps<{
  authorNickname: string // 作者昵称
  authorAvatar: string // 作者头像url
  authorRecipeCount: number // 作者菜谱数
  authorFanCount: number // 作者粉丝数
  authorWords: string // 作者语录
}>()
</script>

<style lang="scss" scoped>
.author-info {
  position: relative;
  width: 900px;
  margin: 0 auto;
  background: #fff;
  border-radius: 12px;
  padding: 4px 0 24px;

  .author {
    margin: 20px 24px 0;
    position: relative;

    .avatar {
      position: absolute;
      left: 0;
      right: 0;
      width: 60px;
      height: 60px;
      border-radius: 30px;
      background-repeat: no-repeat;
      background-size: contain;
    }

    .info {
      height: 60px;
      padding-left: 80px;

      a {
        display: block;
        height: 32px;
        line-height: 32px;
        font-size: 18px;
        color: #222;
        font-weight: 600;
        margin-top: 2px;

        &:hover {
          color: #f64d36;
        }
      }

      span {
        display: block;
        height: 24px;
        line-height: 24px;
        font-size: 15px;
        color: #999;
      }
    }
  }

  .quote-icon {
    position: absolute;
    right: 25px;
    top: 25px;
    width: 28px;
    height: 20px;
    background: url(@/assets/images/sprite_01.png) 0px 0px no-repeat;
    background-size: 30px 150px;
  }

  .author-words {
    p {
      font-size: 16px;
      color: #666;
      line-height: 24px;
      padding: 20px 24px 0;
    }
  }
}
</style>
