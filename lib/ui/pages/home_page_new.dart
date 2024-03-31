import 'package:clean_arc/core/base/presentable_widget_builder.dart';
import 'package:clean_arc/ui/controller/home/home_presenter.dart';
import 'package:clean_arc/ui/controller/home/home_ui_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomePageNew extends StatelessWidget {
  const HomePageNew({super.key});

  @override
  Widget build(BuildContext context) {
    final HomePresenter presenter = Get.find<HomePresenter>();
    final ItemScrollController itemScrollController = ItemScrollController();
    final ScrollOffsetController scrollOffsetController =
        ScrollOffsetController();
    final ItemPositionsListener itemPositionsListener =
        ItemPositionsListener.create();
    final ScrollOffsetListener scrollOffsetListener =
        ScrollOffsetListener.create();
    return PresentableWidgetBuilder(
      presenter: presenter,
      builder: () {
        HomeUiState uiState = presenter.uiState.value;
        return uiState.postList.isEmpty
            ? Container(
                width: Get.width,
                height: Get.height,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      presenter.doRequest();
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
      },
    );
  }
}
