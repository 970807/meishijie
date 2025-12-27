<template>
  <div class="search-result">
    <!-- pc端头部 -->
    <HeaderNav v-if="pcDevice" />
    <!-- 移动端页面标题 -->
    <AppHead
      v-if="!pcDevice"
      :title="searchKey ? `&quot;${searchKey}&quot;的搜索结果` : '搜索结果'"
    />
    <div class="inner-box">
      <template v-if="loading">
        <div class="loading-wrap">
          <Loading />
        </div>
      </template>
      <template v-else-if="errMsg">
        <p class="error-msg">{{ errMsg }}</p>
      </template>
      <template v-else>
        <div v-if="pcDevice" class="search-title">
          <span v-if="searchKey">"{{ searchKey }}"的搜索结果</span>
          <span v-else>搜索结果</span>
        </div>
        <div class="recipe-list" v-if="searchList.length">
          <router-link
            class="item"
            :to="{ path: `/recipe-detail/${item.id}` }"
            v-for="item in searchList"
            :key="item.id"
          >
            <div
              class="cover"
              :style="{ backgroundImage: `url(${item.coverUrl})` }"
            >
              <template v-if="pcDevice">
                <i class="video-icon" v-if="item.isVideo"></i>
                <div class="author-info">
                  <div
                    class="author-avatar"
                    :style="{ backgroundImage: `url(${item.authorAvatar})` }"
                  ></div>
                  <strong class="author-name ellipsis-l1">{{
                    item.authorName
                  }}</strong>
                </div>
              </template>
              <template v-else>
                <div class="icon-play" v-if="item.isVideo">
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
              <strong class="t ellipsis-l1">{{ item.recipeName }}</strong>
              <IngredientTags :ingredientStr="item.ingredientStr" />
            </div>
            <div class="info" v-if="!pcDevice">
              <strong class="t">{{ item.recipeName }}</strong>
              <IngredientTags :ingredientStr="item.ingredientStr" />
            </div>
          </router-link>
        </div>
        <div class="empty" v-else>
          <img src="@/assets/images/search-empty.png" />
          <p>没找到您想要的美食</p>
          <p>换个关键词试试，美食总会等着你～</p>
        </div>
      </template>
    </div>
  </div>
</template>

<script setup lang="ts">
import { reactive, toRefs, watch } from 'vue'
import { useRoute } from 'vue-router'
import Loading from '@/components/Loading.vue'
import HeaderNav from '@/components/HeaderNav/index.vue'
import AppHead from '@/components/AppHead.vue'
import IngredientTags from '@/components/IngredientTags.vue'
import { useDeviceStore } from '@/store/device'
import { searchReipce } from '@/service/recipe'
import PlayIcon from '@/assets/images/play.svg'

const route = useRoute()

const pcDevice = useDeviceStore().pcDevice

const state = reactive<{
  loading: boolean // 加载中
  searchKey: string // 搜索关键词
  searchList: any[] // 搜索结果
  errMsg: string // 接口错误信息
}>({
  loading: false,
  searchKey: '',
  searchList: [],
  errMsg: '',
})
const { loading, searchKey, searchList, errMsg } = toRefs(state)

// 搜索菜谱
const handleSearch = async () => {
  try {
    loading.value = true
    const { data } = await searchReipce<any[]>({
      searchKey: searchKey.value,
    })
    searchList.value = data
    errMsg.value = ''
    loading.value = false
  } catch (err) {
    // 类型断言为 Error 对象
    const error = err as Error
    errMsg.value = error.message
    loading.value = false
  }
}

watch(
  () => route.query.q,
  (val) => {
    searchKey.value = val as string
    handleSearch()
  },
  {
    immediate: true,
  }
)
</script>

<style lang="scss" scoped>
.search-result {
  @include mobile {
    padding-top: $app-head-height;
    padding: {
      left: 20px;
      right: 20px;
    }
  }
  .inner-box {
    margin: 0 auto;
    padding: 14px 0 40px;

    @include pc {
      width: $pc-min-width;
    }

    .error-msg {
      position: fixed;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      color: #222;
      font-size: 24px;
      font-weight: 600;
      margin: 0;
      text-align: center;
    }

    .search-title {
      margin: 0;
      padding: 20px 0;

      span {
        color: #222;
        font-size: 24px;
        font-weight: 600;
      }
    }

    .recipe-list {
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
          }
        }
      }
    }

    .loading-wrap {
      position: fixed;
      left: 50%;
      top: 50%;
      transform: translate(-50%, -50%);
    }

    .empty {
      margin-top: 30px;
      display: flex;
      flex-direction: column;
      align-items: center;

      > img {
        width: 220px;
        pointer-events: none;
      }

      > p {
        margin: 0;

        &:nth-of-type(1) {
          margin-top: 32px;
          color: #333;
          font-size: 22px;
        }

        &:nth-of-type(2) {
          margin-top: 14px;
          color: #777;
          font-size: 15px;
        }
      }
    }
  }
}
</style>
