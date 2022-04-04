import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  final String? errorMessage;
  final Function() onPressed;

  const Error({Key? key, this.errorMessage, required this.onPressed}) 
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            errorMessage!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            child: const Text('Retry', style: TextStyle(color: Colors.white)),
            onPressed: onPressed,
          )
        ],
      ),
    );
  }
}