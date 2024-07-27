<template>
  <div class="register-options">
    <label>
      <input
        class="checkbox"
        type="checkbox"
        :checked="isAcceptArgument"
        @change="onIsAcceptArgumentInputChange"
      />
      <span>我已阅读并且同意美食杰</span>
      <a
        href="https://www.meishij.net/siteinfo/user_agreement.php"
        target="_blank"
        >《用户协议》</a
      >
      <span>和</span>
      <a href="https://www.meishij.net/siteinfo/privacy.php" target="_blank"
        >《隐私政策》</a
      >
    </label>
  </div>
  <a class="register-btn" href="javascript:;" @click="emit('registerBtnClick')"
    >注册</a
  >
  <a class="go-login-btn" href="javascript:;" @click="emit('toggleIsRegister')"
    >已有账号？立即登录</a
  >
</template>

<script setup lang="ts">
withDefaults(
  defineProps<{
    isAcceptArgument?: boolean // 是否已阅读并且《用户协议》和《隐私政策》
  }>(),
  {
    isAcceptArgument: true,
  }
)

const emit = defineEmits<{
  (e: 'update:isAcceptArgument', value: boolean): void
  (e: 'registerBtnClick'): void
  (e: 'toggleIsRegister'): void
}>()

const onIsAcceptArgumentInputChange = (evt: Event): void => {
  emit('update:isAcceptArgument', (evt.target as HTMLInputElement).checked)
}
</script>

<style lang="scss" scoped>
.register-options {
  margin-bottom: 20px;
  text-align: center;

  label {
    color: #999;
    font-size: 16px;

    .checkbox {
      width: 16px;
      height: 16px;
      transform: translateY(2px);
    }

    a {
      color: #ea5d4e;

      &:hover {
        text-decoration: underline;
      }
    }
  }
}

.register-btn {
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

.go-login-btn {
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
