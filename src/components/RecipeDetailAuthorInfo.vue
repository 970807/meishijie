<template>
  <div class="author-info">
    <div class="author">
      <div
        class="avatar"
        style="background: url('https://s1.st.meishij.net/user/222/140/t4535222_143693960773371.jpg')"
      ></div>
      <div class="info">
        <a href="https://i.meishi.cc/cook.php?id=4535222" target="_blank">家乐</a>
        <span>84菜谱&nbsp;&nbsp;5649粉丝</span>
      </div>
    </div>
    <i class="quote-icon"></i>
    <div class="author-words">
      <p>酸辣土豆丝，是一道普通又经典的家常菜，是每个妈妈的必备技能和秘密武器。我家的晚饭，经常有这道菜，每次都很受欢迎。就算材料廉价，做法简单，我依然十分爱它。酸辣的滋味，能让胃口变得特别好，也超级下饭。我还知道能让它变得更好吃的秘密，已经迫不及待想要告诉身边的人了。</p>
    </div>
  </div>
</template>

<style lang="scss" scoped>
  .author-info {
    position: relative;
    width: 900px;
    margin: 0 auto;
    background: #fff;
    border-radius: 12px;
    padding: 4px 0 24px;

    .author {
      margin: 20px 24px 0;
      position: relative;

      .avatar {
        position: absolute;
        left: 0;
        right: 0;
        width: 60px;
        height: 60px;
        border-radius: 30px;
      }

      .info {
        height: 60px;
        padding-left: 80px;

        a {
          display: block;
          height: 32px;
          line-height: 32px;
          font-size: 18px;
          color: #222;
          font-weight: 600;
          margin-top: 2px;

          &:hover {
            color: #f64d36;
          }
        }

        span {
          display: block;
          height: 24px;
          line-height: 24px;
          font-size: 15px;
          color: #999;
        }
      }
    }

    .quote-icon {
      position: absolute;
      right: 25px;
      top: 25px;
      width: 28px;
      height: 20px;
      background: url(../assets/images/sprite_01.png) 0px 0px no-repeat;
      background-size: 30px 150px;
    }

    .author-words {
      p {
        font-size: 16px;
        color: #666;
        line-height: 24px;
        padding: 20px 24px 0;
      }
    }
  }
</style>
