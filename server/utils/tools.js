exports.verifyPhoneNumber = (phoneNumber) => {
  if (!phoneNumber) {
    return '手机号不能为空'
  }
  if (!/^\d{5,11}$/.test(phoneNumber)) {
    return '手机号格式不正确'
  }
  return ''
}
