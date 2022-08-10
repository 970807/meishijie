<template>
  <div class="user-info">
    <div class="inner">
      <div
        class="avatar"
        :style="{
          backgroundImage: `url(${state.userInfo.avatar || defaultAvatar})`
        }"
      >
        <i class="icon"></i>
      </div>
      <div class="account">{{ state.userInfo.account }}</div>
    </div>
    <div class="menu">
      <a class="btn1" href="javascript:;">+ 发布菜谱</a>
      <ul>
        <li class="signed">
          <span>✔ 今日已签到</span>
        </li>
        <li @click="onLogout">
          <span>退出登录</span>
          <i></i>
        </li>
      </ul>
    </div>
  </div>
</template>

<script setup lang="ts">
import { reactive } from 'vue'
import { IState, IUserInfo } from '../types/headerArea'
import { useUserStore } from '../store/user'
import { getUserInfo } from '../service/user'
import defaultAvatar from '../assets/images/avatar_default.png'

const userStore = useUserStore()
const state = reactive<IState>({
  userInfo: {}
})
getUserInfo<IUserInfo>()
  .then((res) => {
    state.userInfo = res.data
  })
  .catch((err) => {
    console.error(err)
  })

function onLogout() {
  localStorage.removeItem('token')
  userStore.token = ''
}
</script>

<style lang="scss" scoped>
.user-info {
  align-self: flex-start;
  width: 180px;
  height: 56px;
  overflow: hidden;
  margin-top: 12px;
  padding: 10px 0;
  border-radius: 4px;
  cursor: pointer;
  box-sizing: border-box;

  &:hover {
    background: #fff;
    box-shadow: 0 0 8px rgba(0 0 0 / 10%);
    height: auto;

    .account {
      color: #f64d36 !important;
      text-decoration: underline;
    }
  }

  .inner {
    padding: 0 15px 10px;

    .avatar {
      position: relative;
      display: inline-block;
      width: 36px;
      height: 36px;
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
      border-radius: 50%;
      vertical-align: top;

      .icon {
        position: absolute;
        right: 0;
        bottom: 0;
        background: url(../assets/images/daren.png) center no-repeat;
        background-size: 100% 100%;
        width: 16px;
        height: 16px;
      }
    }

    .account {
      display: inline-block;
      width: 114px;
      height: 36px;
      line-height: 36px;
      padding-left: 10px;
      color: #fff;
      font-size: 14px;
      font-weight: 600;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
      box-sizing: border-box;
    }
  }

  .menu {
    .btn1 {
      display: block;
      height: 32px;
      line-height: 32px;
      font-size: 14px;
      margin: 0 15px 10px;
      text-align: center;
      color: #fff;
      background-image: linear-gradient(to right, #f67536, #f64d36);
      transition: all ease 0.1s;
      border-radius: 2px;

      &:hover {
        background-image: linear-gradient(to right, #f64d36, #eb4b34);
      }
    }

    ul {
      li {
        position: relative;
        height: 32px;
        line-height: 32px;
        font-size: 14px;
        color: #222;
        padding: 0 15px;
        border-top: 1px solid #f1f1f1;

        &.signed {
          color: #aaa;
          cursor: default;
        }

        &:hover {
          background: #f5f5f5;
        }

        i {
          position: absolute;
          top: 12px;
          right: 15px;
          background: url(../assets/images/arrow_right.png) center no-repeat;
          background-size: 100% 100%;
          width: 4px;
          height: 7px;
        }
      }
    }
  }
}
</style>
