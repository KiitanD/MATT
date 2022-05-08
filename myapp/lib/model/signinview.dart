import 'package:flutter/material.dart';
import 'package:myapp/model/signinviewLeft.dart';
import 'package:myapp/model/signinviewRight.dart';

class SigninView extends StatefulWidget {
  const SigninView({Key? key}) : super(key: key);

  @override
  _SigninViewState createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'easy_sidemenu Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignInViewDisplay(),
      debugShowCheckedModeBanner: false,
    );
    // return Container(
    //   // body: SingleChildScrollView(
    //   child: Container(
    //     height: 640,
    //     width: 1080,
    //     margin: EdgeInsets.symmetric(horizontal: 24),
    //     clipBehavior: Clip.antiAliasWithSaveLayer,
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(24),
    //       color: Colors.red.shade800,
    //     ),
    //     child: Row(
    //       children: [
    //         const SignInPageLeft(),
    //         if (MediaQuery.of(context).size.width > 900)
    //           const SignInPageRight(),
    //       ],
    //     ),
    //   ),
    //   // ),
    // );
  }
}

class SignInViewDisplay extends StatefulWidget {
  const SignInViewDisplay({Key? key}) : super(key: key);

  @override
  _SignInViewDisplayState createState() => _SignInViewDisplayState();
}

class _SignInViewDisplayState extends State<SignInViewDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade900,
      body: Container(
        height: 640,
        width: 1080,
        margin: EdgeInsets.symmetric(horizontal: 24),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.red.shade700,
        ),
        child: Row(
          children: [
            const SignInPageLeft(),
            if (MediaQuery.of(context).size.width > 900)
              const SignInPageRight(),
          ],
        ),
      ),
      // ),
    );
  }
}
