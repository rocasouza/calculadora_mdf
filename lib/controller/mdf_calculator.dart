// mdf_calculator.dart
import 'package:calculadora_mdf/model/piece.dart';
import 'package:calculadora_mdf/model/mdf_sheet.dart';

class MDFCalculator {
  double calculatePieceCost(Piece piece, double fabricationTime, double pricePerMinute) {
    // Calcula o custo da peça
    double pieceArea = piece.width * piece.length;
    double fabricationCost = fabricationTime * pricePerMinute;
    return (pieceArea + fabricationCost)/100;
  }

  int calculateSheetsNeeded(Piece piece, MDFSheet sheet) {
    // Calcula o número de chapas de MDF necessárias
    double pieceArea = piece.width * piece.length;
    double sheetArea = sheet.width * sheet.length;
    return (pieceArea / sheetArea).ceil();
  }
}
