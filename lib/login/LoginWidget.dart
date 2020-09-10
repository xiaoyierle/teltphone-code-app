import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:telephone_code/services/index.dart';

class LoginWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginWidgetState();
  }
}

class LoginWidgetState extends State<LoginWidget> {
  TextEditingController _pwdEditController;
  TextEditingController _userNameEditController;

  final FocusNode _userNameFocusNode = FocusNode();
  final FocusNode _pwdFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _pwdEditController = TextEditingController();
    _userNameEditController = TextEditingController();

    _pwdEditController.addListener(() => setState(() => {}));
    _userNameEditController.addListener(() => setState(() => {}));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildTopWidget(context),
            SizedBox(
              height: 80,
            ),
            buildEditWidget(context),
            buildLoginButton()
          ],
        ),
      ),
    );
  }

  /// 头部
  Widget buildTopWidget(BuildContext context) {
    double height = 200.0;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height,
      color: Colors.blue,
      child: Stack(
        overflow: Overflow.visible, // 超出部分显示
        children: <Widget>[
          Positioned(
            left: (width - 90) / 2.0,
            top: height - 45,
            child: Container(
              width: 90.0,
              height: 90.0,
              decoration: BoxDecoration(
                ///阴影
                boxShadow: [
                  BoxShadow(color: Theme.of(context).cardColor, blurRadius: 4.0)
                ],

                ///形状
                shape: BoxShape.circle,

                ///图片
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569298229946&di=ea4ffb2b140ef40035772bbcee7bbdd5&imgtype=0&src=http%3A%2F%2Fcimg2.163.com%2Fcatchimg%2F20090909%2F8112139_3.jpg'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildEditWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: <Widget>[
          buildLoginNameTextField(),
          SizedBox(height: 20.0),
          buildPwdTextField(),
        ],
      ),
    );
  }

  Widget buildLoginNameTextField() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 16,
            top: 8,
            child: Icon(
              Icons.person,
            ),
          ),
          Positioned(
            left: 45,
            top: 10,
            bottom: 10,
            width: 1,
            child: Container(
              color: Colors.black,
            ),
          ),
          Positioned(
            left: 55,
            right: 10,
            top: 10,
            height: 30,
            child: TextField(
              controller: _userNameEditController,
              focusNode: _userNameFocusNode,
              decoration: InputDecoration(
                hintText: "请输入用户名",
                border: InputBorder.none,
              ),
              style: TextStyle(fontSize: 14),
            ),
          )
        ],
      ),
    );
  }

  Widget buildPwdTextField() {
    return Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 16,
              top: 8,
              child: Icon(
                Icons.lock,
              ),
            ),
            Positioned(
              left: 45,
              top: 10,
              bottom: 10,
              width: 1,
              child: Container(
                color: Colors.black,
              ),
            ),
            Positioned(
              left: 55,
              right: 10,
              top: 10,
              height: 30,
              child: TextField(
                controller: _pwdEditController,
                focusNode: _pwdFocusNode,
                decoration: InputDecoration(
                  hintText: "请输入密码",
                  border: InputBorder.none,
                ),
                style: TextStyle(fontSize: 14),
                obscureText: true,

                /// 设置密码
              ),
            )
          ],
        ));
  }

  /// 按钮
  Widget buildLoginButton() {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 10, right: 10),
      padding: EdgeInsets.all(0),
      width: MediaQuery.of(context).size.width - 20,
      height: 40,
      child: RaisedButton(
        onPressed: () async {
          if (checkInput()) {
            print('点击按钮了');
            var response = await http.get(
                'http://yima.hbtfcc.com:2019/WebAPI/login?uname='+_userNameEditController.text+'&upwd='+_pwdEditController.text);
            print(response.body);
            Services.codeRequest.user.login({111,1111});
            
            
            Fluttertoast.showToast(
                msg: "登录成功",
                gravity: ToastGravity.CENTER,
                timeInSecForIos: 2,
                textColor: Colors.white,
                fontSize: 14.0);
          }
        },
        child: Text("登录"),
        color: Colors.blue,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
    );
  }

  bool checkInput() {
    if (_userNameEditController.text.length == 0) {
      Fluttertoast.showToast(
          msg: "请输入用户名",
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 2,
          textColor: Colors.white,
          fontSize: 14.0);

      return false;
    } else if (_pwdEditController.text.length == 0) {
      Fluttertoast.showToast(
          msg: "请输入密码",
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 2,
          textColor: Colors.white,
          fontSize: 14.0);
      return false;
    }

    return true;
  }
}
