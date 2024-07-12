import 'package:flutter/material.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/ImagesPath.dart';
import 'package:meetswap/Constant/Size.dart';

class TextFieldCustomeWidget extends StatefulWidget {
  const TextFieldCustomeWidget(
      {super.key,
      required this.controller,
      this.validateBorder = false,
      this.maxLines = 1,
      required this.title,
      required this.hint,
      this.widget = AppSize.sizedBoxEmpty,
      this.onChange});
  final TextEditingController controller;
  final bool validateBorder;
  final String title;
  final String hint;
  final Widget widget;
  final int maxLines;
  final void Function(String)? onChange;
  @override
  State<TextFieldCustomeWidget> createState() => _TextFieldCustomeWidgetState();
}

class _TextFieldCustomeWidgetState extends State<TextFieldCustomeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    if (focusNode.hasFocus) {
      print("TextField gained focus");
      _controller.repeat(reverse: true);
    } else {
      print("TextField lost focus");
      _controller.stop();
      // _controller.dispose();
    }
  }

  @override
  void dispose() {
    focusNode.removeListener(_onFocusChange);
    focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.paddingElements12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              widget.title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          AppSize.sizedBox5,
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Container(
                padding:
                    EdgeInsets.all(3), // padding to show the gradient border
                decoration: BoxDecoration(
                  borderRadius: widget.maxLines == 1
                      ? BorderRadius.circular(12)
                      : BorderRadius.circular(25),
                  gradient: LinearGradient(
                    colors: widget.validateBorder
                        ? [
                            ColorTween(
                                        begin: AppColor.borderColorLightRed,
                                        end: AppColor.borderColorDarkRed)
                                    .lerp(_controller.value) ??
                                AppColor.borderColorLightRed,
                            ColorTween(
                                        begin: AppColor.borderColorDarkRed,
                                        end: AppColor.borderColorLightRed)
                                    .lerp(_controller.value) ??
                                AppColor.borderColorDarkRed,
                          ]
                        : [
                            ColorTween(
                                        begin: AppColor.white,
                                        end: AppColor.borderColor)
                                    .lerp(_controller.value) ??
                                AppColor.white,
                            ColorTween(
                                        begin: AppColor.borderColor,
                                        end: AppColor.white)
                                    .lerp(_controller.value) ??
                                AppColor.borderColor,
                          ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: widget.maxLines == 1
                        ? BorderRadius.circular(12)
                        : BorderRadius.circular(25),
                    color: focusNode.hasFocus
                        ? AppColor.white
                        : AppColor.white.withOpacity(
                            0.6), // background color of the TextField
                  ),
                  child: TextField(
                    onChanged: widget.onChange,
                    controller: widget.controller,
                    focusNode: focusNode,
                    maxLines: widget.maxLines,
                    textAlign: widget.maxLines == 1
                        ? TextAlign.start
                        : TextAlign.center,
                    decoration: InputDecoration(
                      icon: widget.widget,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 1, vertical: 14),
                      hintText: widget.hint,
                      hintMaxLines: widget.maxLines,
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: widget.maxLines == 1 ? 16 : 20),
                      border: OutlineInputBorder(
                        borderRadius: widget.maxLines == 1
                            ? BorderRadius.circular(12)
                            : BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: widget.maxLines == 1
                            ? BorderRadius.circular(12)
                            : BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: widget.maxLines == 1
                            ? BorderRadius.circular(12)
                            : BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
