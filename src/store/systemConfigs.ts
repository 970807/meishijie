import { defineStore } from 'pinia'

/**
 * 公共方法--获取paramValue值
 */
const getParamValue = (paramCode: string, systemConfigs: any[]) => {
  const result = systemConfigs.find((item) => item.paramCode === paramCode)
  if (!result) return null
  if (result.paramType === 1) {
    // paramType=1(开关类型)，paramValue=1代表开关打开，paramValue=0代表开关关闭；值转为boolean;
    return result.paramValue === '1'
  } else {
    return result.paramValue as string
  }
}

export const useSystemConfigsStore = defineStore('systemConfigs', {
  state: () => ({
    systemConfigs: [] as any[],
  }),
  getters: {
    // 允许登录
    canLogin: (state) => getParamValue('canLogin', state.systemConfigs),
    // 允许注册
    canRegister: (state) => getParamValue('canRegister', state.systemConfigs),
    // 允许手机号登录
    canPhoneLogin: (state) =>
      getParamValue('canPhoneLogin', state.systemConfigs),
    // 开启github源码入口
    githubCodeEntry: (state) =>
      getParamValue('githubCodeEntry', state.systemConfigs),
    // 开启去管理端入口
    adminSystemEntry: (state) =>
      getParamValue('adminSystemEntry', state.systemConfigs),
  },
})
