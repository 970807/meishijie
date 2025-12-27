<template>
  <div class="mobile-search">
    <!-- 移动端页面标题 -->
    <AppHead v-if="!pcDevice" title="搜索" />
    <div class="search-input-wrap">
      <div class="icon-search">
        <SvgIcon name="search" color="#757575" :size="20" />
      </div>
      <input
        v-model="searchValue"
        type="text"
        placeholder="请输入菜谱名"
        @keyup.enter="goSearchResult(searchValue)"
      />
    </div>
    <!-- 热搜 -->
    <div class="hot-search-wrap">
      <div class="common-title">热搜</div>
      <ul class="common-list">
        <li
          class="list-item"
          v-for="(item, index) in hotSearchKeys"
          :key="index"
          @click="goSearchResult(item)"
        >
          <div class="icon-hot">
            <SvgIcon name="hot" color="#ff3f34" :size="16" />
          </div>
          <span>{{ item }}</span>
        </li>
      </ul>
    </div>
    <!-- 搜索历史 -->
    <div v-if="searchHistoryKeys.length" class="search-history-wrap">
      <div class="search-history-head">
        <div class="common-title">搜索历史</div>
        <div class="clear-btn" @click="handleClear">
          <div class="icon-clear">
            <SvgIcon name="delete" color="#757575" :size="16" />
          </div>
          <span>清空历史</span>
        </div>
      </div>
      <ul class="common-list">
        <li
          class="list-item"
          v-for="(item, index) of searchHistoryKeys"
          :key="index"
        >
          <span>{{ item }}</span>
        </li>
      </ul>
    </div>
  </div>
</template>

<script lang="ts" setup>
import { reactive, toRefs } from 'vue'
import AppHead from '@/components/AppHead.vue'
import { useDeviceStore } from '@/store/device'
import { useRouter } from 'vue-router'

const router = useRouter()
const pcDevice = useDeviceStore().pcDevice

const state = reactive<{
  searchValue: string // 搜索关键字
  hotSearchKeys: string[]
  searchHistoryKeys: string[]
}>({
  searchValue: '',
  hotSearchKeys: ['五花肉', '回锅肉', '榴莲炖鸡', '豆腐'],
  searchHistoryKeys: [],
})
const { searchValue, hotSearchKeys, searchHistoryKeys } = toRefs(state)

/**
 * 跳转搜索结果页
 * @param searchKey 搜索关键词
 */
const goSearchResult = (searchKey: string) => {
  // 保存关键词到搜索历史
  saveSearchHistory(searchKey)
  // 跳转页面
  router.push({ name: 'SearchResult', query: { q: searchKey } })
}

const SEARCH_HISTORY_LOCAL_KEY = 'searchHistory'
/**
 * 获取搜索历史
 */
const getSearchHistory = (): string[] => {
  const local = window.localStorage.getItem(SEARCH_HISTORY_LOCAL_KEY)
  if (!local) return []
  return JSON.parse(local)
}

/**
 * 保存搜索历史
 * @param searchKey 搜索关键词
 */
const saveSearchHistory = (searchKey: string) => {
  // 先获取搜索历史
  const list = getSearchHistory()
  // 如果搜索历史没有这个关键词，则添加
  const idx = list.indexOf(searchKey)
  if (idx === -1) {
    list.push(searchKey)
    // 保存到localStorage
    window.localStorage.setItem(SEARCH_HISTORY_LOCAL_KEY, JSON.stringify(list))
  }
}

/**
 * 清空搜索历史
 */
const handleClear = () => {
  const result = window.confirm('您确认清空搜索历史吗？')
  if (result) {
    // 用户点击了确定
    // 清空
    window.localStorage.removeItem(SEARCH_HISTORY_LOCAL_KEY)
    // 重置数据
    searchHistoryKeys.value = []
  } else {
    // 用户点击了取消
  }
}

// 获取搜索历史
searchHistoryKeys.value = getSearchHistory()
</script>

<style lang="scss" scoped>
.mobile-search {
  padding-top: $app-head-height;
  padding: {
    left: 20px;
    right: 20px;
  }

  .search-input-wrap {
    display: flex;
    align-items: center;
    height: 56px;
    padding: 0 15px;
    border: 1px solid #e5e7eb;
    background: #f5f5f5;
    border-radius: 20px;

    .icon-search {
      font-size: 0;
    }

    > input {
      margin-left: 15px;
      flex: 1;
      border: none;
      outline: none;
      background: transparent;
      color: #131418;
    }
  }

  .common-title {
    color: #333;
    font-size: 18px;
  }

  .common-list {
    margin-top: 20px;
    display: flex;
    flex-wrap: wrap;
    gap: 10px;

    .list-item {
      display: flex;
      align-items: center;
      height: 44px;
      padding: 0 20px;
      background: #f5f5f5;
      border-radius: 99px;
      overflow: hidden;
      cursor: pointer;

      > span {
        flex: 1;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;

        &:nth-child(n + 2) {
          margin-left: 10px;
        }
      }
    }
  }

  .hot-search-wrap {
    margin-top: 30px;

    .icon-hot {
      font-size: 0;
    }
  }

  .search-history-wrap {
    margin-top: 30px;

    .search-history-head {
      display: flex;
      justify-content: space-between;

      .clear-btn {
        display: flex;
        align-items: center;
        cursor: pointer;

        .icon-clear {
          font-size: 0;
        }

        > span {
          margin-left: 4px;
          color: #757575;
          font-size: 14px;
        }
      }
    }
  }
}
</style>
