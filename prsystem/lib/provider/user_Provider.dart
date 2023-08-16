import 'package:flutter/foundation.dart';

import 'package:prsystem/constants/constants.dart';

import 'package:prsystem/database/post_db_sqflite.dart';
import 'package:prsystem/modal/mPMSMobile.dart';

import 'package:prsystem/modal/mUser.dart';

import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  List<mUser> _posts = [];
  late PostDBSqflite _postDB;

  // List<String> get posts {
  //   return _posts;
  // }
  //
  UserProvider() {
    // _postDB = PostDB('user');
    _postDB = PostDBSqflite(databaseName: 'user');
  }

  List<mUser> get posts => [..._posts];

  addNewUser(mUser post) async {
    if (post != null) {
      _posts.add(post);

      var userDB = await _postDB.loadUser();

      if (userDB.length == 0) {
        _postDB.save(post);
      }

      notifyListeners();
    }
  }

  getNewUser(String post) {
    _posts.firstWhere((element) => element.empEmail == post);
    return _posts;
  }

  getUser() {
    var _data = new mUser(
        empCode: "",
        empName: "",
        empLname: "",
        empPosition: "",
        empSection: "",
        empDepartment: "",
        empUsername: "",
        empPassword: "",
        empEmail: "");

    _posts.forEach((e) {
      _data = mUser(
          empCode: e.empCode,
          empName: e.empName,
          empLname: e.empLname,
          empPosition: e.empPosition,
          empSection: e.empSection,
          empDepartment: e.empDepartment,
          empUsername: e.empUsername,
          empPassword: e.empPassword,
          empEmail: e.empEmail);
    });
    return _data;
  }

  getAllUser() {
    _posts.first;
    return _posts;
  }

  clearUser() {
    _posts.clear();
    _posts = [];
    // notifyListeners();
  }

  initData() async {
    _posts = await _postDB.loadUser();
    notifyListeners();
  }

  chkVeriflyMobile(String mobilenid, String type) async {
    bool check = false;

    List<MPmsMobile> _dataFromAPI;

    var url = Uri.parse('${URLAPI}Login/chkVeriflyMobile/${mobilenid}/${type}');

    var respon = await http.get(url);
    _dataFromAPI = mPmsMobileFromJson(respon.body);

    if (_dataFromAPI.length > 0) check = true;

    return check;
  }
}
