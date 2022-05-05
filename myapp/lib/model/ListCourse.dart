// ignore_for_file: file_names

import 'package:myapp/model/mongodb.dart';

class ListCourses {
  late String stId;
  late String courseid;

  //This method print the previous course the student has taken
  static Future<dynamic> getPrevCourse(String stId) async {
    var store = await MongoDatabase.getData();
    var coll = store[7];
    var courseList;
    var major;
    var year;
    var year_num;
    var avalcourse = [];
    var required_for;

    store[7].forEach((element) => {
          if (element["stid"] == stId)
            {
              courseList = element["courses_taken"],
              major = element["major"],
              year = element["year"]
            }
        });
    // print(courseList);
    if (year == "2022") {
      year_num = 4;
    } else if (year == "2023") {
      year_num = 3;
    } else if (year == "2024") {
      year_num = 2;
    } else if (year == "2025") {
      year_num = 1;
    }

    store[2].forEach(
        (element) => {required_for = element["required_for"] as List<dynamic>});
  }
}
