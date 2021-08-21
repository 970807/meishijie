<template>
  <div class="category-menu">
    <dl>
      <dt>
        <span>热门标签</span>
        <i class="icon icon-01"></i>
      </dt>
      <dd>
        <a v-for="item in list.hotLabel"
           :key="item.id">
          <span :class="{ active: item.isActive }">{{item.title}}</span>
        </a>
      </dd>
    </dl>
    <dl>
      <dt>
        <span>三餐</span>
        <i class="icon icon-02"></i>
      </dt>
      <dd>
        <a v-for="item in list.threeMeals"
           :key="item.id">
          <span :class="{ active: item.isActive }">{{item.title}}</span>
        </a>
      </dd>
    </dl>
    <dl>
      <dt>
        <span>小吃</span>
        <i class="icon icon-03"></i>
      </dt>
      <dd>
        <a v-for="item in list.snack"
           :key="item.id">
          <span :class="{ active: item.isActive }">{{item.title}}</span>
        </a>
      </dd>
    </dl>
    <dl>
      <dt>
        <span>外国菜谱</span>
        <i class="icon icon-04"></i>
      </dt>
      <dd>
        <a v-for="item in list.foreignMenu"
           :key="item.id">
          <span :class="{ active: item.isActive }">{{item.title}}</span>
        </a>
      </dd>
    </dl>
    <dl>
      <dt>
        <span>人群</span>
        <i class="icon icon-05"></i>
      </dt>
      <dd>
        <a v-for="item in list.crowd"
           :key="item.id">
          <span :class="{ active: item.isActive }">{{item.title}}</span>
        </a>
      </dd>
    </dl>
    <dl>
      <dt>
        <span>烘焙</span>
        <i class="icon icon-06"></i>
      </dt>
      <dd>
        <a v-for="item in list.baking"
           :key="item.id">
          <span :class="{ active: item.isActive }">{{item.title}}</span>
        </a>
      </dd>
    </dl>
    <dl>
      <dt>
        <span>中华菜系</span>
        <i class="icon icon-07"></i>
      </dt>
      <dd>
        <a v-for="item in list.cookingStyle"
           :key="item.id">
          <span :class="{ active: item.isActive }">{{item.title}}</span>
        </a>
      </dd>
    </dl>
  </div>
</template>

<script setup>
import { reactive } from 'vue'
const list = reactive(require('@/assets/data/categoryList.json'))
</script>

<style lang="scss" scoped>
  .category-menu {
    display: none;
    position: absolute;
    top: 80px;
    left: 0;
    width: 100%;
    background: #fff;
    border-bottom-left-radius: 12px;
    border-bottom-right-radius: 12px;
    box-shadow: 0px 12px 12px rgb(0 0 0 / 10%);

    dl {
      display: inline-block;
      padding: 20px 0 24px 20px;
      cursor: default;
      vertical-align: top;

      &:nth-child(1) {
        width: 340px;
      }

      &:nth-child(2),
      &:nth-child(3),
      &:nth-child(5),
      &:nth-child(6) {
        width: 89px;
      }

      &:nth-child(4),
      &:nth-child(7) {
        width: 176px;
      }

      &:nth-child(7) {
        dd {
          border-right: none;
        }
      }

      dt {
        color: #222;
        font-size: 18px;
        font-weight: 600;
        line-height: 20px;
        margin-bottom: 10px;
        padding: 0 8px;
        transition: color ease .15s;
        cursor: pointer;

        &:hover {
          color: #f64d36;
        }
      }

      dd {
        border-right: 1px dashed #eee;

        a {
          display: inline-block;
          width: 72px;
          height: 24px;
          line-height: 24px;
          margin: 5px 12px 5px 0;

          span {
            display: inline-block;
            height: 24px;
            line-height: 24px;
            color: #999;
            font-size: 14px;
            font-weight: 400;
            padding: 0 8px;
            border-radius: 4px;
            cursor: pointer;

            &:hover {
              color: #f64d36;
              background: rgba(246, 77, 54, .15);
            }

            &.active {
              color: #f64d36;
              font-weight: 600;
            }
          }
        }
      }
    }
  }

  .icon {
    display: inline-block;
    width: 22px;
    height: 22px;
    background: url(../assets/images/sprite_02.png) no-repeat;
    background-size: 22px 154px;
    vertical-align: top;
    margin-left: 2px;
  }

  .icon-01 {
    background-position: 0px 0px;
  }

  .icon-02 {
    background-position: 0px -22px;
  }

  .icon-03 {
    background-position: 0px -44px;
  }

  .icon-04 {
    background-position: 0px -66px;
  }

  .icon-05 {
    background-position: 0px -88px;
  }

  .icon-06 {
    background-position: 0px -110px;
  }

  .icon-07 {
    background-position: 0px -132px;
  }
</style>
