class ApiConfig {
  static Map api = {
    'user': {
      'login': '/WebAPI/login', // 登录 get
    },
    'phone': {
      'getPhone': '/WebAPI/GetPhone', // 获取手机号 get
      'getMessage': '/WebAPI/GetMessage', // 获取验证码 get
      'addBlacklist': '/WebAPI/AddBlacklist', // 手机号加入黑名单 get
      'cancelRecv': '/WebAPI/CancelRecv', // 释放指定手机号 get
      'cancelAllRecv': '/WebAPI/CancelAllRecv', // 释放当前用户下所有手机号 get
      'getSummary': '/WebAPI/GetSummary', // 获取当前用户信息 get
    }
  };
}
