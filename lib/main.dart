// main.dart
import 'package:flutter/material.dart';
import 'package:calculadora_mdf/view/piece_view.dart';
import 'package:calculadora_mdf/view/mdf_sheet_view.dart';

void main() {
  runApp(MaterialApp(
    title: 'Calculadora MDF',
    initialRoute: '/',
    routes: {
      '/': (context) => PieceView(),
      '/mdf_sheet': (context) => MDFSheetView(),
    },
  ));
}
