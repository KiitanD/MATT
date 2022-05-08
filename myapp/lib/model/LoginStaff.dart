import 'package:encrypt/encrypt.dart';
import 'package:myapp/model/mongodb.dart';

class LoginStaff {
  String email;
  String password;

  LoginStaff(this.email, this.password);

//This function does the login check
  static Future<String> checkStudent(email, password) async {
    try {
      var val = await MongoDatabase.getData();
      print(val[6]);

      for (var val in val[6]) {
        if (email == val['email'] &&
            password == decrypt(val['password']) &&
            val['role'] == "finance") {
          return 'fin';
        } else if (email == val['email'] &&
            password == decrypt(val['password']) &&
            val['role'] == "registry") {
          return 'reg';
        } else if (email == val['email'] &&
            password == decrypt(val['password']) &&
            val['role'] == "staff") {
          return 'staff';
        }
      }
      return "no user";
    } catch (e) {
      return (e.toString());
    }
  }

  static String encrypt(String text) {
    final key = Key.fromUtf8('qJ3i-jRwkYnrTh7n6bEWOQ3IhJH3jhCa'); //32 chars
    final iv = IV.fromUtf8('Ghu39Hh83beA7-G!');
    final e = Encrypter(AES(key, mode: AESMode.cbc));
    final encrypted_data = e.encrypt(text, iv: iv);
    print(encrypted_data.base64);
    return encrypted_data.base64;
  }

//dycrypt
  static String decrypt(String text) {
    final key = Key.fromUtf8('qJ3i-jRwkYnrTh7n6bEWOQ3IhJH3jhCa'); //32 chars
    final iv = IV.fromUtf8('Ghu39Hh83beA7-G!');
    final e = Encrypter(AES(key, mode: AESMode.cbc));
    final decrypted_data = e.decrypt(Encrypted.fromBase64(text), iv: iv);
    print(decrypted_data);
    return decrypted_data;
  }
}
