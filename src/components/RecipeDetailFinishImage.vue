<template>
  <h2 class="title">{{recipeName}}的成品图</h2>
  <div class="finish-image-box">
    <img :src="finishFoodImgList[0]">
  </div>
</template>

<script>
export default {
  props: {
    recipeName: String,
    finishFoodImgList: Array
  }
}
</script>

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

  .finish-image-box {
    width: 900px;
    margin: 0 auto;
    padding: 24px;
    background: #fff;
    border-radius: 12px;
    box-sizing: border-box;

    img {
      width: 100%;
    }
  }

</style>
