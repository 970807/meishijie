import { defineStore } from 'pinia'

export const useDeviceStore = defineStore('device', {
  state: () => ({
    // 是否是移动端
    mobileDevice: true,
  }),
  getters: {
    //   是否是pc端
    pcDevice: (state) => !state.mobileDevice,
  },
  actions: {
    // 判断是否是移动端 -- 初始化方法
    initJudgeisMobile() {
      //   方法一：使用navigator.userAgent字符串检测
      const flag = !!navigator.userAgent.match(
        /(phone|pad|pod|iPhone|iPod|ios|iPad|Android|Mobile|BlackBerry|IEMobile|MQQBrowser|JUC|Fennec|wOSBrowser|BrowserNG|WebOS|Symbian|Windows Phone)/i
      )

      // 方法二：使用window.matchMedia()检测
      const flag2 = !window.matchMedia('(min-width: 1200px)').matches

      this.mobileDevice = flag || flag2
    },
  },
})
