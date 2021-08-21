<template>
  <div class="user-info">
    <span class="login-btn" @click="undevelopedTip">登录</span>
    <span class="mark">|</span>
    <span class="login-btn" @click="undevelopedTip">注册</span>
  </div>
</template>

<script setup>
function undevelopedTip() {
  alert('功能暂未开发')
}
</script>

<style lang="scss" scoped>
  .user-info {
    display: flex;
    align-items: center;
    color: #fff;
    font-size: 12px;
    padding-left: 120px;

    .login-btn {
      font-size: 16px;
      cursor: pointer;

      &:hover {
        text-decoration: underline;
      }
    }

    .mark {
      padding: 0 10px;
    }
  }
</style>
