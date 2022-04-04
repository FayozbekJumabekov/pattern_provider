import 'package:flutter/material.dart';

import '../model/post_model.dart';
import '../services/http_service.dart';

class HomeViewModel extends ChangeNotifier {
  bool isLoading = false;
  List<Post> items = [];

  void apiPostList() async {
    print("Start");
    isLoading = true;
    notifyListeners();
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (response != null) {
      print("worked");
      items = Network.parsePostList(response);
    } else {
      print("Null");
      items = [];
    }
    isLoading = false;
    notifyListeners();
  }

  void apiPostDelete(Post post) async {
    isLoading = true;
    notifyListeners();
    var response = await Network.DEL(
        Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    if (response != null) {
      apiPostList();
    }
    isLoading = false;
    notifyListeners();
  }
}
