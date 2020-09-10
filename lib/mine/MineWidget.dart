import 'package:flutter/material.dart';

class MineWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MineWidgetState();
  }
}

class MineWidgetState extends State<MineWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: GestureDetector(
        child: Text('我的'),
        onTap: () {
          print('点击');
          Navigator.pushNamed(context, '/Login');
        },
      ),
    );
  }
}
