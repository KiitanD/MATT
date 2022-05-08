import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:myapp/model/constant.dart';

class MongoDatabase {
  static var db,
      db2,
      db3,
      db4,
      PeriodCollection,
      ClassCollection,
      CoursesCollection,
      LecturersCollection,
      Spring22Collection,
      FeePaymenCollection,
      CouresRegCollection,
      StaffCollection,
      CourseListCollection,
      StudentCollection;

  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    db2 = await Db.create(MONGO_CONN_URI);
    db3 = await Db.create(MONGO_CONN_URL2);
    db4 = await Db.create(MONGO_CONN_URL3);

    await db2.open();
    await db.open();
    await db3.open();
    await db4.open();
    inspect(db);
    PeriodCollection = db.collection(ClassPeriod_Coll);
    ClassCollection = db.collection(Classrooms_Coll);
    CoursesCollection = db.collection(Courses_Coll);

    LecturersCollection = db.collection(Lecturers_Coll);
    Spring22Collection = db.collection(Spring22_Coll);

    FeePaymenCollection = db2.collection(Fee_Coll);

    StaffCollection = db3.collection(Staff_Coll);
    StudentCollection = db3.collection(Stud_Coll);

    CourseListCollection = db4.collection(CourseList_Coll);
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
      var staffList = await StaffCollection.find().toList();
      var studList = await StudentCollection.find().toList();
      var avalcourse = await CourseListCollection.find().toList();
      //  print(staffList);

      //Store the list in another list so we can return the value and call them in another class
      List generalValue = [
        periodList,
        classList,
        courseList,
        lecturersList,
        spring22List,
        feeList,
        staffList,
        studList,
        avalcourse
      ];

      //check if we converted the data properly

      return generalValue;
    } catch (e) {
      return e.toString();
    }
  }
}
