import 'dart:io';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:myapp/model/constant.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';
import 'package:shelf_router/shelf_router.dart';

class MongoDatabase {
  static var db,
      db2,
      db3,
      PeriodCollection,
      ClassCollection,
      CoursesCollection,
      LecturersCollection,
      Spring22Collection,
      FeePaymenCollection,
      CouresRegCollection,
      StaffCollection,
      StudentCollection;

  static dynamic connect() async {
    db = await Db.create(MONGO_CONN_URL);
    db2 = await Db.create(MONGO_CONN_URI);
    db3 = await Db.create(MONGO_CONN_URL2);

    await db2.open();
    await db.open();
    await db3.open();
    //inspect(db);
    PeriodCollection = db.collection(ClassPeriod_Coll);
    ClassCollection = db.collection(Classrooms_Coll);
    CoursesCollection = db.collection(Courses_Coll);

    LecturersCollection = db.collection(Lecturers_Coll);
    Spring22Collection = db.collection(Spring22_Coll);

    FeePaymenCollection = db2.collection(Fee_Coll);

    StaffCollection = db3.collection(Staff_Coll);
    StudentCollection = db3.collection(Stud_Coll);

    const port = 8081;
    final app = Router();
    app.get('/', (Request req) {
      return Response.ok('Hello World');
    });

    final handler = Pipeline().addMiddleware(logRequests()).addHandler(app);

    withHotreload(() => serve(handler, InternetAddress.anyIPv4, port));
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
        studList
      ];

      //check if we converted the data properly

      return generalValue;
    } catch (e) {
      return e.toString();
    }
  }
}
