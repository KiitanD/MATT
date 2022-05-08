import 'package:flutter/material.dart';

class SignInFinalLeft extends StatelessWidget {
  const SignInFinalLeft({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(65.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sign In',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 12,
              ),
              const TextField(
                decoration: InputDecoration(
                    label: Text(
                      "ID",
                      style: TextStyle(color: Colors.white),
                    ),
                    hintText: "Enter ID"),
              ),
              const TextField(
                decoration: InputDecoration(
                    label: Text(
                      "Password",
                      style: TextStyle(color: Colors.white),
                    ),
                    hintText: "Enter Password"),
              ),
              const SizedBox(
                height: 12,
              ),
              MaterialButton(
                onPressed: () {},
                child: Text("Sign In"),
                minWidth: double.infinity,
                height: 40,
                elevation: 15,
                color: Colors.white,
                textColor: Colors.red.shade800,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
