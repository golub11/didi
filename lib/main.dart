import 'package:untitled/Screens/home/home_screen.dart';
import 'package:untitled/Screens/vocabulary_list/vocabulary_list_screen.dart';
import 'package:untitled/Screens/word_details/word_details_screen.dart';
import 'package:untitled/routes.dart';
import 'package:flutter/material.dart';
import 'package:untitled/size_config.dart';

void main() {

  runApp(
      MaterialApp(
      //home: MyApp(),
      debugShowCheckedModeBanner: false,
      title: "Didi",
      // home: HomeScreen(),
      // initialRoute: De.routeName,
        initialRoute: HomeScreen.routeName,
       //initialRoute: WordDetailsScreen.routeName,
      routes: routes));
}


//
// class MyApp extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _MyAppState();
//   }
// }

// class _MyAppState extends State<MyApp> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(title: Text("didi")),
//       body: Column(children: [
//
//       ]),
//
//
//
//     );
//   }
// }

// floatingActionButton: FloatingActionButton(
//   child: Icon(Icons.search),
//   onPressed: () async {
//     Word rnd = testWordsEN[0];
//     await rep.insertWord(rnd);
//     setState(() {});
//   },
// ),

  //return MaterialApp(
  //   title: 'Flutter Demo',
  //   theme: ThemeData(
  //     primarySwatch: Colors.blue,
  //   ),
  //   home:

  //MyHomePage(title: 'didi app'),
  // We use routeName so that we dont need to remember the name
  //initialRoute: HomeScreen.routeName,
  //routes: routes,

/*
Column(
  children: <Widget>[
    SizedBox(
     height: 400, // fixed height
    child: ListView(...),
   ),
 ],
)*/

