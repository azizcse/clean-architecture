import 'package:clean_arc/core/base/presentable_widget_builder.dart';
import 'package:clean_arc/ui/details/detail_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetailPage extends GetView<DetailPresenter> {
  ItemDetailPage({super.key});

  final args = Get.arguments;

  @override
  Widget build(BuildContext context) {
    //DetailPresenter _presenter = Get.find<DetailPresenter>();
    return PresentableWidgetBuilder(
        presenter: controller,
        builder: () {
          return controller.uiState.value.post == null
              ? Container(
                  child: Text("Body text"),
                )
              : Container(
                  child: Text("Not Null"),
                );
        });
  }
}
