<template>
  <div class="login">
    <LoginNav />
    <div class="login-title">欢迎来到美食杰</div>
    <main>
      <div class="login-box" v-show="!state.isRegister">
        <div class="title">
          <span
            :class="{ current: isPhoneLogin }"
            @click="changeLoginWay(loginWayType.phone)"
            >手机号登录</span
          >
          &nbsp;&nbsp;|&nbsp;&nbsp;
          <span
            :class="{ current: !isPhoneLogin }"
            @click="changeLoginWay(loginWayType.account)"
            >账号密码登录</span
          >
        </div>
        <div class="error-tip" v-if="state.loginErrorText">
          {{ state.loginErrorText }}
        </div>
        <div
          class="main-login-area"
          :style="{ transform: `translateX(${isPhoneLogin ? 0 : '-480px'})` }"
        >
          <div class="phone-login">
            <LoginPhoneInputGroup
              v-model:phone="state.loginModel.phoneLoginModel.phone"
              v-model:verificationCode="
                state.loginModel.phoneLoginModel.verificationCode
              "
            />
            <LoginOperationBtns
              v-model:isAutoLoginNext="
                state.loginModel.phoneLoginModel.isAutoLoginNext
              "
              @toggleIsRegister="onToggleIsRegister"
              @loginBtnClick="onLoginBtnClick"
            />
          </div>
          <div class="account-login">
            <LoginAccountInputGroup
              v-model:account="state.loginModel.accountLoginModel.account"
              v-model:password="state.loginModel.accountLoginModel.password"
              @finish="onLoginBtnClick"
            />
            <LoginOperationBtns
              v-model:isAutoLoginNext="
                state.loginModel.accountLoginModel.isAutoLoginNext
              "
              @toggleIsRegister="onToggleIsRegister"
              @loginBtnClick="onLoginBtnClick"
            />
          </div>
        </div>
      </div>
      <div class="register-box" v-show="state.isRegister">
        <div class="title">注册美食杰</div>
        <div class="error-tip" v-if="state.registerErrorText">
          {{ state.registerErrorText }}
        </div>
        <LoginAccountInputGroup
          v-model:account="state.registerModel.account"
          v-model:password="state.registerModel.password"
          @finish="onRegisterBtnClick"
        />
        <LoginRegisterOperationBtns
          v-model:isAcceptArgument="state.registerModel.isAcceptArgument"
          @toggleIsRegister="onToggleIsRegister"
          @registerBtnClick="onRegisterBtnClick"
        />
      </div>
    </main>
  </div>
</template>

<script setup lang="ts">
import { reactive, computed } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useUserStore } from '@/store/user'
import { registerByAccount, loginByAccount } from '@/service/login'
import LoginNav from './components/LoginNav.vue'
import LoginPhoneInputGroup from './components/LoginPhoneInputGroup.vue'
import LoginAccountInputGroup from './components/LoginAccountInputGroup.vue'
import LoginOperationBtns from './components/LoginOperationBtns.vue'
import LoginRegisterOperationBtns from './components/LoginRegisterOperationBtns.vue'
import undevelopedTip from '@/utils/undevelopedTip'

// 登录方式枚举
enum loginWayType {
  phone = 'phone',
  account = 'account',
}

const router = useRouter()
const route = useRoute()
const userStore = useUserStore()
const state = reactive<{
  isRegister: boolean // 注册还是登录 true：注册 false：登录
  loginModel: {
    // 登录的model数据
    currentLoginWay: loginWayType // 登录方式  phone：手机号登录 account：账号密码登录
    phoneLoginModel: {
      // 使用手机号登录的数据
      phone: string // 手机号
      verificationCode: string // 验证码
      isAutoLoginNext: boolean // 是否下次自动登录
    }
    accountLoginModel: {
      // 使用账号密码登录的数据
      account: string // 账号
      password: string // 密码
      isAutoLoginNext: boolean // 是否下次自动登录
    }
  }
  registerModel: {
    // 注册的model数据
    account: string // 账号
    password: string // 密码
    isAcceptArgument: boolean // 是否阅读并且同意《用户协议》和《隐私政策》
  }
  loginErrorText: string // 登录报错信息
  registerErrorText: string // 注册报错信息
}>({
  isRegister: !!route.query.isRegister,
  loginModel: {
    currentLoginWay: loginWayType.phone,
    phoneLoginModel: {
      phone: '',
      verificationCode: '',
      isAutoLoginNext: true,
    },
    accountLoginModel: {
      account: '',
      password: '',
      isAutoLoginNext: true,
    },
  },
  registerModel: {
    account: '',
    password: '',
    isAcceptArgument: true,
  },
  loginErrorText: '',
  registerErrorText: '',
})

let btnLoading = false

// 是否是手机号登录 true：手机号登录 false：账号密码登录
const isPhoneLogin = computed(
  () => state.loginModel.currentLoginWay === loginWayType.phone
)

/**
 * 切换登录登录方式
 * @param loginWay
 */
function changeLoginWay(loginWay: loginWayType) {
  state.loginModel.currentLoginWay = loginWay
}

/**
 * 切换当前是登录还是注册
 */
function onToggleIsRegister() {
  state.isRegister = !state.isRegister
}

/**
 * 账号密码校验
 * @param account 账号
 * @param password 密码
 * @returns 校验成功为true，失败为false
 */
function accountAndPasswordValidator(account: string, password: string) {
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

/**
 * 登录按钮被点击
 */
function onLoginBtnClick() {
  if (state.loginModel.currentLoginWay === loginWayType.phone) {
    undevelopedTip('功能暂未开发，请使用账号密码登录')
    return
  }
  const { account, password, isAutoLoginNext } =
    state.loginModel.accountLoginModel
  if (!accountAndPasswordValidator(account, password)) return
  if (btnLoading) return
  btnLoading = true
  loginByAccount<{ userId: number; token: string }>({ account, password })
    .then((res) => {
      state.loginErrorText = ''
      btnLoading = false
      userStore.token = res.data.token
      if (isAutoLoginNext) {
        localStorage.setItem('token', res.data.token)
      } else {
        localStorage.removeItem('token')
      }

      router.replace('/')
    })
    .catch((err) => {
      btnLoading = false
      if (err.message) {
        state.loginErrorText = err.message
      }
    })
}

/**
 * 注册按钮被点击
 */
function onRegisterBtnClick() {
  const { account, password, isAcceptArgument } = state.registerModel
  if (!accountAndPasswordValidator(account, password)) return
  if (!isAcceptArgument) {
    alert('请阅读并同意《用户协议》和《隐私策略》')
    return
  }
  if (btnLoading) return
  btnLoading = true
  registerByAccount({ account, password })
    .then(() => {
      state.registerErrorText = ''
      btnLoading = false
      alert('注册成功')
      state.loginModel.currentLoginWay = loginWayType.account
      state.isRegister = false
    })
    .catch((err) => {
      btnLoading = false
      if (err.message) {
        state.registerErrorText = err.message
      }
    })
}

// function onSetRegisterErrorText(text) {
//   state.registerErrorText = text
// }
</script>

<style lang="scss" scoped>
.login {
  background: #fff url(@/assets/images/login_bg.jpg) center top no-repeat;
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
        transition: transform ease 0.3s;

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
