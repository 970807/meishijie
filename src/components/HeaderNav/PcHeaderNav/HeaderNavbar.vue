<template>
  <nav class="navbar">
    <router-link to="/" class="item">首页</router-link>
    <a class="item category" href="javascript:;">
      菜谱分类
      <i class="arrow-icon"></i>
      <HeaderCategoryMenu class="category-menu" />
    </a>
    <a class="item" href="https://github.com/970807/meishijie" target="_blank">
      <SvgIcon class="github-icon" name="github" :size="24" />
      github源码
    </a>
    <a class="item" href="https://admin.ggh0807.cn/" target="_blank">
      <SvgIcon class="jump-icon" name="jump" :size="24" />
      去管理端
    </a>
  </nav>
</template>

<script setup lang="ts">
import HeaderCategoryMenu from './HeaderCategoryMenu.vue'
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
      background: url('@/assets/images/sprite_01.png') 0 -90px;
      background-size: 30px 150px;
      width: 10px;
      height: 6px;
      margin-left: 8px;
    }

    .github-icon,
    .jump-icon {
      margin-right: 8px;
    }
  }
}
</style>
