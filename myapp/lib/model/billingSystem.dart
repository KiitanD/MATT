import 'package:mongo_dart/mongo_dart.dart';
import 'package:myapp/model/mongodb.dart';

class Finance {
  //Finance{MongoDatabase.connect();}

  late String stId;

  static Future<dynamic> checkStudent(stId) async {
    try {
      var store = await MongoDatabase.getData();
      //Checks if user exists
      var value = store[5];
      //  print(value);
      var lengthVal = value.length;
      for (int i = 0; i < lengthVal + 1; i++) {
        if (value[i]["stid"] == stId) {
          // print(value[i]["stid"]);
          // print(i);
          var stdInfo = value[i];
          //  print(stdInfo);

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
    var Info = await checkStudent(stId);
    //   print(Info);
    var id = Info["stid"].toString();
    print(id);
    const fees = 4000;
    double discount = ((discountPercent / 100) * amtPaid).ceilToDouble();

    var feesOwed = amtPaid - discount - fees;
    print(feesOwed);
    var db = await MongoDatabase.connect();

    var v1 = await db.findOne({"stid": Info["stid"]});
    print(v1);
    v1["amountowed"] = feesOwed;
    db.replaceOne({"stid": Info["stid"]}, v1);

    print(v1);

    return "me";
  }
}
