import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/constants.dart';

class HorizontalSuggestionCard extends StatelessWidget {
  Size size;
  final String image, title_heading_1, title_heading_2;

  String nextScreen;

  HorizontalSuggestionCard(this.size, this.image, this.title_heading_1, this.title_heading_2, this.nextScreen);

  @override
  Widget build(BuildContext context) {
    // pocetak horizontalnog scroll widget-a

    return GestureDetector(
      onTap: (){ Navigator.pushNamed(context, nextScreen); },
      child: Container(
          width: size.width * 0.4,
          //margin: const EdgeInsets.symmetric(vertical: 20.0),
          margin: const EdgeInsets.only(
            left: 20,
            top: 20 / 2,
            bottom: 20 * 2.5,
          ),
          // height: 200.0,
          child: Column(
            // ListView
            // This next line does the trick.
            // scrollDirection: Axis.horizontal,
            children: <Widget>[
              Image.asset(image),
              // Image(image: AssetImage('assets/images/pic_homescreen_1.jpg'),width: 100,height: 100,),
              Container(
                padding: EdgeInsets.all(20 / 2),

                // width: 160.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                    offset: Offset(0,10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.3),
                    )
                  ],
                ),
                //color: Colors.red,
                child: Row(
                  children: <Widget>[
                    RichText(text:
                      TextSpan(
                        children: [
                          TextSpan(text:"$title_heading_1\n".toUpperCase(), style: Theme.of(context).textTheme.labelLarge),
                          TextSpan(text:"$title_heading_2".toUpperCase(),style: TextStyle(color: kPrimaryColor.withOpacity(0.5))),
                        ]
                      )
                    ),
                    Text("4s%")
                  ],
                ),
              )
            ],
          )
        ),
    );
    // kraj horizontalnog scroll widget-a
  }
}
