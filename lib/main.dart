import 'package:flutter/material.dart';
import 'package:properly_made_nft_market/pages/NFTPage.dart';
import 'package:properly_made_nft_market/pages/Register.dart';
import 'package:properly_made_nft_market/pages/Login.dart';
import 'package:properly_made_nft_market/pages/MainApplication.dart';
import 'package:properly_made_nft_market/providers/UserProvider.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider())
      ],
      child: const MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/Register",

      routes: {
        "/Login": (context) => Login(),
        "/Register":(context)  =>  Register(),
        "/MainPage":(context) => MainPage(),
      },
    );
  }
}