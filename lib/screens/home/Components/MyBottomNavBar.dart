import 'package:flutter/material.dart';

import '../../../constants.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 20 * 2,
        right: 20 * 2,
      ),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(offset: Offset(0,-5), blurRadius: 30, color: kPrimaryColor.withOpacity(0.18))
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.home,color: kPrimaryColor)
          ),

          IconButton(
              onPressed: (){},
              icon: Icon(Icons.star_border_outlined, color: kPrimaryColor)
          ),
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.verified_user_outlined, color: kPrimaryColor)
          ),

        ],
      ),
    );
  }
}
