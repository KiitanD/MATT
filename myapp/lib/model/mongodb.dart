import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:myapp/model/constant.dart';

class MongoDatabase {
  static var db,
      PeriodCollection,
      ClassCollection,
      CoursesCollection,
      LecturersCollection,
      Spring22Collection;
  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    PeriodCollection = db.collection(ClassPeriod_Coll);
    ClassCollection = db.collection(Classrooms_Coll);
    CoursesCollection = db.collection(Courses_Coll);
    LecturersCollection = db.collection(Lecturers_Coll);
    Spring22Collection = db.collection(Spring22_Coll);
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
      //print(periodList);
      //Store the list in another list so we can return the value and call them in another class
      var generalValue = [
        periodList,
        classList,
        courseList,
        lecturersList,
        spring22List
      ];

      //check if we converted the data properly
      if (periodList.isSuccess &&
          classList.isSuccess &&
          courseList.isSuccess &&
          lecturersList.isSuccess &&
          spring22List.isSuccess) {
        print("Retrived data succesfully");
      } else {
        print("Something wrong in retreival");
      }
      return generalValue;
    } catch (e) {
      return e.toString();
    }
  }
}
