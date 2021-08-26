<template>
  <div class="home">
    <HeaderArea />
    <!-- 今日热门视频菜谱-start -->
    <div class="hot-today-video-wrap">
      <div class="inner">
        <h1 class="title">今日热门视频菜谱</h1>
        <div class="video-list">
          <div class="item" v-for="item in hotTodayVideoList" :key="item.id">
            <div class="mask"></div>
            <img class="cover" :src="item.coverUrl" />
            <i class="play-btn"></i>
            <div class="info">
              <div class="t">{{item.title}}</div>
              <div class="row">
                <div class="avatar"
                     :style="{backgroundImage: `url(${item.userAvatar})`}"></div>
                <div class="username">{{item.username}}</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- 今日热门视频菜谱-end -->

    <div class="index-center-area">
      <!-- 今日热搜-start -->
      <div class="hot-today-search">
        <h1 class="title">今日热搜</h1>
        <ul class="list">
          <li class="item" :class="{hot: item.isHot}" v-for="item in hotTodaySearchList" :key="item.id">
            {{item.label}}
          </li>
        </ul>
      </div>
      <!-- 今日热搜-end -->

      <!-- 今日三餐-start -->
      <div class="three-meals-today">
        <h1 class="title">
          今日三餐
          <ul class="tabs">
            <li
              class="item"
              :class="{current: index===currentThreeMealsTabIndex}"
              v-for="(item, index) in threeMealsTodayList"
              :key="item.id"
              @click="onCurrentThreeMealsTabIndexChange(index)"
            >{{item.label}}</li>
          </ul>
        </h1>
        <div class="content">
          <div class="item" v-for="item in threeMealsTodayList[currentThreeMealsTabIndex].list" :key="item.id">
            <img class="cover" :src="item.coverUrl" />
            <strong class="t ellipsis-l1">{{item.title}}</strong>
            <p class="desc ellipsis-l1">{{item.desc}}</p>
          </div>
        </div>
      </div>
      <!-- 今日三餐-end -->

      <!-- 二维码-start -->
      <div class="qrcode">
        <img class="bg-img" src="https://pic.rmb.bdstatic.com/bjh/95f438ba7f905f411a01536abedb8141.jpeg" />
        <img class="qr-img" src="https://pic.rmb.bdstatic.com/bjh/632b55be8036f68d348ff4dff08a4b12.png" />
        <img class="phone-img" src="https://pic.rmb.bdstatic.com/bjh/ae8de3365ddd894c919335cd8b35bbca.png" />
        <div class="desc">
          <strong>让吃饭变简单</strong>
          <span>www.Meishi.cc</span>
        </div>
      </div>
      <!-- 二维码-end -->
    </div>

    <div class="recomment-area">
      <div class="list-wrap" v-for="item in recommentList" :key="item.id">
        <div class="title">{{item.columnTitle}}</div>
        <div class="list">
          <div class="item" v-for="item2 in item.list" :key="item2.id">
            <div
              class="cover"
              :style="{backgroundImage: `url(${item2.coverUrl})`}"
            >
              <i class="video-icon" v-if="item2.isVideo"></i>
              <div class="author-info">
                <div class="author-avatar" :style="{backgroundImage: `url(${item2.authorAvatar})`}"></div>
                <strong class="author-name ellipsis-l1">{{item2.authorName}}</strong>
              </div>
            </div>
            <div class="info">
              <strong class="t ellipsis-l1">{{item2.title}}</strong>
              <span class="desc ellipsis-l1">{{item2.desc}}</span>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- footer-start -->
    <footer class="main-footer">
      <div class="top">
        <div class="left-logo"></div>
        <div class="right-qrcodes">
          <div class="item">
            <div class="icon icon-01"></div>
            <div class="info">
              <div class="title">美食杰APP</div>
              <div class="desc">扫码免费安装</div>
            </div>
          </div>
          <div class="item">
            <div class="icon icon-02"></div>
            <div class="info">
              <div class="title">美食杰微信小程序</div>
              <div class="desc">微信扫码进入</div>
            </div>
          </div>
          <div class="item">
            <div class="icon icon-03"></div>
            <div class="info">
              <div class="title">美食杰公众号</div>
              <div class="desc">微信扫码关注</div>
            </div>
          </div>
          <div class="item">
            <div class="icon icon-04"></div>
            <div class="info">
              <div class="title">美食杰官方微博</div>
              <div class="desc">扫码关注，点击进入</div>
            </div>
          </div>
        </div>
      </div>
      <div class="bottom">
        <ul>
          <li>公司简介</li>
          <li>关于我们</li>
          <li>产品下载</li>
          <li>加入我们</li>
          <li>联系我们</li>
          <li>商务合作</li>
          <li>用户协议</li>
          <li>隐私政策</li>
          <li>网站地图</li>
          <li>友情链接</li>
        </ul>
        <p>京ICP备14030359号-1</p>
        <img src="https://st-cn.meishij.net/p2/20180208/20180208111357_93713.png" />
        <p>京公网安备11010802026928</p>
        <p> Copyright ? 2003-2021 MEISHIJ CO.,LTD.</p>
      </div>
    </footer>
    <!-- footer-end -->
  </div>
