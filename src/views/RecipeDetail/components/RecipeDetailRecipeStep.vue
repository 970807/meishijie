<template>
  <h2 class="title">{{ recipeName }}的做法</h2>
  <div class="recipe-step-box">
    <div class="recipe-step" v-for="(item, index) in stepList" :key="index">
      <div class="step-num">
        <strong>步骤</strong>
        <em>step</em>
        <p>{{ index + 1 }}</p>
      </div>
      <div class="step-content">
        <img v-if="item.img" :src="item.img" :title="item.content" />
        <p v-if="item.content">{{ item.content }}</p>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import type { IStepListItem } from '../types'

defineProps<{
  recipeName: string // 菜谱名称
  stepList: IStepListItem[] // 菜谱步骤列表
}>()
</script>

<style lang="scss" scoped>
h2.title {
  width: 900px;
  height: 32px;
  line-height: 32px;
  margin: 20px auto 0;
  padding: 20px 0;
  color: #222;
  font-size: 24px;
  font-weight: 600;
}

.recipe-step-box {
  width: 900px;
  margin: 0 auto;
  background: #fff;
  border-radius: 12px;

  .recipe-step {
    position: relative;
    padding: 24px 24px 4px 134px;
    min-height: 128px;

    .step-num {
      position: absolute;
      top: 24px;
      left: 24px;
      width: 86px;
      height: 128px;
      text-align: right;
      color: #000;
      font-weight: 600;
      background: #ffe851;
      border-radius: 16px;
      border-bottom-right-radius: 2px;
      padding-right: 20px;
      box-sizing: border-box;

      strong {
        display: block;
        font-size: 20px;
        line-height: 22px;
        margin-top: 17px;
      }

      em {
        display: block;
        font-size: 12px;
        line-height: 14px;
      }

      p {
        display: block;
        font-size: 36px;
        line-height: 70px;
      }
    }

    .step-content {
      img {
        display: block;
        width: 100%;
        border-radius: 4px;
        margin-bottom: 15px;
      }

      p {
        font-size: 18px;
        color: #222;
        line-height: 28px;
        font-weight: 600;
        padding: 2px 0 10px 0;

        &:first-child {
          // 没有图片时，给一点上边距
          margin-top: 10px;
        }
      }
    }
  }
}
</style>
