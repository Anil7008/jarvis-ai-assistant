import 'package:flutter/material.dart';

export 'flutter_flow_theme.dart';

extension BuildContextExtension on BuildContext {
  void unfocus() {
    FocusScope.of(this).unfocus();
  }
}
