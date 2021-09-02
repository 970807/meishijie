<template>
  <div class="row">
    <input
      class="input" type="text" placeholder="请输入手机号"
      :value="phone"
      @input="$emit('update:phone', $event.target.value)"
    />
  </div>
  <div class="row">
    <input
      class="input" style="width: 300px" type="text" placeholder="请输入验证码"
      :value="verificationCode"
      @input="$emit('update:verificationCode', $event.target.value)"
    />
    <a
      class="get-v-code-btn"
      :class="{gray: !isGetVerificationCodeBtnEnable}"
      href="javascript:;"
      @click="onGetVerificationCode"
    >
      {{isGetVerificationCodeBtnEnable?'获取验证码':`${getVerificationCodeRemainingTime}秒后重新获取`}}
    </a>
  </div>
</template>

<script>
import { ref, computed } from 'vue'
import { getVerificationCode } from '@/service/login'

export default {
  props: {
    phone: {
      type: String,
      required: true
    },
    verificationCode: {
      type: String,
      required: true
    }
  },
  emits: ['update:phone', 'update:verificationCode', 'setErrorTipText'],
  setup(props, ctx) {
    const getVerificationCodeRemainingTime = ref(0)

    const isGetVerificationCodeBtnEnable = computed(
      () => getVerificationCodeRemainingTime.value <= 0
    )

    // 获取验证码
    function onGetVerificationCode() {
      if (!isGetVerificationCodeBtnEnable.value) {
        return
      }
      if (props.phone.length === 0) {
        alert('请输入手机号')
        return
      }
      if (!/^\d{5,11}$/.test(props.phone)) {
        alert('手机号格式不正确')
        return
      }
      getVerificationCodeRemainingTime.value = 60
      const timer = setInterval(() => {
        getVerificationCodeRemainingTime.value--
        if (getVerificationCodeRemainingTime.value <= 0) {
          clearInterval(timer)
        }
      }, 1000)

      getVerificationCode({ phone: props.phone }).then(res => {
        ctx.emit('update:verificationCode', res.data)
        ctx.emit('setErrorTipText', '')
      }).catch(err => {
        err.msg && ctx.emit('setErrorTipText', err.msg)
      })
    }

    return {
      getVerificationCodeRemainingTime,
      isGetVerificationCodeBtnEnable,
      onGetVerificationCode
    }
  }
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

      &.gray {
        color: #999;
        background: #ddd;
      }
    }
  }
</style>
