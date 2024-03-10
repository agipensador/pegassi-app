import 'package:flutter/material.dart';

class FirebaseCardExample extends StatelessWidget {
  final String imageUrl; // URL da imagem do Firebase
  final String textContent; // Texto do Firebase

  FirebaseCardExample({required this.imageUrl, required this.textContent});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5, // Elevação da sombra do card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), // Cantos arredondados
      ),
      child: Row(
        children: [
          // Imagem à esquerda
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16), // Image border
                child: SizedBox.fromSize(
                  size: Size.fromRadius(52), // Image radius
                  child: Image.network(imageUrl, fit: BoxFit.cover),
                ),
              )
            ),
          ),
          // Texto centralizado à direita
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  textContent,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
