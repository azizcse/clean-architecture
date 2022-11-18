import 'package:clean_arc/ui/controller/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/Post.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post list"),
      ),
      body: Obx(
        () {
          return controller.posts.isEmpty
              ? Container(
                  width: Get.width,
                  height: Get.height,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        controller.fetchPost();
                      },
                      child: const Text("Click to fetch post"),
                    ),
                  ),
                )
              : SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: getRows(controller.posts),
                    ),
                  ),
                );
        },
      ),
    );
  }

  List<Widget> getRows(List<Post> postList) {
    List<Widget> widgetList = [];
    for (var element in postList) {
      widgetList.add(ListTile(
        onTap: () {
          controller.fetchPostDetails(element.id ?? 1);
        },
        leading: const CircleAvatar(
          radius: 30,
        ),
        title: Text(element.title!),
        subtitle: Text(element.body!),
      ));
      widgetList.add(
        const SizedBox(
          height: 10,
        ),
      );
    }
    return widgetList;
  }
}
