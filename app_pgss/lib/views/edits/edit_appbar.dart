import 'package:app_pgss/resources/theme/app_style.dart';
import 'package:app_pgss/views/screens/fragments/fragment_button_open_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditAppbar extends GetView {
  final Widget? iconLeft;
  final String? title;
  const EditAppbar({Key? key, this.iconLeft, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        iconLeft ?? const SizedBox(),
        Flexible(
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              title ?? '',
              textAlign: TextAlign.center,
              style: AppStyles.title.copyWith(
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: Colors.grey.shade900.withOpacity(1.0),
                    offset: const Offset(1.0, 1.0),
                    blurRadius: 1.0,
                  ),
                ],
              ),
            ),
          ),
        ),
        FragmentButtonOpenShowModal(),
      ],
    );
  }
}
