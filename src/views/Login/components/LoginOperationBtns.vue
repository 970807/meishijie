<template>
  <div class="login-options">
    <label>
      <input
        class="checkbox"
        type="checkbox"
        :checked="isAutoLoginNext"
        @change="onIsAutoLoginInputChange"
      />
      <span>下次自动登录</span>
    </label>
    <a class="forget-password-btn" href="javascript:;" @click="undevelopedTip()"
      >忘记密码？</a
    >
  </div>
  <a class="login-btn" href="javascript:;" @click="emit('loginBtnClick')"
    >登录</a
  >
  <a
    class="go-register-btn"
    href="javascript:;"
    @click="emit('toggleIsRegister')"
    >没有账号？立即注册</a
  >
</template>

<script setup lang="ts">
import undevelopedTip from '@/utils/undevelopedTip'

withDefaults(
  defineProps<{
    isAutoLoginNext?: boolean // 是否下次自动登录
  }>(),
  {
    isAutoLoginNext: false,
  }
)

const emit = defineEmits<{
  (e: 'update:isAutoLoginNext', value: boolean): void
  (e: 'toggleIsRegister'): void
  (e: 'loginBtnClick'): void
}>()

// 切换'下次自动登录'
const onIsAutoLoginInputChange = (evt: Event): void => {
  emit('update:isAutoLoginNext', (evt.target as HTMLInputElement).checked)
}
</script>

<style lang="scss" scoped>
.login-options {
  margin-bottom: 20px;
  text-align: center;
  color: #999;

  .checkbox {
    width: 16px;
    height: 16px;
    transform: translateY(2px);
  }

  .forget-password-btn {
    padding-left: 18px;

    &:hover {
      color: #ea5d4e;
      text-decoration: underline;
    }
  }
}

.login-btn {
  display: block;
  margin: 0 auto;
  width: 240px;
  height: 56px;
  line-height: 56px;
  border-radius: 28px;
  text-align: center;
  font-size: 24px;
  color: #fff;
  background: rgb(234, 93, 78);

  &:hover {
    background: #db432e;
  }
}

.go-register-btn {
  display: block;
  color: #ea5d4e;
  font-size: 18px;
  font-weight: 600;
  text-align: center;
  padding: 22px 0 26px;

  &:hover {
    text-decoration: underline;
  }
}
</style>
