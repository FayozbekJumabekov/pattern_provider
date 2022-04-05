import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pattern_provider/viewmodel/detail_viewmodel.dart';
import 'package:provider/provider.dart';
import '../model/post_model.dart';
import '../services/http_service.dart';
import '../views/utils.dart';

class DetailPage extends StatefulWidget {
  Post? post;

  DetailPage({this.post, Key? key}) : super(key: key);
  static const String id = "detail_page";

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  DetailViewModel detailViewModel = DetailViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => detailViewModel,
      child: Consumer<DetailViewModel>(
          builder: (
        context,
        model,
        index,
      ) =>
              Scaffold(
                appBar: AppBar(
                  title: const Text('Detail Page'),

                  /// Back Button
                  leading: IconButton(
                    icon: const Icon(
                      CupertinoIcons.arrow_left,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  actions: [
                    /// Save Button
                    TextButton(
                        onPressed: () {
                          detailViewModel.checkPost(context);
                        },
                        child: const Text(
                          "Save",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ))
                  ],
                ),
                body: SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        /// Add title
                        TextField(
                          controller: detailViewModel.titleController,
                          cursorColor: Colors.amber,
                          cursorHeight: 30,
                          maxLines: null,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                          decoration: const InputDecoration(
                            isCollapsed: true,
                            hintText: " Title",
                            hintStyle: TextStyle(
                                fontSize: 25,
                                color: Colors.grey,
                                fontWeight: FontWeight.normal),
                            border: InputBorder.none,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        /// Add Content
                        TextField(
                          controller: detailViewModel.contentController,
                          cursorColor: Colors.amber,
                          cursorHeight: 22,
                          maxLines: null,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          decoration: const InputDecoration(
                            isCollapsed: true,
                            hintText: "  Start typing...",
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
    );
  }
}
