import { defineConfig } from 'vite'
import { resolve } from 'path'
import vue from '@vitejs/plugin-vue'
import { createSvgIconsPlugin } from 'vite-plugin-svg-icons'
import path from 'path'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [
    vue(),
    // 配置 SVG 图标插件
    createSvgIconsPlugin({
      // 指定需要缓存的图标文件夹（必填）
      iconDirs: [
        path.resolve(process.cwd(), 'src/assets/icons'), // 图标目录
      ],
      /**
       * 指定 symbolId格式（必填）
       * [name] 会被替换为文件名（不包含扩展名）
       * [dir] 会被替换为目录名（相对 iconDirs 的路径）
       */
      symbolId: 'icon-[name]',
      /**
       * 控制SVG图标雪碧图（即生成的DOM容器）在页面中的插入位置
       * body-last（默认）：将SVG符号定义注入到页面body元素到末尾，这是最常用的设置，适用于大多数场景。
       * body-first：将雪碧图插入到body元素的开头，可能影响CSS样式的优先级。
       * Function：允许自定义插入逻辑，例如基于CSS选择器定位特定位置
       */
      inject: 'body-last',
      // 自定义 DOM 元素的 ID（可选）
      // customDomId: '__svg_icons__dom__',

      // SVG 压缩配置（可选）
    }),
  ],
  server: {
    open: true,
    proxy: {
      '/api': {
        target: 'http://localhost:3000',
        changeOrigin: true,
        rewrite: (path) => path.replace(/^\/api/, ''),
      },
    },
  },
  resolve: {
    alias: {
      '@': resolve(__dirname, 'src'), // 路径别名
    },
    extensions: ['.js', '.json', '.ts'], // 使用路径别名时想要省略的后缀名
  },
  css: {
    preprocessorOptions: {
      scss: {
        additionalData: `@import "@/styles/variable.scss";@import "@/styles/common.scss";`,
      },
    },
  },
})
