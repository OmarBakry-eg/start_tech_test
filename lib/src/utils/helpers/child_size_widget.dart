import 'package:flutter/material.dart';

class ChildSizeNotifierWidget extends StatelessWidget {
  final ValueNotifier<Size>? notifier = ValueNotifier(const Size(0, 0));
  final Widget Function(BuildContext context, Size size, Widget? child) builder;
  final Widget? child;
  ChildSizeNotifierWidget({super.key, required this.builder, this.child});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        notifier?.value = (context.findRenderObject() as RenderBox).size);
    return ValueListenableBuilder(
      valueListenable: notifier!,
      builder: builder,
      child: child,
    );
  }
}
