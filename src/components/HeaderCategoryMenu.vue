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
const list = {
  hotLabel: [
    {
      id: '0',
      title: '视频菜谱',
      isHot: true,
      isActive: false
    },
    {
      id: '1',
      title: '家常菜',
      isHot: false,
      isActive: false
    },
    {
      id: '2',
      title: '下饭菜',
      isHot: false,
      isActive: false
    },
    {
      id: '3',
      title: '凉菜',
      isHot: false,
      isActive: false
    },
    {
      id: '4',
      title: '海鲜',
      isHot: false,
      isActive: false
    },
    {
      id: '5',
      title: '热菜',
      isHot: false,
      isActive: false
    },
    {
      id: '6',
      title: '汤粥',
      isHot: false,
      isActive: false
    },
    {
      id: '7',
      title: '素食',
      isHot: false,
      isActive: false
    },
    {
      id: '8',
      title: '浆料蘸料',
      isHot: false,
      isActive: false
    },
    {
      id: '9',
      title: '微波炉',
      isHot: false,
      isActive: false
    },
    {
      id: '10',
      title: '火锅底料',
      isHot: false,
      isActive: true
    },
    {
      id: '11',
      title: '方便面',
      isHot: false,
      isActive: false
    },
    {
      id: '12',
      title: '糕点主食',
      isHot: false,
      isActive: false
    },
    {
      id: '13',
      title: '干果',
      isHot: false,
      isActive: false
    },
    {
      id: '14',
      title: '卤味',
      isHot: false,
      isActive: false
    },
    {
      id: '15',
      title: '饮品',
      isHot: false,
      isActive: false
    }
  ],
  threeMeals: [
    {
      id: '0',
      title: '早餐',
      isHot: false,
      isActive: true
    },
    {
      id: '1',
      title: '午餐',
      isHot: false,
      isActive: false
    },
    {
      id: '2',
      title: '晚餐',
      isHot: false,
      isActive: false
    },
    {
      id: '3',
      title: '下午茶',
      isHot: false,
      isActive: false
    },
    {
      id: '4',
      title: '夜宵',
      isHot: false,
      isActive: false
    }
  ],
  snack: [
    {
      id: '0',
      title: '四川小吃',
      isHot: false,
      isActive: false
    },
    {
      id: '1',
      title: '广东小吃',
      isHot: false,
      isActive: false
    },
    {
      id: '2',
      title: '北京小吃',
      isHot: false,
      isActive: false
    },
    {
      id: '3',
      title: '陕西小吃',
      isHot: false,
      isActive: false
    },
    {
      id: '4',
      title: '山东小吃',
      isHot: false,
      isActive: false
    }
  ],
  foreignMenu: [
    {
      id: '0',
      title: '法国菜',
      isHot: false,
      isActive: false
    },
    {
      id: '1',
      title: '西餐面点',
      isHot: false,
      isActive: false
    },
    {
      id: '2',
      title: '餐前小吃',
      isHot: false,
      isActive: true
    },
    {
      id: '3',
      title: '主菜',
      isHot: false,
      isActive: false
    },
    {
      id: '4',
      title: '甜点',
      isHot: false,
      isActive: false
    },
    {
      id: '5',
      title: '日本料理',
      isHot: false,
      isActive: false
    },
    {
      id: '6',
      title: '韩国料理',
      isHot: false,
      isActive: false
    },
    {
      id: '7',
      title: '主食',
      isHot: false,
      isActive: false
    },
    {
      id: '8',
      title: '饮品',
      isHot: false,
      isActive: false
    }
  ],
  crowd: [
    {
      id: '0',
      title: '孕妇',
      isHot: false,
      isActive: true
    },
    {
      id: '1',
      title: '产妇',
      isHot: false,
      isActive: false
    },
    {
      id: '2',
      title: '幼儿辅食',
      isHot: false,
      isActive: true
    },
    {
      id: '3',
      title: '老年人',
      isHot: false,
      isActive: false
    }
  ],
  baking: [
    {
      id: '0',
      title: '蛋糕面包',
      isHot: false,
      isActive: false
    },
    {
      id: '1',
      title: '饼干配方',
      isHot: false,
      isActive: false
    },
    {
      id: '2',
      title: '甜品点心',
      isHot: false,
      isActive: false
    }
  ],
  cookingStyle: [
    {
      id: '0',
      title: '川菜',
      isHot: false,
      isActive: false
    },
    {
      id: '1',
      title: '湘菜',
      isHot: false,
      isActive: false
    },
    {
      id: '2',
      title: '粤菜',
      isHot: false,
      isActive: false
    },
    {
      id: '3',
      title: '京菜',
      isHot: false,
      isActive: false
    },
    {
      id: '4',
      title: '东北菜',
      isHot: false,
      isActive: false
    },
    {
      id: '5',
      title: '鲁菜',
      isHot: false,
      isActive: false
    },
    {
      id: '6',
      title: '浙菜',
      isHot: false,
      isActive: false
    }
  ]
}
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
