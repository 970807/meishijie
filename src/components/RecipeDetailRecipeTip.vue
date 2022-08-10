<template>
  <h2 class="title">{{ recipeName }}的烹饪技巧</h2>
  <div class="recipe-tip">
    <div class="title">
      <strong>技巧</strong>
      <em>tips</em>
    </div>
    <div class="tips-words">
      <p>{{ recipeTips }}</p>
    </div>
  </div>
</template>

<script setup lang="ts">
interface IProps {
  recipeName: string
  recipeTips: string
}

defineProps<IProps>()
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

.recipe-tip {
  position: relative;
  width: 900px;
  border-radius: 12px;
  padding: 24px 24px 24px 134px;
  min-height: 118px;
  margin: 0 auto 60px;
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