</template>

<script setup>
import { ref } from 'vue'
import HeaderArea from '@/components/HeaderArea'

const hotTodayVideoList = require('@/assets/data/hotTodayVideoList.json')

const hotTodaySearchList = require('@/assets/data/hotTodaySearchList.json')

const threeMealsTodayList = require('@/assets/data/threeMealsTodayList.json')

const currentThreeMealsTabIndex = ref(0)

function onCurrentThreeMealsTabIndexChange(index) {
  currentThreeMealsTabIndex.value = index
}

const recommentList = require('@/assets/data/recommentList.json')
</script>

<style lang="scss" scoped>
  .hot-today-video-wrap {
    background: #efeeec;

    .inner {
      width: 1200px;
      margin: 0 auto;
      padding: 14px 0 40px;

      .title {
        color: #222;
        font-size: 24px;
        font-weight: 600;
        padding: 20px 0;
      }

      .video-list {
        display: flex;
        flex-wrap: wrap;

        .item {
          position: relative;
          width: 285px;
          height: 526px;
          margin-right: 20px;
          border-radius: 12px;
          overflow: hidden;
          cursor: pointer;

          &:nth-child(4n) {
            margin-right: 0;
          }

          .mask {
            position: absolute;
            left: 0;
            right: 0;
            top: 0;
            bottom: 0;
            background: rgba(0,0,0,.5);
            z-index: 1;
          }

          .cover {
            width: 100%;
            height: 100%;
            object-fit: cover;
            filter: blur(8px);
            opacity: .5;
          }

          .play-btn {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            display: block;
            width: 100px;
            height: 100px;
            background: url(../assets/images/sprite_03.png) 0px -20px no-repeat;
            background-size: 100px 250px;
            z-index: 10;
            opacity: .8;
            transform: all ease .3s;

            &:hover {
              opacity: 1;
            }
          }

          .info {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            padding: 0 20px;
            color: #fff;
            z-index: 5;
            box-sizing: border-box;

            .t {
              font-size: 22px;
              font-weight: 700;
            }

            .row {
              display: flex;
              align-items: center;
              padding: 16px 0 20px;

              .avatar {
                width: 32px;
                height: 32px;
                border-radius: 50%;
              }

              .username {
                font-size: 14px;
                font-weight: 600;
                padding-left: 10px;
              }
            }
          }
        }
      }

    }

  }

  .index-center-area {
    position: relative;
    width: 1200px;
    margin: 40px auto 0;

    .hot-today-search {
      width: 810px;
      background: #fff;
      border-radius: 12px;
      padding: 22px 0 16px;

      .title {
        font-size: 24px;
        font-weight: 600;
        color: #222;
        padding: 0 0 22px 22px;
      }

      .list {
        padding: 0 20px;

        .item {
          display: inline-block;
          font-size: 18px;
          height: 40px;
          line-height: 40px;
          border-radius: 20px;
          padding: 0 16px;
          margin: 0 15px 15px 0;
          color: #222;
          background: #f5f5f5;
          cursor: pointer;

          &:hover {
            background: #eee;
          }

          &.hot {
            background: rgba(246, 77, 54, .15);
            color: #f64d36;

            &:hover {
              background: rgba(246, 77, 54, .2);
            }
          }
        }
      }
    }

    .three-meals-today {
      width: 810px;
      margin-top: 40px;
      border-radius: 12px;
      background: #fff;

      .title {
        font-size: 24px;
        color: #222;
        font-weight: 600;
        padding: 20px;

        .tabs {
          display: inline-block;
          padding-left: 20px;

          .item {
            display: inline-block;
            font-size: 18px;
            font-weight: 600;
            color: #999;
            background: #eee;
            padding: 0 15px;
            height: 32px;
            line-height: 32px;
            border-radius: 16px;
            margin-right: 15px;
            cursor: pointer;

            &:hover {
              background: #e8e8e8;
              color: #888;
            }

            &.current {
              color: #fff;
              background-image: linear-gradient(to right, #f67536, #f64d36);
            }
          }
        }
      }

      .content {
        padding-left: 20px;

        .item {
          display: inline-block;
          width: 240px;
          margin: 0 23px 23px 0;
          cursor: pointer;

          &:hover {
            .t {
              color: #f64d36;
            }
          }

          .cover {
            width: 240px;
            height: 240px;
            object-fit: cover;
            border-radius: 8px;
          }

          .t {
            display: block;
            color: #222;
            padding: 10px 0;
            font-size: 18px;
          }

          .desc {
            font-size: 14px;
            color: #999;
          }
        }
      }
    }

    .qrcode {
      position: absolute;
      top: 0;
      right: 0;
      width: 350px;
      height: 634px;
      border-radius: 12px;
      overflow: hidden;

      .bg-img {
        width: 100%;
        height: 100%;
        animation: qr-bg-ani 6s linear infinite;
      }

      .qr-img {
        position: absolute;
        width: 290px;
        height: 251px;
        top: 50px;
        left: 0;
        right: 0;
        margin: auto;
      }

      .phone-img {
        position: absolute;
        right: 0;
        bottom: 30px;
        width: 296px;
        height: 324px;
        animation: qr-phone-ani 6s linear infinite;
      }

      .desc {
        position: absolute;
        bottom: 24px;
        left: 0;
        width: 100%;
        text-align: center;

        strong {
          display: block;
          font-size: 19px;
          color: rgba(255, 255, 255, .95);
          text-shadow: 0 0 4px rgb(0 0 0 / 90%);
          line-height: 28px;
        }

        span {
          font-size: 14px;
          color: rgba(255, 255, 255, .8);
          text-shadow: 0 0 4px rgb(0 0 0 / 90%);
          line-height: 20px;
        }
      }
    }
  }

  .recomment-area {
    width: 1200px;
    margin: 0 auto;

    .list-wrap {
      margin-top: 20px;

      .title {
        color: #222;
        font-size: 24px;
        font-weight: 600;
        padding: 20px 0;
      }

      .list {
        .item {
          display: inline-block;
          width: 224px;
          height: 360px;
          background: #fff;
          border-radius: 12px;
          overflow: hidden;
          margin: 0 20px 20px 0;

          &:nth-child(5n) {
            margin-right: 0;
          }

          .cover {
            position: relative;
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
            height: 280px;
            cursor: pointer;
            overflow: hidden;

            &:hover {
              .author-info {
                bottom: 0;
              }
            }

            .video-icon {
              position: absolute;
              top: 15px;
              right: 15px;
              width: 30px;
              height: 30px;
              background: url(../assets/images/sprite_04.png) 0px 0px no-repeat;
              background-size: 30px 60px;
            }

            .author-info {
              position: absolute;
              bottom: -60px;
              width: 100%;
              height: 60px;
              background: rgba(0,0,0,.5);
              display: flex;
              align-items: center;
              padding: 0 20px;
              box-sizing: border-box;
              transition: bottom ease .3s;

              &:hover {
                .author-name {
                  color: #f64d36;
                }
              }

              .author-avatar {
                flex-shrink: 0;
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                width: 36px;
                height: 36px;
                border-radius: 50%;
                margin-right: 16px;
              }

              .author-name {
                color: #fff;
                font-size: 14px;
              }
            }
          }

          .info {
            cursor: pointer;

            &:hover {
              .t {
                color: #f64d36;
              }
            }

            .t {
              display: block;
              color: #222;
              font-size: 16px;
              font-weight: 600;
              margin: 12px 20px 0;
              line-height: 28px;
            }

            .desc {
              display: block;
              position: relative;
              color: #999;
              font-size: 14px;
              padding: 0 20px 0 44px;
              line-height: 33px;
              box-sizing: border-box;

              &::before {
                content: '';
                position: absolute;
                left: 20px;
                top: 8px;
                width: 16px;
                height: 16px;
                background: url(../assets/images/sprite_01.png) 0px -60px no-repeat;
                background-size: 30px 150px;
              }
            }
          }
        }
      }
    }
  }

  .main-footer {
    width: 100%;
    background: rgba(11, 11, 10, .9);
    padding-top: 40px;
    margin-right: 40px;

    .top {
      width: 1200px;
      margin: 0 auto;

      .left-logo {
        display: inline-block;
        width: 600px;
        height: 180px;
        background: url(../assets/images/logo_02.png) left center no-repeat;
        background-size: 440px auto;
      }

      .right-qrcodes {
        display: inline-block;
        width: 600px;
        height: 200px;
        vertical-align: top;

        .item {
          position: relative;
          display: inline-block;
          width: 280px;
          height: 80px;
          margin: 0 0 20px 20px;
          background: rgba(255, 255, 255, .1);
          border-radius: 4px;

          .icon {
            position: absolute;
            left: 35px;
            top: 15px;
            width: 50px;
            height: 50px;
            background: url(../assets/images/sprite_05.png)  no-repeat;
            background-size: 50px 200px;
          }

          .icon-01 {
            background-position: 0px 0px;
          }

          .icon-02 {
            background-position: 0 -50px;
          }

          .icon-03 {
            background-position: 0 -100px;
          }

          .icon-04 {
            background-position: 0px -150px;
          }

          .info {
            padding-left: 100px;
            padding-top: 16px;

            .title {
              color: #fff;
              font-size: 17px;
              line-height: 26px;
            }

            .desc {
              font-size: 14px;
              color: rgba(255, 255, 255, .5);
              line-height: 22px;
            }
          }
        }
      }
    }

    .bottom {
      width: 1200px;
      height: 120px;
      margin: 23px auto 0;
      text-align: center;

      ul {

        li {
          display: inline-block;
          height: 30px;
          line-height: 30px;
          color: #fff;
          font-size: 16px;
          font-weight: 600;
          padding: 0 12px;
          cursor: pointer;

          &:hover {
            color: #f64d36;
          }
        }
      }

      p {
        display: inline-block;
        color: #999;
        font-size: 12px;
        line-height: 30px;
      }
    }
  }

  @keyframes qr-bg-ani {
    0% {
      transform: scale(1);
      filter: blur(0)
    }

    44% {
      transform: scale(1);
      filter: blur(0);
    }

    50% {
      transform: scale(1.2);
      filter: blur(4px);
    }

    94% {
      transform: scale(1.2);
      filter: blur(4px);
    }

    100% {
      transform: scale(1);
      filter: blur(0);
    }
  }

  @keyframes qr-phone-ani {
    0% {
      right: -296px;
      transform: rotate(45deg);
    }

    44% {
      right: -296px;
      transform: rotate(45deg);
    }

    50% {
      right: 0;
      transform: rotate(0);
    }

    94% {
      right: 0;
      transform: rotate(0);
    }

    100% {
      right: -296px;
      transform: rotate(45deg);
    }
  }
</style>
