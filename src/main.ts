import { createApp } from 'vue'
import App from './App.vue'
import router from '@/router'
import { createPinia } from 'pinia'
// 导入 SVG 图标插件生成的虚拟模块
// 这个 import 语句是必须的，它会让 vite-plugin-svg-icons 处理所有的 SVG 文件
import 'virtual:svg-icons-register'
import SvgIcon from '@/components/SvgIcon.vue'

import '@/assets/style/reset.css'
import '@/assets/style/base.css'

// 创建 Vue 应用实例
const app = createApp(App)

// 全局注册 SvgIcon 组件
app.component('SvgIcon', SvgIcon)

app.use(router).use(createPinia()).mount('#app')
