import { defineStore } from 'pinia'

export const useUserStore = defineStore('user', {
  state: () => ({
    token: localStorage.getItem('token'),
  }),
  getters: {
    hasToken: (state) => !!state.token,
  },
})
