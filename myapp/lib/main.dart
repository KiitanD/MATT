import 'package:flutter/material.dart';
import 'package:myapp/model/LoginStaff.dart';
import 'package:myapp/model/PreviousCourse.dart';
import 'package:myapp/model/billingSystem.dart';
import 'package:myapp/model/mongodb.dart';

import 'model/asc_page.dart';
import 'model/connect.dart';
import 'model/lecturer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //await Finance.checkStudent("01112022");
  //await Finance.feesCalc(10, 23000, "01232022");
  // await Finance.addAll(5000);
  //await PreCourse.getPrevCourse("01112022");

  //await LoginStaff.checkStudent('ragbleta@ashesi.edu.gh', 'Ibisobia007');
  // LoginStaff.encrypt('Ibisobia007');
  //LoginStaff.decrypt('xkLX7mqE3FG2c06nr03dYA==');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return ASCPage(
      title: '',
    );
  }
}
