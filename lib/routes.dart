import 'package:flutter/widgets.dart';

import 'Screens/Home/home_screen.dart';
import 'Screens/vocabulary_list/vocabulary_list_screen.dart';
import 'Screens/word_details/word_details_screen.dart';



// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  // SplashScreen.routeName: (context) => SplashScreen(),
  // SignInScreen.routeName: (context) => SignInScreen(),
  // ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  // LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  // SignUpScreen.routeName: (context) => SignUpScreen(),
  // CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  // OtpScreen.routeName: (context) => OtpScreen(),
  //HomeScreen.routeName: (context) => HomeScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  WordDetailsScreen.routeName: (context) => WordDetailsScreen(),
  VocabularyListScreen.routeName: (context) => VocabularyListScreen(),
  // ProfileScreen.routeName: (context) => ProfileScreen(),
};
