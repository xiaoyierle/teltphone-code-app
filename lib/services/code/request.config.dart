import 'package:telephone_code/utils/HttpUtil.dart';
import 'package:telephone_code/services/code/api.config.dart';


class CodeRequest {

  static Map codeRequest = {
    'user': {
      'login': (data) {
        return HttpUtil.get(
          ApiConfig.api.user.login,
          success: (data){
            
          },error: (errorMsg){
          
          }
        );
      }
    },
  };
}