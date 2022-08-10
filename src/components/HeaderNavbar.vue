<template>
  <nav class="navbar">
    <router-link to="/" class="item">首页</router-link>
    <a class="item category" href="javascript:;">
      菜谱分类
      <i class="arrow-icon"></i>
      <HeaderCategoryMenu class="category-menu" />
    </a>
    <a class="item" href="javascript:;" @click="undevelopedTip()">美食达人</a>
    <a class="item" href="javascript:;" @click="undevelopedTip()">家居馆</a>
    <a class="item" href="https://j.meishi.cc/" target="_blank">
      <i class="app-icon"></i>
      APP下载
    </a>
  </nav>
</template>

<script setup lang="ts">
import HeaderCategoryMenu from './HeaderCategoryMenu.vue'
import undevelopedTip from '../utils/undevelopedTip'
</script>

<style lang="scss" scoped>
.navbar {
  flex: 1;
  display: flex;
  justify-content: center;
  height: 100%;

  .item {
    display: flex;
    align-items: center;
    height: 100%;
    padding: 0 20px;
    color: #fff;
    background: rgba(255, 255, 255, 0);
    font-size: 17px;
    font-weight: 600;

    &.category:hover .category-menu {
      display: block;
    }

    &:hover {
      background: rgba(255, 255, 255, 0.1);
    }

    .arrow-icon {
      display: inline-block;
      background: url('../assets/images/sprite_01.png') 0 -90px;
      background-size: 30px 150px;
      width: 10px;
      height: 6px;
      margin-left: 8px;
    }

    .app-icon {
      display: inline-block;
      background: url('../assets/images/sprite_01.png') 0 -120px;
      background-size: 30px 150px;
      width: 20px;
      height: 22px;
      margin-top: 2px;
      margin-right: 11px;
    }
  }
}
</style>
