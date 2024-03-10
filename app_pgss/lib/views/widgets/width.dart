import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Width extends GetView {
  const Width(this.width, {Key? key}) : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}
