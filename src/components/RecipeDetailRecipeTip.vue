<template>
  <h2 class="title">酸辣土豆丝的烹饪技巧</h2>
  <div class="recipe-tip">
    <div class="title">
      <strong>技巧</strong>
      <em>tips</em>
    </div>
    <div class="tips-words">
      <p>
        1.将土豆丝浸入到清水中，是为了避免土豆变色，影响菜品的外观；香醋不能提前太长时间放入，否则香气会被加热至挥发殆尽，影响菜品风味。
        <br>
        2.在炒土豆丝的过程中，加入家乐鸡精，最好在临出锅前加进去，起到提鲜的作用，带来可口的滋味。
        <br>
      </p>
    </div>
  </div>
</template>

<style lang="scss" scoped>
  h2.title {
    width: 900px;
    height: 32px;
    line-height: 32px;
    margin: 20px auto 0;
    padding: 20px 0;
    font-size: 24px;
    color: #222;
    font-weight: 600;
  }

  .recipe-tip {
    position: relative;
    width: 900px;
    border-radius: 12px;
    padding: 24px 24px 24px 134px;
    min-height: 70px;
    margin: 0 auto;
    background: #fff;
    box-sizing: border-box;

    .title {
      position: absolute;
      left: 24px;
      top: 24px;
      width: 86px;
      height: 70px;
      background: #ffe851;
      border-radius: 16px;
      border-bottom-right-radius: 2px;

      strong {
        display: block;
        font-size: 20px;
        text-align: right;
        color: #000;
        font-weight: 600;
        line-height: 22px;
        margin-top: 17px;
        padding-right: 20px;
      }

      em {
        display: block;
        font-size: 12px;
        text-align: right;
        color: #000;
        font-weight: 600;
        line-height: 14px;
        padding-right: 20px;
      }
    }

    .tips-words {
      p {
        font-size: 18px;
        line-height: 27px;
        color: #666;
        font-weight: 400;
      }
    }
  }
</style>
