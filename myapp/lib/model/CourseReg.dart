// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, unused_local_variable, file_names

import 'package:myapp/model/mongodb.dart';

class CourseReg {
  late String StId;
  late String Code;

  //methods check if the students id exist in the database
  Future<dynamic> checkStudent(stId) async {
    try {
      var store = await MongoDatabase.getData();
      //Checks if user exists
      var value = store[7];
      var lengthVal = value.length;

      for (int i = 0; i < lengthVal + 1; i++) {
        if (value[i]["stid"] == stId) {
          var stdInfo = value[i];
          return stdInfo;
        }
      }
    } catch (e) {
      return e;
    }
  }

  //Method to Check Finance
  static checkPayment(String StId) async {
    var store = await MongoDatabase.getData();
    var paystat;
    store[5].forEach((element) => {
      if (element["stid"] == StId) {paystat = element["payment_status"]}
    });

    if (paystat == "true") {
      return true;
    } else {
      return false;
    }
  }

  //Method to Check Prequisites
  static checkPreq(String StId, String Code) async {
    var store = await MongoDatabase.getData();
    var prevcourses;
    store[7].forEach((element) => {
      if (element["stid"] == StId) {prevcourses = element["courses_taken"]}
    });

    if (prevcourses.contain(Code)) {
      return true;
    } else {
      return false;
    }
  }

  static enroll(String StId, String Code) async {
    var pay = checkPayment(StId);
    var pass = checkPreq(StId, Code);

    if (pay = true) {
      if (pass = true) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
