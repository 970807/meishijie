<template>
  <h2 class="title">酸辣土豆丝的做法</h2>
  <div class="recipe-step-box">
    <div
      class="recipe-step"
      v-for="(item, index) in stepArr"
      :key="item.id"
    >
      <div class="step-num">
        <strong>步骤</strong>
        <em>step</em>
        <p>{{index+1}}</p>
      </div>
      <div class="step-content">
        <img
          v-if="item.stepImg"
          :src="item.stepImg"
          title="酸辣土豆丝的做法"
        />
        <p v-if="item.stepContent">{{item.stepContent}}</p>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent, reactive } from 'vue'

export default defineComponent({
  setup() {
    const stepArr = reactive([
      {
        id: 0,
        stepImg: 'https://st-cn.meishij.net/rs/222/140/4535222/n4535222_143798048317836.jpg',
        stepContent: '全部食材'
      },
      {
        id: 1,
        stepImg: 'https://st-cn.meishij.net/rs/222/140/4535222/n4535222_143798045119295.jpg',
        stepContent: '将土豆洗净去皮后切成细丝'
      },
      {
        id: 2,
        stepImg: 'https://st-cn.meishij.net/rs/222/140/4535222/n4535222_143798045354615.jpg',
        stepContent: '将切好的土豆丝放入清水中，漂洗3次左右，去掉多余的淀粉'
      },
      {
        id: 3,
        stepImg: 'https://st-cn.meishij.net/rs/222/140/4535222/n4535222_143798045542664.jpg',
        stepContent: '干红辣椒洗净，切成丝'
      },
      {
        id: 4,
        stepImg: 'https://st-cn.meishij.net/rs/222/140/4535222/n4535222_143798045729396.jpg',
        stepContent: '锅中放油烧至五成热，将蒜末、干红辣椒丝倒入爆香'
      },
      {
        id: 5,
        stepImg: 'https://st-cn.meishij.net/rs/222/140/4535222/n4535222_143798045921717.jpg',
        stepContent: '然后将土豆丝沥干水分，放入一同翻炒3分钟左右至熟'
      },
      {
        id: 6,
        stepContent: '最后加入盐、家乐鸡精、香醋翻炒均匀，最后撒上葱末即可。鸡精的加入，能极大地提升菜品的鲜美口味，令人食欲大开'
      }
    ])

    return {
      stepArr
    }
  }
})
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
        }
      }
    }
  }
</style>
