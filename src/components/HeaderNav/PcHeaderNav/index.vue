<template>
  <header class="header-wrapper">
    <div class="inner-wrapper">
      <div class="box">
        <a class="logo" href="https://meishij.net" target="_blank">
          <img src="@/assets/images/logo.png" />
        </a>
        <HeaderSearchInput />
        <HeaderNavbar />
        <HeaderLoginBtns v-if="!hasToken" />
        <HeaderUserInfo v-else />
      </div>
    </div>
  </header>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useUserStore } from '@/store/user'
import HeaderSearchInput from './HeaderSearchInput.vue'
import HeaderNavbar from './HeaderNavbar.vue'
import HeaderLoginBtns from './HeaderLoginBtns.vue'
import HeaderUserInfo from './HeaderUserInfo.vue'

const userStore = useUserStore()
const hasToken = computed(() => userStore.hasToken)
</script>

<style lang="scss" scoped>
$headerHeight: 80px;
.header-wrapper {
  height: $headerHeight;

  .inner-wrapper {
    position: fixed;
    width: 100%;
    height: $headerHeight;
    background: rgba(246, 77, 54, 0.8);
    background-image: linear-gradient(
      to right,
      rgba(250, 69, 81, 0.8),
      rgba(246, 77, 54, 0.8)
    );
    backdrop-filter: blur(20px);
    z-index: 999;

    .box {
      position: relative;
      display: flex;
      align-items: center;
      width: $pc-min-width;
      height: 100%;
      margin: 0 auto;

      .logo {
        width: 106px;
        height: 54px;
        display: block;
        margin-right: 22px;

        img {
          width: 100%;
          height: 100%;
        }
      }
    }
  }
}
</style>
