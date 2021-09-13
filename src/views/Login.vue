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
              @finish="onLoginBtnClick"
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
        <LoginAccountInputGroup
          v-model:account="registerModel.account"
          v-model:password="registerModel.password"
          @finish="onRegisterBtnClick"
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
import { useRoute, useRouter } from 'vue-router'
import { useStore } from 'vuex'
import { registerByAccount, loginByAccount } from '@/service/login'
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
    const router = useRouter()
    const route = useRoute()
    const store = useStore()
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
        account: '',
        password: '',
        isAcceptArgument: true
      },
      loginErrorText: '',
      registerErrorText: ''
    })

    let btnLoading = false

    const isPhoneLogin = computed(() => state.loginModel.currentLoginWay === 'phone')

    function changeLoginWay(loginWay) {
      state.loginModel.currentLoginWay = loginWay
    }

    function onToggleIsRegister() {
      state.isRegister = !state.isRegister
    }

    function accountAndPasswordValidator(account, password) {
      if (!account || !password) {
        alert('请输入账号或密码')
        return false
      }
      if (account.length < 3 || account.length > 12) {
        alert('账号的长度需在3到12位之间')
        return false
      }
      if (password.length < 3 || password.length > 15) {
        alert('密码的长度需在3到15位之间')
        return false
      }
      return true
    }

    function onLoginBtnClick() {
      if (state.loginModel.currentLoginWay === 'phone') {
        undevelopedTip('功能暂未开发，请使用账号密码登录')
        return
      }
      const { account, password, isAutoLoginNext } = state.loginModel.accountLoginModel
      if (!accountAndPasswordValidator(account, password)) {
        return
      }
      if (btnLoading) {
        return
      }
      btnLoading = true
      loginByAccount({ account, password }).then(res => {
        state.loginErrorText = ''
        btnLoading = false
        store.commit('setToken', res.data.token)
        if (isAutoLoginNext) {
          localStorage.setItem('token', res.data.token)
        } else {
          localStorage.removeItem('token')
        }

        router.replace('/')
      }).catch(err => {
        btnLoading = false
        if (err.message) {
          state.loginErrorText = err.message
        }
      })
    }

    function onRegisterBtnClick() {
      const { account, password, isAcceptArgument } = state.registerModel
      if (!accountAndPasswordValidator(account, password)) {
        return
      }
      if (!isAcceptArgument) {
        alert('请阅读并同意《用户协议》和《隐私策略》')
        return
      }
      if (btnLoading) {
        return
      }
      btnLoading = true
      registerByAccount({ account, password }).then(() => {
        state.registerErrorText = ''
        btnLoading = false
        alert('注册成功')
        state.loginModel.currentLoginWay = 'account'
        state.isRegister = false
      }).catch(err => {
        btnLoading = false
        if (err.message) {
          state.registerErrorText = err.message
        }
      })
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
