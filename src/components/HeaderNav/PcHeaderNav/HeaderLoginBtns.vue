<template>
  <div class="login-btns">
    <router-link class="login-btn" to="/login">登录</router-link>
    <span class="mark">|</span>
    <router-link
      class="login-btn"
      :to="{ path: '/login', query: { isRegister: true } }"
      >注册</router-link
    >
  </div>
</template>

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
