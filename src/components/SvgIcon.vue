<template>
  <svg :class="className" :style="computedStyle" aria-hidden="true">
    <use :xlink:href="symbolId" />
  </svg>
</template>

<script lang="ts" setup>
import { computed } from 'vue'

const props = defineProps({
  // 图标名称（对应 SVG 文件名，不包含扩展名）
  name: {
    type: String,
    required: true,
  },
  // 图标尺寸，支持数字（像素）或字符串（如‘24px’，'2em'）
  size: {
    type: [Number, String],
    default: 16,
  },
  // 图标颜色，支持所有 CSS 颜色值
  color: {
    type: String,
    default: 'currentColor', // 默认继承父元素颜色，方便主题切换
  },
  // 自定义 CSS 类名，用于外部样式覆盖
  className: {
    type: String,
    default: '',
  },
  // 图标旋转角度
  rotate: {
    type: Number,
    default: 0,
  },
})

// 计算属性：生成 symbol 的 ID
// 格式必须与 vite-plugin-svg-icons 配置的 symbolId 匹配
const symbolId = computed(() => {
  // 默认格式：'#icon-' + 图标名称
  // 如果修改了 vite 配置中的 symbolId，这里需要同步修改
  return `#icon-${props.name}`
})

// 计算属性：生成动态样式
const computedStyle = computed(() => {
  const style = {
    // 设置宽度
    width: typeof props.size === 'number' ? `${props.size}px` : props.size,
    // 设置高度
    height: typeof props.size === 'number' ? `${props.size}px` : props.size,
    // 设置颜色
    color: props.color,
    // 设置 display 为 inline-block，确保图标正确对齐
    display: 'inline-block',
    // 设置垂直对齐方式
    // verticalAlign: 'middle',
  } as any

  // 如果有旋转角度，添加旋转样式
  if (props.rotate !== 0) {
    style.transform = `rotate(${props.rotate}deg)`
    style.transformOrigin = 'center'
  }

  return style
})
</script>
