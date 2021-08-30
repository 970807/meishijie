<template>
  <div class="row">
    <input
      class="input" type="text" placeholder="请输入账号"
      :value="account"
      @input="$emit('update:account', $event.target.value)"
    />
  </div>
  <div class="row">
    <input
      class="input" type="text" placeholder="请输入密码"
      :value="password"
      @input="$emit('update:password', $event.target.value)"
    />
  </div>
</template>

<script>
export default {
  props: {
    account: {
      type: String,
      required: true
    },
    password: {
      type: String,
      required: true
    }
  },
  emits: ['update:account', 'update:password']
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
      font-family: "PingFang SC", "Hiragino Sans GB", 冬青黑体, "Microsoft Yahei", 微软雅黑;
      box-sizing: border-box;
    }
  }
</style>
