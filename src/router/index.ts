import { createRouter, createWebHistory, RouteRecordRaw } from 'vue-router'

const routes: RouteRecordRaw[] = [
  // 首页
  {
    path: '/',
    name: 'Home',
    component: () => import('@/views/Home/index.vue'),
  },
  // 登录注册页
  {
    path: '/login',
    name: 'Login',
    component: () => import('@/views/Login/index.vue'),
  },
  // 菜谱详情页
  {
    path: '/recipe-detail/:id',
    name: 'recipeDetail',
    component: () => import('@/views/RecipeDetail/index.vue'),
  },
  // 搜索结果页
  {
    path: '/search-result',
    name: 'SearchResult',
    component: () => import('@/views/SearchResult/index.vue'),
  },
  // 手机端搜索
  {
    path: '/mobile-search',
    name: 'MobileSearch',
    component: () => import('@/views/MobileSearch/index.vue'),
  },
]

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes,
  scrollBehavior(to, from, savePosition) {
    if (savePosition) {
      return savePosition
    } else {
      return { top: 0 }
    }
  },
})

export default router
