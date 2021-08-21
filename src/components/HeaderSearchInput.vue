<template>
  <div class="search-box"
       :style="{'--extra-width': extraWidth}">
    <input
      type="text"
      :placeholder="placeholderText"
      class="input"
      v-model="searchValue"
      @focus="onFocus"
      @blur="onBlur"
      @keyup.enter="onSearch"
    />
    <a href="javascript:;" class="btn" @click="onSearch">搜索</a>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'
const searchValue = ref('')
const isFocus = ref(false)

function onFocus () {
  isFocus.value = true
}

function onBlur () {
  isFocus.value = false
}

function onSearch () {
  window.open(`https://so.meishi.cc/?q=${encodeURIComponent(searchValue.value)}`)
}

const extraWidth = computed(() => isFocus.value ? '70px' : '0px')
const placeholderText = computed(() => isFocus.value ? '' : '菜谱名、食材名')
</script>

<style lang="scss" scoped>
.search-box {
  position: relative;
  background: #fff;
  width: calc(222px + var(--extra-width));
  height: 44px;
  border-radius: 22px;
  overflow: hidden;
  transition: all ease .3s;

  .input {
    border: none;
    outline: none;
    width: calc(150px + var(--extra-width));
    height: 40px;
    margin-top: 2px;
    padding-left: 19px;
    font-size: 16px;
    color: #222;
    box-sizing: border-box;
  }

  .btn {
    position: absolute;
    top: 2px;
    right: 2px;
    width: 66px;
    height: 40px;
    line-height: 40px;
    border-radius: 20px;
    background: #f94751;
    text-align: center;
    color: #fff;
    font-weight: 600;

    &:hover {
      background: #eb4b34;
    }
  }
}
</style>
