import { createStore } from 'vuex'

export default createStore({
  state: {
    token: localStorage.getItem('token')
  },
  mutations: {
    setToken(state, token) {
      state.token = token
    }
  },
  actions: {
  },
  modules: {
  }
})
