import 'package:flutter/material.dart';

Future<dynamic> showConfirmationDialog(context,
    {String title = "Atenção!",
    String content = "Você realmente deseja realizar esta operação?",
    String affirmativeOption = "Confirmar"}) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              const Icon(
                Icons.warning,
                color: Colors.brown,
              ),
              const SizedBox(width: 8),
              Text(title)
            ],
          ),
          content: Text(content),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: const Text("Cancelar")),
            TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Text(
                  affirmativeOption.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ],
        );
      });
}
