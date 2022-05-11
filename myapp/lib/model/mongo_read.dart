import 'package:myapp/model/constant.dart';
// ignore: unused_import
import 'package:myapp/model/mongodb.dart';

Future<Object> getDocuments() async {
  try {
    const studentinfo = StudentInfo_Coll;
    return studentinfo;
  } catch (e) {
    print(e);
    return Future.value(e);
  }
}
