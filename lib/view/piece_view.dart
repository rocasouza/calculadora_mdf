// piece_view.dart
import 'package:flutter/material.dart';
import 'package:calculadora_mdf/model/piece.dart';

class PieceView extends StatefulWidget {
  @override
  _PieceViewState createState() => _PieceViewState();
}

class _PieceViewState extends State<PieceView> {
  TextEditingController widthController = TextEditingController();
  TextEditingController lengthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dados da Peça'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: widthController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Largura (cm)',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: lengthController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Comprimento (cm)',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Criar objeto Piece com os dados inseridos pelo usuário
                Piece piece = Piece(
                  width: double.parse(widthController.text),
                  length: double.parse(lengthController.text),
                );
                // Navegar para a próxima tela (MDFSheetView) passando o objeto Piece
                Navigator.pushNamed(
                  context,
                  '/mdf_sheet',
                  arguments: piece,
                );
              },
              child: Text('Próximo'),
            ),
          ],
        ),
      ),
    );
  }
}
