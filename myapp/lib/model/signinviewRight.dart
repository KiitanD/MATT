import 'dart:ui';

import 'package:flutter/material.dart';

class SignInPageRight extends StatefulWidget {
  const SignInPageRight({Key? key}) : super(key: key);

  @override
  _SignInPageRightState createState() => _SignInPageRightState();
}

class _SignInPageRightState extends State<SignInPageRight> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.red.shade900,
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/white_back_stripes.png'),
                  fit: BoxFit.cover)),
          child: Center(
            child: SizedBox(
              height: 500,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaY: 12, sigmaX: 12),
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white.withOpacity(.3),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'images/downloadlogowithtext.png',
                      width: 300,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
