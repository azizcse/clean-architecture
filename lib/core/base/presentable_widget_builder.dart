import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

// wrapper around GetX, to decouple this unmaintained library from our codebase
class PresentableWidgetBuilder<T extends DisposableInterface> extends GetX {
  PresentableWidgetBuilder({
    super.key,
    T? presenter,
    VoidCallback? onInit,
    VoidCallback? dispose,
    required Widget Function() builder,
  }) : super(
          init: presenter,
          initState: onInit == null ? null : (_) => onInit(),
          builder: (_) => builder(),
          dispose: (_) => dispose == null ? null : dispose(),
        );
}