import 'package:sembast/sembast.dart';

class mUser {
  String empCode;
  String empName;
  String empLname;
  String empPosition;
  String empSection;
  String empDepartment;
  String empUsername;
  String empPassword;
  String empEmail;

  mUser(
      {required this.empCode,
      required this.empName,
      required this.empLname,
      required this.empPosition,
      required this.empSection,
      required this.empDepartment,
      required this.empUsername,
      required this.empPassword,
      required this.empEmail});

  static toJson(mUser post) {
    return {
      'empCode': post.empCode,
      'empName': post.empName,
      'empLname': post.empLname,
      'empSection': post.empSection,
      'empPosition': post.empPosition,
      'empDepartment': post.empDepartment,
      'empUsername': post.empUsername,
      'empPassword': post.empPassword,
      'empEmail': post.empEmail
    };
  }

  static mUser fromRecord(RecordSnapshot record) {
    var post = mUser(
        empCode: record['empCode'].toString(),
        empName: record['empName'].toString(),
        empLname: record['empLname'].toString(),
        empSection: record['empSection'].toString(),
        empPosition: record['empPosition'].toString(),
        empDepartment: record['empDepartment'].toString(),
        empUsername: record['empUsername'].toString(),
        empPassword: record['empPassword'].toString(),
        empEmail: record['empEmail'].toString());
    return post;
  }
}
