import 'package:flutter/cupertino.dart';

class LogoDidi extends StatelessWidget{
  int ?_width;
  int ?_height;


  LogoDidi(this._width, this._height);


  @override
  Widget build(BuildContext context) {
    return
      const Image(
        image: AssetImage('assets/images/logo.png'),
        width: 100,
        height: 100);
    }

}