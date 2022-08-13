<template>
  <nav class="login-nav">
    <div class="inner">
      <a class="logo" href="javascript:;">
        <img src="@/assets/images/logo.png" />
      </a>
      <ul>
        <li>
          <router-link to="/">首页</router-link>
        </li>
        <li>
          <a href="javascript:;" @click="undevelopedTip()">菜谱大全</a>
        </li>
        <li>
          <a href="javascript:;" @click="undevelopedTip()">饮食健康</a>
        </li>
        <li>
          <a href="javascript:;" @click="undevelopedTip()">美食菜单</a>
        </li>
        <li>
          <a href="javascript:;" @click="undevelopedTip()">美食达人</a>
        </li>
        <li>
          <a href="javascript:;" @click="undevelopedTip()">菜谱视频</a>
        </li>
        <li>
          <a href="javascript:;" @click="undevelopedTip()">产品下载</a>
        </li>
      </ul>
    </div>
  </nav>
</template>

<script setup lang="ts">
import undevelopedTip from '@/utils/undevelopedTip'
</script>

<style lang="scss" scoped>
.login-nav {
  width: 100%;
  border-bottom: 1px solid rgba(255, 255, 255, 0.08);

  .inner {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 1200px;
    height: 108px;
    margin: 0 auto;

    .logo {
      width: 150px;
      display: block;
      margin-right: 22px;

      img {
        width: 100%;
        height: 100%;
      }
    }

    ul {
      display: flex;

      a {
        padding: 0 20px;
        color: #fff;
        font-size: 18px;
        opacity: 0.8;

        &:hover {
          opacity: 1;
          text-decoration: underline;
        }
      }
    }
  }
}
</style>
