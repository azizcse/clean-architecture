import 'package:clean_arc/core/base/presentable_widget_builder.dart';
import 'package:clean_arc/presentation/details/presenter/detail_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetailPage extends GetView<DetailPresenter> {
  ItemDetailPage({super.key});

  final args = Get.arguments;

  @override
  Widget build(BuildContext context) {
    controller.fetchDetail(4);
    return PresentableWidgetBuilder(
        presenter: controller,
        builder: () {
          return controller.uiState.value.post == null
              ? Container(
                  width: Get.width,
                  height: Get.height,
                  child: Center(child: Text("Data loading ..........")),
                )
              : Container(
                  width: Get.width,
                  height: Get.height,
                  child: Center(
                      child: Text("${controller.uiState.value.post?.body}")),
                );
        });
  }
}
