<template>
  <div class="login-btns">
    <router-link v-if="canLogin" class="login-btn" to="/login"
      >登录</router-link
    >
    <span v-if="canLogin && canRegister" class="mark">|</span>
    <router-link
      v-if="canRegister"
      class="login-btn"
      :to="{ path: '/login', query: { isRegister: true } }"
      >注册</router-link
    >
  </div>
</template>

<script lang="ts" setup>
import { useSystemConfigsStore } from '@/store/systemConfigs'

const {
  // 允许登录
  canLogin,
  // 允许注册
  canRegister,
} = useSystemConfigsStore()
</script>

<style lang="scss" scoped>
.login-btns {
  display: flex;
  align-items: center;
  color: #fff;
  font-size: 12px;
  padding-left: 120px;

  .login-btn {
    font-size: 16px;

    &:hover {
      text-decoration: underline;
    }
  }

  .mark {
    padding: 0 10px;
  }
}
</style>
