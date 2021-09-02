<template>
  <div class="login">
    <LoginNav />
    <div class="login-title">欢迎来到美食杰</div>
    <main>
      <div class="login-box" v-show="!isRegister">
        <div class="title">
          <span :class="{current: isPhoneLogin}" @click="changeLoginWay('phone')">手机号登录</span>
          &nbsp;&nbsp;|&nbsp;&nbsp;
          <span :class="{current: !isPhoneLogin}" @click="changeLoginWay('account')">账号密码登录</span>
        </div>
        <div class="error-tip" v-if="loginErrorText">{{loginErrorText}}</div>
        <div class="main-login-area"
             :style="{transform: `translateX(${isPhoneLogin?0:'-480px'})`}">
          <div class="phone-login">
            <LoginPhoneInputGroup
              v-model:phone="loginModel.phoneLoginModel.phone"
              v-model:verificationCode="loginModel.phoneLoginModel.verificationCode"
              @setErrorTipText="onSetLoginErrorText"
            />
            <LoginOperationBtns
              v-model:isAutoLoginNext="loginModel.phoneLoginModel.isAutoLoginNext"
              @toggleIsRegister="onToggleIsRegister"
              @loginBtnClick="onLoginBtnClick"
            />
          </div>
          <div class="account-login">
            <LoginAccountInputGroup
              v-model:account="loginModel.accountLoginModel.account"
              v-model:password="loginModel.accountLoginModel.password"
            />
            <LoginOperationBtns
              v-model:isAutoLoginNext="loginModel.accountLoginModel.isAutoLoginNext"
              @toggleIsRegister="onToggleIsRegister"
              @loginBtnClick="onLoginBtnClick"
            />
          </div>
        </div>
      </div>
      <div class="register-box" v-show="isRegister">
        <div class="title">注册美食杰</div>
        <div class="error-tip" v-if="registerErrorText">{{registerErrorText}}</div>
        <LoginPhoneInputGroup
          v-model:phone="registerModel.phone"
          v-model:verificationCode="registerModel.verificationCode"
          @setErrorTipText="onSetRegisterErrorText"
        />
        <LoginRegisterOperationBtns
          v-model:isAcceptArgument="registerModel.isAcceptArgument"
          @toggleIsRegister="onToggleIsRegister"
          @registerBtnClick="onRegisterBtnClick"
        />
      </div>
    </main>
  </div>
</template>

<script>
import { reactive, computed, toRefs } from 'vue'
import { useRoute } from 'vue-router'
import { registerByPhone } from '@/service/login'
import LoginNav from '@/components/LoginNav'
import LoginPhoneInputGroup from '@/components/LoginPhoneInputGroup'
import LoginAccountInputGroup from '@/components/LoginAccountInputGroup'
import LoginOperationBtns from '@/components/LoginOperationBtns'
import LoginRegisterOperationBtns from '@/components/LoginRegisterOperationBtns'
import undevelopedTip from '@/utils/undevelopedTip'

export default {
  name: 'Login',
  components: {
    LoginNav,
    LoginPhoneInputGroup,
    LoginAccountInputGroup,
    LoginOperationBtns,
    LoginRegisterOperationBtns
  },
  setup() {
    const route = useRoute()
    const state = reactive({
      isRegister: !!route.query.isRegister,
      loginModel: {
        currentLoginWay: 'phone',
        phoneLoginModel: {
          phone: '',
          verificationCode: '',
          isAutoLoginNext: true
        },
        accountLoginModel: {
          account: '',
          password: '',
          isAutoLoginNext: true
        }
      },
      registerModel: {
        phone: '',
        verificationCode: '',
        isAcceptArgument: true
      },
      loginErrorText: '',
      registerErrorText: ''
    })

    const isPhoneLogin = computed(() => state.loginModel.currentLoginWay === 'phone')

    function changeLoginWay(loginWay) {
      state.loginModel.currentLoginWay = loginWay
    }

    function onToggleIsRegister() {
      state.isRegister = !state.isRegister
    }

    function onLoginBtnClick() {
      undevelopedTip()
    }

    function onRegisterBtnClick() {
      const { phone, verificationCode, isAcceptArgument } = state.registerModel
      if (!phone || !verificationCode) {
        alert('请输入手机号或验证码')
        return
      }
      if (!isAcceptArgument) {
        alert('请阅读并同意《用户协议》和《隐私策略》')
        return
      }
      registerByPhone({ phone, verificationCode }).then(res => {
        console.log(res)
      }).catch(err => {
        if (err.msg) {
          alert(err.msg)
        }
      })
    }

    function onSetLoginErrorText(text) {
      state.loginErrorText = text
    }

    function onSetRegisterErrorText(text) {
      state.registerErrorText = text
    }

    return {
      ...toRefs(state),
      isPhoneLogin,
      changeLoginWay,
      onToggleIsRegister,
      onLoginBtnClick,
      onRegisterBtnClick,
      onSetLoginErrorText,
      onSetRegisterErrorText
    }
  }
}
</script>

<style lang="scss" scoped>
  .login {
    background: #fff url(../assets/images/login_bg.jpg) center top no-repeat;
    padding-bottom: 200px;

    .login-title {
      color: #fff;
      font-size: 48px;
      padding: 70px 0 50px;
      text-align: center;
    }

    main {
      width: 600px;
      background: #fff;
      margin: 0 auto;
      border-radius: 24px;
      box-shadow: 0 0 100px rgb(0 0 0 / 30%);
      box-sizing: border-box;

      .login-box {
        width: 480px;
        margin: 0 auto;
        overflow: hidden;

        .title {
          padding: 50px 0;
          color: #999;
          font-size: 24px;
          font-weight: 600;
          text-align: center;

          span {
            cursor: pointer;

            &.current {
              color: #333;
            }

            &:hover {
              color: #333;
              text-decoration: underline;
            }
          }
        }

        .error-tip {
          color: #fff;
          background: #ea5d4e;
          height: 44px;
          line-height: 44px;
          text-align: center;
          border-radius: 4px;
          margin: -20px 0 22px;
        }

        .main-login-area {
          white-space: nowrap;
          transition: transform ease .3s;

          .phone-login,
          .account-login {
            display: inline-block;
          }
        }
      }

      .register-box {
        width: 480px;
        margin: 0 auto;

        .title {
          padding: 50px 0;
          color: #333;
          font-size: 24px;
          font-weight: 600;
          text-align: center;
        }

        .error-tip {
          color: #fff;
          background: #ea5d4e;
          height: 44px;
          line-height: 44px;
          text-align: center;
          border-radius: 4px;
          margin: -20px 0 22px;
        }
      }
    }
  }
</style>
