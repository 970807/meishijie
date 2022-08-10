export interface IState {
  userInfo: IUserInfo
}

export interface IUserInfo {
  id?: number
  avatar?: string
  account?: string
  [propsName: string]: any
}
