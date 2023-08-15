import 'package:flutter/material.dart';
import 'package:start_tech_test/src/utils/helpers/child_size_widget.dart';


class CustomRoundedContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry screenPadding, contentPadding;
  final Color? fillColor;
  final double raduis;
  final double? width, height;
  final BoxBorder? border;
  final void Function()? onTap;
  final List<BoxShadow>? boxShadow;
  const CustomRoundedContainer({
    super.key,
    required this.child,
    this.onTap,
    this.raduis = 12,
    this.width,
    this.height,
    this.boxShadow,
    this.border,
    this.screenPadding = const EdgeInsets.symmetric(horizontal: 40),
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 10),
    this.fillColor ,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: screenPadding,
        child: !context.mounted
            ? const SizedBox.shrink()
            : ChildSizeNotifierWidget(
                builder: (context, size, childd) {
                  return Container(
                    width: width,
                    height: height,
                    // padding: contentPadding,
                    decoration: BoxDecoration(
                      boxShadow:boxShadow ,
                        border: border,
                        color: fillColor ?? Colors.white,
                        // border: Border.all(color: Colors.black, width: 0.8),
                        borderRadius: BorderRadius.circular(raduis)),
                    child:  Padding(
                            padding: contentPadding,
                            child: child,
                          )
                        
                  );
                },
              ),
      ),
    );
  }
}
