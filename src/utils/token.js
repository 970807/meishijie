const TOKEN_KEY = 'token'

export function getToken() {
  let token = localStorage.getItem(TOKEN_KEY)
  if (!token) {
    token = sessionStorage.getItem(TOKEN_KEY)
  }
  return token
}

export function setToken(token, isSaveForever = true) {
  if (isSaveForever) {
    localStorage.setItem(TOKEN_KEY, token)
    sessionStorage.removeItem(TOKEN_KEY)
  } else {
    sessionStorage.setItem(TOKEN_KEY, token)
    localStorage.removeItem(TOKEN_KEY, '')
  }
}
