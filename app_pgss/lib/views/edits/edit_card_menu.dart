import 'package:app_pgss/model/firebase_card_example.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditCardMenu extends GetView {
  String imageUrl;
  String text;
  EditCardMenu({super.key, required this.imageUrl, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Center(
        child: FirebaseCardExample(
          imageUrl: imageUrl,
          // Substitua pela URL da imagem do Firebase
          textContent: text.toUpperCase(), // Substitua pelo texto desejado
        ),
      ),
    );
  }
}
