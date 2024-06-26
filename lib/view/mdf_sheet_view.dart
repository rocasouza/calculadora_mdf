import 'package:flutter/material.dart';
import 'package:calculadora_mdf/controller/mdf_calculator.dart';
import 'package:calculadora_mdf/model/piece.dart';
import 'package:calculadora_mdf/model/mdf_sheet.dart';

class MDFSheetView extends StatefulWidget {
  @override
  _MDFSheetViewState createState() => _MDFSheetViewState();
}

class _MDFSheetViewState extends State<MDFSheetView> {
  TextEditingController priceController = TextEditingController();
  TextEditingController timeController  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Piece piece = ModalRoute.of(context)!.settings.arguments as Piece;

    return Scaffold(
      appBar: AppBar(
        title: Text('Dados da Chapa de MDF'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Peça: ${piece.width} cm x ${piece.length} cm',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Preço da chapa de MDF',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: timeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Tempo de fabricação',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Criar objeto Piece com os dados inseridos pelo usuário
                var mdfSheet = MDFSheet(
                  pricePerSheet: double.parse(priceController.text),
                );
                MDFSheet mdfsheet = mdfSheet;
                MDFCalculator calculator = MDFCalculator();
                double pieceCost = calculator.calculatePieceCost(piece,double.parse(timeController.text), 0.93);
                int sheetsNeeded = calculator.calculateSheetsNeeded(piece, mdfsheet);

                // Mostrar resultados em um diálogo
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Resultados'),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Custo da peça: R\$ ${pieceCost.toStringAsFixed(2)}'),
                          SizedBox(height: 8.0),
                          Text('Número de chapas de MDF necessárias: $sheetsNeeded'),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Fechar'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Calcular'),
            ),
          ],
        ),
      ),
    );
  }
}
