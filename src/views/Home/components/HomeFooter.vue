<template>
  <footer>
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

      <a
        class="beian"
        style="margin-right: 20px"
        href="https://beian.miit.gov.cn/"
        >桂ICP备20006161号-2</a
      >
      <!-- <img src="https://st-cn.meishij.net/p2/20180208/20180208111357_93713.png" /> -->
      <!-- <p>京公网安备11010802026928</p> -->
      <p>© 2009-2019 Aliyun.com 版权所有。</p>
    </div>
  </footer>
</template>

<style lang="scss" scoped>
footer {
  width: 100%;
  background: rgba(11, 11, 10, 0.9);
  padding-top: 40px;
  margin-right: 40px;

  .top {
    width: 1200px;
    margin: 0 auto;

    .left-logo {
      display: inline-block;
      width: 600px;
      height: 180px;
      background: url(@/assets/images/logo_02.png) left center no-repeat;
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
        background: rgba(255, 255, 255, 0.1);
        border-radius: 4px;

        .icon {
          position: absolute;
          left: 35px;
          top: 15px;
          width: 50px;
          height: 50px;
          background: url(@/assets/images/sprite_05.png) no-repeat;
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
            color: rgba(255, 255, 255, 0.5);
            line-height: 22px;
          }
        }
      }
    }
  }

  .bottom {
    width: 1200px;
    height: 120px;
    margin: 50px auto 0;
    text-align: center;

    ul {
      margin-bottom: 20px;

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

    p,
    a {
      display: inline-block;
      color: #999;
      font-size: 12px;
      line-height: 30px;
    }
  }
}
</style>
