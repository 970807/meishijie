<template>
  <div class="row">
    <input
      class="input"
      type="text"
      placeholder="请输入账号"
      :value="account"
      @input="onAccountInput"
    />
  </div>
  <div class="row">
    <input
      class="input"
      type="password"
      placeholder="请输入密码"
      :value="password"
      @input="onPasswordInput"
      @keyup.enter="emit('finish')"
    />
  </div>
</template>

<script setup lang="ts">
defineProps<{
  account: string // 账号
  password: string // 密码
}>()

const emit = defineEmits<{
  (e: 'update:account', value: string): void
  (e: 'update:password', value: string): void
  (e: 'finish'): void
}>()

const onAccountInput = (evt: Event): void => {
  emit('update:account', (evt.target as HTMLInputElement).value)
}

const onPasswordInput = (evt: Event): void => {
  emit('update:password', (evt.target as HTMLInputElement).value)
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
}
</style>
