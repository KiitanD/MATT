import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:myapp/model/constant.dart';

class MongoDatabase {
  static var db,
      db2,
      PeriodCollection,
      ClassCollection,
      CoursesCollection,
      LecturersCollection,
      Spring22Collection,
      FeePaymenCollection;

  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    db2 = await Db.create(MONGO_CONN_URI);

    await db2.open();
    await db.open();
    inspect(db);
    PeriodCollection = db.collection(ClassPeriod_Coll);
    ClassCollection = db.collection(Classrooms_Coll);
    CoursesCollection = db.collection(Courses_Coll);

    LecturersCollection = db.collection(Lecturers_Coll);
    Spring22Collection = db.collection(Spring22_Coll);

    FeePaymenCollection = db2.collection(Fee_Coll);
    // print(PeriodCollection);
    return FeePaymenCollection;
  }

//This method get the data from the database
  static Future<dynamic> getData() async {
    try {
      //convert all the collections form the database into List
      var periodList = await PeriodCollection.find().toList();
      var classList = await ClassCollection.find().toList();
      var courseList = await CoursesCollection.find().toList();
      var lecturersList = await LecturersCollection.find().toList();
      var spring22List = await Spring22Collection.find().toList();
      var feeList = await FeePaymenCollection.find().toList();

      //    print(feeList);

      //  print(classList);

      //for (int i = 0; i < classList.length; i++) {
      //print(classList[i]['capacity']);
      //}
      //for (int i = 0; i < feeList.length; i++) {
      //print(feeList[i]['stid']);
      //}

      //Store the list in another list so we can return the value and call them in another class
      List generalValue = [
        periodList,
        classList,
        courseList,
        lecturersList,
        spring22List,
        feeList
      ];
      //  print(generalValue);

      //check if we converted the data properly

      return generalValue;
    } catch (e) {
      return e.toString();
    }
  }
}
