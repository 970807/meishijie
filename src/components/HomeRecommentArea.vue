<template>
  <div class="home-recomment-area">
    <div class="list-wrap" v-for="item in recommentList" :key="item.id">
      <div class="title">{{ item.columnTitle }}</div>
      <div class="list">
        <router-link
          class="item"
          :to="{ path: `/recipe-detail/${item2.id}` }"
          v-for="item2 in item.list"
          :key="item2.id"
        >
          <div
            class="cover"
            :style="{ backgroundImage: `url(${item2.coverUrl})` }"
          >
            <i class="video-icon" v-if="item2.isVideo"></i>
            <div class="author-info">
              <div
                class="author-avatar"
                :style="{ backgroundImage: `url(${item2.authorAvatar})` }"
              ></div>
              <strong class="author-name ellipsis-l1">{{
                item2.authorName
              }}</strong>
            </div>
          </div>
          <div class="info">
            <strong class="t ellipsis-l1">{{ item2.recipeName }}</strong>
            <span class="ingredient ellipsis-l1">{{
              item2.ingredientStr
            }}</span>
          </div>
        </router-link>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { IRecommentItem } from '../types/home'

interface IProps {
  recommentList?: IRecommentItem[]
}

withDefaults(defineProps<IProps>(), {
  recommentList: () => []
})
</script>

<style lang="scss" scoped>
.home-recomment-area {
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
        transition: all ease 0.3s;

        &:hover {
          box-shadow: 0px 4px 12px rgb(0 0 0 /10%);
        }

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
            background: rgba(0, 0, 0, 0.5);
            display: flex;
            align-items: center;
            padding: 0 20px;
            box-sizing: border-box;
            transition: bottom ease 0.3s;

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

          .ingredient {
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
</style>
