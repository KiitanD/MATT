import 'dart:io';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:myapp/model/constant.dart';
import 'package:myapp/widgets/exportRestApi.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';
import 'package:shelf_router/shelf_router.dart';

var db,
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

void main(List<String> arguments) async {
  db = await Db.create(
      "mongodb+srv://Omieibi:iUXEcoZt1hDWYbXI@matt.plnfh.mongodb.net/General?retryWrites=true&w=majority");
  await db.open();
  db3 = await Db.create(MONGO_CONN_URL2);
  await db3.open();

  db2 = await Db.create(MONGO_CONN_URI);
  await db2.open();

  /*



  await db.open();


  //inspect(db);
  PeriodCollection = db.collection(ClassPeriod_Coll);


  LecturersCollection = db.collection(Lecturers_Coll);
  Spring22Collection = db.collection(Spring22_Coll);



  StaffCollection = db3.collection(Staff_Coll);
  ; */
  final CoursesCollection = db.collection(Courses_Coll);
  final ClassCollection = db.collection(Classrooms_Coll);

  final StudentCollection = db3.collection(Stud_Coll);
  final PeriodCollection = db.collection(ClassPeriod_Coll);
  final FeePaymenCollection = db2.collection(Fee_Coll);

  print(await PeriodCollection.find().toList());
  print('connected');
  const port = 8081;
  final app = Router();
  app.mount('/FeePay/', RestApi(FeePaymenCollection).router);

  app.mount('/Payment/', FinanceSocketApi(ClassCollection).router);

  final handler = Pipeline().addMiddleware(logRequests()).addHandler(app);

  withHotreload(() => serve(handler, InternetAddress.anyIPv4, port));
}
