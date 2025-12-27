/**
 * 自动注册全局组件
 */
import type { App } from 'vue'
export function registerComponents(app: App) {
  // 获取 components 目录下的所有 .vue 文件
  const components = import.meta.glob('@/components/**/*.vue', { eager: true })

  Object.entries(components).forEach(([path, module]: [string, any]) => {
    // 获取组件名称
    const name = getComponentName(path)

    // 如果有默认导出，则注册组件
    if (module.default) {
      // 优先使用组件定义的name作为组件名(如果组件定义了name属性)
      app.component(module.default.name || name, module.default)
    }
  })
}

// 从文件路径提取组件名
function getComponentName(path: string): string {
  // 处理路径，移除 @/components/ 前缀和 .vue 后缀
  const name = path
    .replace(/^.*[\\/]/, '') // 获取文件名
    .replace(/\.\w+$/, '') // 移除扩展名

  // 如果文件名为 index，则使用父目录名
  if (name === 'index') {
    const dirName = path.split('/').slice(-2, -1)[0] // 获取父目录名
    return capitalizeFirstLetter(dirName)
  }
  return capitalizeFirstLetter(name)
}

// 首字母大写
function capitalizeFirstLetter(str: string): string {
  return str.charAt(0).toUpperCase() + str.slice(1)
}
