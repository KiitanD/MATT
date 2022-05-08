import 'package:flutter/material.dart';
import 'package:myapp/model/signinfinalLeft.dart';
import 'package:myapp/model/signinfinalRight.dart';

class SignInFinal extends StatefulWidget {
  const SignInFinal({Key? key}) : super(key: key);

  @override
  _SignInFinalState createState() => _SignInFinalState();
}

class _SignInFinalState extends State<SignInFinal> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'easy_sidemenu Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignInFinalDisplay(),
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
    //         const SignInFinalLeft(),
    //         if (MediaQuery.of(context).size.width > 900)
    //           const SignInFinalRight(),
    //       ],
    //     ),
    //   ),
    //   // ),
    // );
  }
}

class SignInFinalDisplay extends StatefulWidget {
  const SignInFinalDisplay({Key? key}) : super(key: key);

  @override
  _SignInFinalDisplayState createState() => _SignInFinalDisplayState();
}

class _SignInFinalDisplayState extends State<SignInFinalDisplay> {
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
            const SignInFinalLeft(),
            if (MediaQuery.of(context).size.width > 900)
              const SignInFinalRight(),
          ],
        ),
      ),
      // ),
    );
  }
}
