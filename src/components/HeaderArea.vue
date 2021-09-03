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

<script>
import { computed } from 'vue'
import { useStore } from 'vuex'
import HeaderSearchInput from './HeaderSearchInput'
import HeaderNavbar from './HeaderNavbar'
import HeaderLoginBtns from './HeaderLoginBtns'
import HeaderUserInfo from './HeaderUserInfo.vue'

export default {
  components: {
    HeaderSearchInput,
    HeaderNavbar,
    HeaderLoginBtns,
    HeaderUserInfo
  },
  setup() {
    const store = useStore()
    const hasToken = computed(() => !!store.state.token)

    return {
      hasToken
    }
  }
}
</script>

<style lang="scss" scoped>
  $headerHeight: 80px;
  .header-wrapper {
    height: $headerHeight;

    .inner-wrapper {
      position: fixed;
      width: 100%;
      height: $headerHeight;
      background: rgba(246, 77, 54, .8);
      background-image: linear-gradient(to right, rgba(250, 69, 81, .8), rgba(246, 77, 54, .8));
      backdrop-filter: blur(20px);
      z-index: 999;

      .box {
        position: relative;
        display: flex;
        align-items: center;
        width: 1200px;
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
