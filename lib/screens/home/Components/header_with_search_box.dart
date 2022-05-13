import 'package:flutter/material.dart';
import 'package:untitled/components/search_box.dart';

import '../../../constants.dart';
import 'logo.dart';

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.25 + 27,
      margin: EdgeInsets.only(bottom: 20 * 2.5),
      child: Stack(

        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 20,
            ),

            height: size.height * 0.25,
            decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36),
                )
            ),
            child: Row(
              children: <Widget>[
                Text('Hi Nikola!',
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold)
                ),
                Spacer(),
                Container(
                  child: LogoDidi(80,80),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(46),
                        bottomRight: Radius.circular(46),
                        topLeft: Radius.circular(46),
                        topRight: Radius.circular(46),
                      )
                  ),
                )
              ],

            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SearchBox(),
          )
        ],
      ),
    );
  }
}
