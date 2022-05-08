import 'package:myapp/model/mongodb.dart';

class PreCourse {
  //This method print the previous course the student has taken
  static Future<dynamic> getPrevCourse(String stdId) async {
    var prevCourse = await MongoDatabase.getData();
    var coll = prevCourse[5];
    var courseList;
    prevCourse[5].forEach((element) => {
          if (element["stid"] == stdId) {courseList = element["courses_taken"]}
        });
    // print(courseList);
    return courseList;
  }
}
