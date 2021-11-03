import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  final String texto;

  Progress({this.texto = 'Loading'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(texto, style: TextStyle(fontSize: 16.0),),
          ),
        ],
      ),
    );
  }
}
