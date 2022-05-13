import 'package:flutter/material.dart';
import 'package:untitled/Model/WordEN.dart';
import 'package:untitled/Screens/home/Components/body.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/enums.dart';
import 'dart:math' as math;

import '../../size_config.dart';
import 'Components/MyBottomNavBar.dart';

// import 'components/custom_bottom_.nav_bar.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      bottomNavigationBar: MyBottomNavBar(),
      body: Body(),
    );
  }

}

