import 'package:myapp/model/mongodb.dart';

class Finance {
  //Finance{MongoDatabase.connect();}

  late String stId;

  //methods check if the students id exist in the database
  static Future<dynamic> checkStudent(stId) async {
    try {
      var store = await MongoDatabase.getData();
      //Checks if user exists
      var value = store[5];
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

  //This function calculates the discount  and the bills of the students
  static Future<dynamic> feesCalc(
      double discountPercent, int amtPaid, stId) async {
    try {
      var Info = await checkStudent(stId);
      //print(Info);
      var id = Info["stid"].toString();
      //  print(id);
      const fees = 4000;
      double discount = ((discountPercent / 100) * amtPaid).ceilToDouble();

      //Calculates the amount the students owes
      var feesOwed = amtPaid - discount - fees;
      //print(feesOwed);
      var db = await MongoDatabase.connect();

      //Locates the student in the database through the students id
      var v1 = await db.findOne({"stid": Info["stid"]});
      // print(v1);
      v1["amountowed"] = feesOwed;
      v1["amountpaid"] = amtPaid;
      v1["paymentstatus"] = "paid";
      db.replaceOne({"stid": Info["stid"]}, v1);

      // print(v1);
    } catch (e) {
      return e;
    }
  }

  //This method helps the Finance to automatically add fees to all students rather than do them individually
  static Future<dynamic> addAll(int amountOwed) async {
    try {
      var db = await MongoDatabase.getData();
      var db1 = await MongoDatabase.connect();
      var feesUpdate = db[5];
      var updateAmt;
      //Loops through the database records then does the updates
      feesUpdate.forEach((element) => {
            updateAmt = element["amountowed"] - amountOwed,
            element["amountowed"] = updateAmt,
            db1.replaceOne({"stid": element["stid"]}, element)
          });
      // print(feesUpdate);
    } catch (e) {
      return e;
    }
  }
}
