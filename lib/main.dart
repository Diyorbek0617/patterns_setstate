import 'package:flutter/material.dart';
import 'package:patterns_setstate/pages/Post_add_page.dart';
import 'package:patterns_setstate/pages/bottomsheet_page.dart';
import 'package:patterns_setstate/pages/home_page.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: const Home_page(),
      routes: {
       Home_page.id:(context)=>const Home_page(),
        Post_add_page.id:(context)=>const Post_add_page(),
        BottomSheetpage.id:(context)=>BottomSheetpage(),
      },
    );

  }
}
