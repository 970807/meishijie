import { createApp } from 'vue'
import App from './App.vue'
import router from '@/router'
import { createPinia } from 'pinia'
// 导入 SVG 图标插件生成的虚拟模块
// 这个 import 语句是必须的，它会让 vite-plugin-svg-icons 处理所有的 SVG 文件
import 'virtual:svg-icons-register'
import { registerComponents } from '@/utils/autoRegisterComponents'

import '@/assets/style/reset.css'
import '@/assets/style/base.css'

// 创建 Vue 应用实例
const app = createApp(App)

// 全局注册组件
registerComponents(app)

app.use(router).use(createPinia()).mount('#app')
