<!-- 食材标签列表 -->
<template>
  <!-- pc端食材标签列表 -->
  <span
    v-if="pcDevice && ingredientStr"
    class="ingredient-tags__pc ellipsis-l1"
    >{{ ingredientStr }}</span
  >
  <!-- 移动端食材标签列表 -->
  <div
    v-if="!pcDevice && ingredientStr"
    class="ingredient-tags__app"
    ref="ingredientTagsRef"
  >
    <span class="ingredient" v-for="ingredient of ingredientStr.split(',')">{{
      ingredient
    }}</span>
    <!-- 省略号 -->
    <div class="icon-ellipsis" ref="iconEllipsisRef">
      <object
        width="16"
        height="16"
        :data="EllipsisIcon"
        type="image/svg+xml"
      />
    </div>
  </div>
</template>

<script lang="ts" setup>
import { useDeviceStore } from '@/store/device'
import { ref, onMounted, onBeforeUnmount, nextTick } from 'vue'
import EllipsisIcon from '@/assets/images/ellipsis.svg'

const props = withDefaults(
  defineProps<{
    ingredientStr: string // 食材，多个用逗号分隔
    appMaxRow?: number // 移动端最多展示的标签行数
  }>(),
  {
    appMaxRow: 2,
  }
)

const ingredientTagsRef = ref<HTMLDivElement>()
const iconEllipsisRef = ref<HTMLDivElement>()

const pcDevice = useDeviceStore().pcDevice

/**
 * 处理移动端食材标签的布局：
 *  最多显示props.appMaxRow行，如果超出行数，后面的标签隐藏掉，并且在最后一行末尾显示省略号图标
 */
const handleAppTagsLayout = async () => {
  // 允许offsetTop的误差值
  const ARROW_ERROR_VALUE = 2
  if (pcDevice) return
  if (props.appMaxRow === 0) {
    // 0代表不限制标签行数
    return
  }
  if (!ingredientTagsRef.value || !iconEllipsisRef.value) return

  // 先隐藏容器元素
  ingredientTagsRef.value.style.opacity = '0'

  // nextTick等待渲染
  await nextTick()
  await nextTick()

  // 所有的标签项
  const tagEls = ingredientTagsRef.value.querySelectorAll(
    '.ingredient'
  ) as unknown as any[]

  // 存储每行的元素
  const rows = []
  // 存储当前行的元素
  let currentRow = []

  let lastOffsetTop = null
  // 第一遍：计算每行能容纳的元素
  for (const tagEl of tagEls) {
    const offsetTop = tagEl.offsetTop
    // 按 offsetTop 判断不同的行(遍历元素第一个offsetTop值就是第一行，出现第二个不同的offsetTop值就是第二行，以此类推)
    if (lastOffsetTop === null) {
      // 第一个元素
      currentRow.push(tagEl)
      lastOffsetTop = offsetTop
    } else if (Math.abs(offsetTop - lastOffsetTop) < ARROW_ERROR_VALUE) {
      // 同一行（允许ARROW_ERROR_VALUE的误差）
      currentRow.push(tagEl)
    } else {
      // 换行了
      rows.push(currentRow)
      currentRow = [tagEl]
      lastOffsetTop = offsetTop
    }
  }

  // 添加最后一行
  if (currentRow.length > 0) {
    rows.push(currentRow)
  }

  // 可见的行
  const visibleRows = rows.slice(0, props.appMaxRow)
  // 先显示可见行
  for (const row of visibleRows) {
    for (const userEl of row) {
      userEl.style.display = 'flex'
    }
  }

  if (rows.length > props.appMaxRow) {
    // 超出最大行数
    // 1、显示省略号图标
    iconEllipsisRef.value.style.display = 'flex'

    // 2、隐藏多余的行
    const hiddenRows = rows.slice(props.appMaxRow)
    for (const row of hiddenRows) {
      for (const userEl of row) {
        userEl.style.display = 'none'
      }
    }

    // 等待渲染
    await nextTick()

    // 可见的最后一行
    const lastVisibleRow = visibleRows[visibleRows.length - 1]

    // 获取当前可见rows的最后一行的offsetTop
    const lastRowOffsetTop = lastVisibleRow[0].offsetTop

    // 获取省略号的offsetTop
    const ellipsisOffsetTop = iconEllipsisRef.value.offsetTop

    // 3、判断省略号是否和最后一行在同一行
    if (Math.abs(ellipsisOffsetTop - lastRowOffsetTop) > ARROW_ERROR_VALUE) {
      // 省略号被挤到下一行了，需要隐藏最后一行的一些元素腾出空间
      while (lastVisibleRow.length) {
        // 隐藏最后一个元素
        const lastEl = lastVisibleRow.pop()
        lastEl.style.display = 'none'

        // 等待渲染
        await nextTick()

        // 重新检查省略号位置
        const newEllipsisOffsetTop = iconEllipsisRef.value.offsetTop

        // 如果省略号回到最后一行，停止删除
        if (
          Math.abs(newEllipsisOffsetTop - lastRowOffsetTop) <= ARROW_ERROR_VALUE
        ) {
          break
        }

        if (lastVisibleRow.length === 0) {
          // 最后一行已经没有元素了，停止删除
          break
        }
      }
    }
  } else {
    // 没有超出最大行数
    // 这时不用展示省略号图标
    iconEllipsisRef.value.style.display = 'none'
  }

  // 处理完成，显示容器元素
  ingredientTagsRef.value.style.opacity = '1'
}

// 防抖定时器
let resizeTimer: number | null = null
/**
 * 窗口大小变化的防抖处理函数
 */
const handleResize = () => {
  if (resizeTimer !== null) {
    clearTimeout(resizeTimer)
  }
  resizeTimer = window.setTimeout(() => {
    handleAppTagsLayout()
  }, 300) // 300ms 防抖延迟
}

onMounted(() => {
  // 处理标签项布局
  handleAppTagsLayout()

  // 监听窗口大小变化
  window.addEventListener('resize', handleResize)
})

onBeforeUnmount(() => {
  // 清除定时器
  if (resizeTimer !== null) {
    clearTimeout(resizeTimer)
  }
  // 移除事件监听
  window.removeEventListener('resize', handleResize)
})
</script>

<style lang="scss" scoped>
.ingredient-tags__pc {
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

.ingredient-tags__app {
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

  .icon-ellipsis {
    font-size: 0;
    padding: 4px 8px;
    background: #f3f4f6;
    border-radius: 999px;
  }
}
</style>
