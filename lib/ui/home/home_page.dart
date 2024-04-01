import 'dart:async';

import 'package:clean_arc/domain/remote/Post.dart';
import 'package:clean_arc/ui/controller/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);
  final ItemScrollController itemScrollController = ItemScrollController();
  final ScrollOffsetController scrollOffsetController =
      ScrollOffsetController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  final ScrollOffsetListener scrollOffsetListener =
      ScrollOffsetListener.create();

  Map<int, Duration> durationMap = {
    0: const Duration(milliseconds: 1000),
    1: const Duration(milliseconds: 900),
    2: const Duration(milliseconds: 800),
    3: const Duration(milliseconds: 700),
    4: const Duration(milliseconds: 600),
    5: const Duration(milliseconds: 500),
  };
  int autoScrollCurrentIndex = 0;

  Timer? _currentTimer;

  void startScrolling(Duration duration) {
    print("Clicked  periodic time : ");
    _currentTimer?.cancel();
    _currentTimer = Timer.periodic(duration, (timer) {
      print("Called periodic time : ");
      scrollOffsetController.animateScroll(
        offset: 100,
        duration: duration,
      );
    });
  }

  int durationValue = 1000;

  void setOffsetListener() {
    scrollOffsetListener.changes.listen((event) {
      print("Offset listener  : ${event}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post list"),
        actions: [
          IconButton(
            onPressed: () {
              setOffsetListener();
              startScrolling(durationMap[autoScrollCurrentIndex]!);
            },
            icon: const Icon(Icons.delete),
          ),
          const SizedBox(
            width: 20,
          ),
          IconButton(
              onPressed: () {
                if (autoScrollCurrentIndex < 5) {
                  autoScrollCurrentIndex++;
                  startScrolling(durationMap[autoScrollCurrentIndex]!);
                }
              },
              icon: Icon(Icons.add)),
          const SizedBox(
            width: 20,
          ),
          IconButton(
              onPressed: () {
                if (autoScrollCurrentIndex > 0) {
                  autoScrollCurrentIndex--;
                  startScrolling(durationMap[autoScrollCurrentIndex]!);
                }
              },
              icon: Icon(Icons.exposure_minus_1)),
          const SizedBox(
            width: 20,
          ),
        ],
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
              : ScrollablePositionedList.builder(
                  itemCount: 500,
                  itemBuilder: (context, index) => Text('Item $index'),
                  itemScrollController: itemScrollController,
                  scrollOffsetController: scrollOffsetController,
                  itemPositionsListener: itemPositionsListener,
                  scrollOffsetListener: scrollOffsetListener,
                );
          ;
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
