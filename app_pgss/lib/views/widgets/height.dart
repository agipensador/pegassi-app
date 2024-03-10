import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Height extends GetView {
  const Height(this.height, {Key? key}) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}
