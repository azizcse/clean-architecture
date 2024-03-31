import 'package:clean_arc/core/base/presentable_widget_builder.dart';
import 'package:clean_arc/ui/controller/home/home_presenter.dart';
import 'package:clean_arc/ui/controller/home/home_ui_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomePageNew extends GetView<HomePresenter> {
  HomePageNew({super.key});

  final ItemScrollController itemScrollController = ItemScrollController();
  final ScrollOffsetController scrollOffsetController =
      ScrollOffsetController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  final ScrollOffsetListener scrollOffsetListener =
      ScrollOffsetListener.create();

  @override
  Widget build(BuildContext context) {
    return PresentableWidgetBuilder(
      presenter: controller,
      builder: () {
        HomeUiState uiState = controller.uiState.value;
        return uiState.postList.isEmpty
            ? Container(
                width: Get.width,
                height: Get.height,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      controller.doRequest();
                    },
                    child: const Text("Click to fetch post"),
                  ),
                ),
              )
            : ScrollablePositionedList.builder(
                itemCount: uiState.postList.length,
                itemBuilder: (context, index) {
                  return Text('Item ${uiState.postList[index].title}');
                },
                itemScrollController: itemScrollController,
                scrollOffsetController: scrollOffsetController,
                itemPositionsListener: itemPositionsListener,
                scrollOffsetListener: scrollOffsetListener,
              );
      },
    );
  }
}
