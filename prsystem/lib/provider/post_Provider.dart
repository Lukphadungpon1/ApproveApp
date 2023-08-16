import 'package:flutter/foundation.dart';

class PostProvider with ChangeNotifier {
  List<String> _posts = ['test', 'test'];

  // List<String> get posts {
  //   return _posts;
  // }
  //
  List<String> get posts => _posts;

  addNewPost(String post) {
    _posts.add(post);

    notifyListeners();
  }
}
