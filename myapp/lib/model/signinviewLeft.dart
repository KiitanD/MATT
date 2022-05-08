import 'package:flutter/material.dart';
import 'package:myapp/model/signinfinal.dart';

class SignInPageLeft extends StatelessWidget {
  const SignInPageLeft({Key? key}) : super(key: key);

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
              Align(
                alignment: Alignment.topCenter,
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w900),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // const TextField(
              //   decoration: InputDecoration(
              //       label: Text(
              //         "ID",
              //         style: TextStyle(color: Colors.white),
              //       ),
              //       hintText: "Enter ID"),
              // ),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignInFinal()));
                },
                child: Text("Sign In as Regular Student"),
                minWidth: double.infinity,
                height: 40,
                elevation: 15,
                color: Colors.white,
                textColor: Colors.red.shade800,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              // const TextField(
              //   decoration: InputDecoration(
              //       label: Text(
              //         "First name",
              //         style: TextStyle(color: Colors.white),
              //       ),
              //       hintText: "Enter first name"),
              // ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignInFinal()));
                },
                child: Text("Sign Up as ASC Member"),
                minWidth: double.infinity,
                height: 40,
                elevation: 15,
                color: Colors.white,
                textColor: Colors.red.shade800,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              // const TextField(
              //   decoration: InputDecoration(
              //       label: Text(
              //         "Last name",
              //         style: TextStyle(color: Colors.white),
              //       ),
              //       hintText: "Enter last name"),
              // ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignInFinal()));
                },
                child: Text("Sign In as a Club Head"),
                minWidth: double.infinity,
                height: 40,
                elevation: 15,
                color: Colors.white,
                textColor: Colors.red.shade800,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              // const TextField(
              //   decoration: InputDecoration(
              //       label: Text(
              //         "Email",
              //         style: TextStyle(color: Colors.white),
              //       ),
              //       hintText: "Enter Email"),
              // ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignInFinal()));
                },
                child: Text("Sign In as a Lecturer"),
                minWidth: double.infinity,
                height: 40,
                elevation: 15,
                color: Colors.white,
                textColor: Colors.red.shade800,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              // const TextField(
              //   decoration: InputDecoration(
              //       label: Text(
              //         "Password",
              //         style: TextStyle(color: Colors.white),
              //       ),
              //       hintText: "Enter Password"),
              // ),
              // const TextField(
              //   decoration: InputDecoration(
              //       label: Text(
              //         "Confirm Password",
              //         style: TextStyle(color: Colors.white),
              //       ),
              //       hintText: "Enter Password"),
              // ),

              // MaterialButton(
              //   onPressed: () {},
              //   child: Text("Sign Up"),
              //   minWidth: double.infinity,
              //   height: 40,
              //   elevation: 15,
              //   color: Colors.white,
              //   textColor: Colors.red.shade800,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(32),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
