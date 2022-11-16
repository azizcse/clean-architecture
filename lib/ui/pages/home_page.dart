import 'package:clean_arc/ui/controller/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
    ));
  }
}
