import 'package:flutter/material.dart';
import '../model/post_model.dart';
import '../services/http_service.dart';
import '../views/utils.dart';

class DetailViewModel extends ChangeNotifier {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  bool isLoading = false;

  void checkPost(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    if (titleController.text.isNotEmpty && contentController.text.isNotEmpty) {
      Post post =
          Post(title: titleController.text, body: contentController.text);
      addPost(context, post);
    } else {
      Utils.showToast('Empty field');
      return;
    }
  }

  void addPost(BuildContext context, Post post) {
    isLoading = true;
    notifyListeners();
    Network.POST(Network.API_CREATE, Network.paramsCreate(post)).then((value) {
      getResponse(context, value);
    });
  }

  void getResponse(BuildContext context, String? response) {
    isLoading = false;
    notifyListeners();
    if (response != null) {
      Utils.showToast("Successfully added!");
      Navigator.pop(context);
    } else {
      Utils.showToast("Not Added!");
      Navigator.pop(context);
    }
  }
}
