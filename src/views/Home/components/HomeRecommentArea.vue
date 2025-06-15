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
            <template v-if="pcDevice">
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
            </template>
            <template v-else>
              <div class="icon-play" v-if="item2.isVideo">
                <object
                  width="32"
                  height="32"
                  :data="PlayIcon"
                  type="image/svg+xml"
                />
              </div>
            </template>
          </div>
          <div class="info" v-if="pcDevice">
            <strong class="t ellipsis-l1">{{ item2.recipeName }}</strong>
            <span class="ingredient ellipsis-l1">{{
              item2.ingredientStr
            }}</span>
          </div>
          <div class="info" v-if="!pcDevice">
            <strong class="t">{{ item2.recipeName }}</strong>
            <div class="ingredient-list" v-if="item2.ingredientStr">
              <span
                class="ingredient"
                v-for="ingredient of item2.ingredientStr.split(',')"
                >{{ ingredient }}</span
              >
            </div>
          </div>
        </router-link>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { IRecommentItem } from '../types'
import { useDeviceStore } from '@/store/device'
import PlayIcon from '@/assets/images/play.svg'

const pcDevice = useDeviceStore().pcDevice

interface IProps {
  recommentList?: IRecommentItem[] // 推荐列表
}

withDefaults(defineProps<IProps>(), {
  recommentList: () => [],
})
</script>

<style lang="scss" scoped>
.home-recomment-area {
  @include pc {
    width: $pc-min-width;
    margin: 0 auto;
  }

  .list-wrap {
    margin-top: 20px;

    .title {
      @include pc {
        color: #222;
        font-size: 24px;
        font-weight: 600;
        padding: 20px 0;
      }

      @include mobile {
        color: #000;
        font-size: 24px;
        padding: 0 16px;
      }
    }

    .list {
      margin-top: 16px;

      .item {
        @include pc {
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
              background: url(@/assets/images/sprite_04.png) 0px 0px no-repeat;
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
                background: url(@/assets/images/sprite_01.png) 0px -60px no-repeat;
                background-size: 30px 150px;
              }
            }
          }
        }

        @include mobile {
          display: flex;
          padding: 0 16px;

          &:nth-child(n + 2) {
            margin-top: 22px;
          }

          .cover {
            position: relative;
            flex-shrink: 0;
            width: 120px;
            height: 120px;
            background-size: cover;
            border-radius: 12px;

            .icon-play {
              position: absolute;
              top: 4px;
              right: 4px;
            }
          }

          .info {
            margin-left: 16px;
            display: flex;
            flex-direction: column;
            .t {
              color: #000;
              font-size: 18px;
              line-height: 24px;
              display: -webkit-box;
              -webkit-box-orient: vertical;
              -webkit-line-clamp: 2;
              overflow: hidden;
            }

            .ingredient-list {
              margin-top: 8px;
              display: flex;
              flex-wrap: wrap;
              gap: 8px;
              .ingredient {
                color: #4b5563;
                font-size: 14px;
                padding: 4px 8px;
                background: #f3f4f6;
                border-radius: 999px;
              }
            }
          }
        }
      }
    }
  }
}
</style>
