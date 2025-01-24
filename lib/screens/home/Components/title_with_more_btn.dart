import 'package:flutter/material.dart';
import 'package:untitled/Screens/home/Components/title_with_custom_underline.dart';

import '../../../constants.dart';

class TitleWithMoreButton extends StatelessWidget {
  const TitleWithMoreButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 20.0),
      child: Row(
        children: [
          TitleWithCustomUnderLine(),
          Spacer(),
          TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),backgroundColor: kPrimaryColor),
              onPressed: (){},

              child:  Text("More"))
        ],
      ),
    );
  }
}
