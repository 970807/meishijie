<template>
  <div class="header-nav-mobile">
    <div class="icon-add">
      <SvgIcon name="add" color="#4b5563" :size="24" />
    </div>
    <div class="input-wrap" @click="goMobileSearch()">
      <div class="icon-search">
        <SvgIcon name="search" color="#9ca3af" :size="16" />
      </div>
      <span>请输入菜谱名</span>
    </div>
    <div class="icon-menu">
      <SvgIcon name="menu" color="#1f2937" :size="24" />
    </div>
  </div>
</template>

<script lang="ts" setup>
import { useRouter } from 'vue-router'

const router = useRouter()

/**
 * 跳转到手机端搜索页
 */
const goMobileSearch = () => {
  router.push({ name: 'MobileSearch' })
}
</script>

<style lang="scss" scoped>
.header-nav-mobile {
  display: flex;
  align-items: center;
  height: 64px;
  padding: 12px 16px;
  box-sizing: border-box;

  .icon-add {
    cursor: pointer;
  }

  .input-wrap {
    flex: 1;
    margin-left: 12px;
    display: flex;
    align-items: center;
    height: 40px;
    padding: 0 16px;
    background: #f3f4f6;
    border-radius: 999px;

    > span {
      margin-left: 8px;
      color: #9ca3af;
      font-size: 14px;
    }
  }

  .icon-menu {
    margin-left: 12px;
  }
}
</style>
