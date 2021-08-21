import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'

import '@/assets/style/reset.css'
import '@/assets/style/base.css'

createApp(App).use(store).use(router).mount('#app')
