<template>
  <div class="row">
    <input
      class="input"
      type="text"
      placeholder="请输入手机号"
      :value="phone"
      @input="onPhoneInput"
    />
  </div>
  <div class="row">
    <input
      class="input"
      style="width: 300px"
      type="text"
      placeholder="请输入验证码"
      :value="verificationCode"
      @input="onVerificationCodeInput"
    />
    <a
      class="get-v-code-btn"
      href="javascript:;"
      @click="undevelopedTip('功能暂未开发，请使用账号密码登录')"
    >
      获取验证码
    </a>
  </div>
</template>

<script setup lang="ts">
import undevelopedTip from '@/utils/undevelopedTip'

defineProps<{
  phone: string
  verificationCode: string
}>()

const emit = defineEmits<{
  (e: 'update:phone', value: string): void
  (e: 'update:verificationCode', value: string): void
}>()

const onPhoneInput = (evt: Event): void => {
  emit('update:phone', (evt.target as HTMLInputElement).value)
}

const onVerificationCodeInput = (evt: Event): void => {
  emit('update:verificationCode', (evt.target as HTMLInputElement).value)
}
</script>

<style lang="scss" scoped>
.row {
  margin-bottom: 20px;

  .input {
    width: 480px;
    height: 56px;
    line-height: 56px;
    border-radius: 28px;
    font-size: 18px;
    color: rgb(51, 51, 51);
    border: 1px solid rgb(221, 221, 221);
    outline: none;
    margin: 0 auto;
    padding: 0 20px;
    font-family: 'PingFang SC', 'Hiragino Sans GB', 冬青黑体, 'Microsoft Yahei',
      微软雅黑;
    box-sizing: border-box;
  }

  .get-v-code-btn {
    display: block;
    float: right;
    width: 160px;
    height: 56px;
    line-height: 56px;
    border-radius: 28px;
    text-align: center;
    background: #8fc31f;
    color: #fff;
    font-size: 16px;

    &:hover {
      background: #75ab49;
    }
  }
}
</style>
