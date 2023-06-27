import 'package:chess/chess.dart';
import 'package:chessgame/controller/chess_board_controller.dart';
import 'package:chessgame/view/chess_board.dart';
import 'package:chessgame/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('Test makeMove method', () {
    ChessBoardController controller = ChessBoardController();
    controller.makeMove(from: 'e2', to: 'e4');
    expect(controller.getFen(), equals('rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR w KQkq - 0 1'));
  });

  test('Test putPiece method', () {
    ChessBoardController controller = ChessBoardController.fromGame(Chess());

    // Put a piece on the board and check if it is placed on the correct square
    controller.putPiece(BoardPieceType.Pawn, 'e4', PlayerColor.white);
    List<Piece?> board = controller.getBoard();
    expect(board[28]?.type, equals(PieceType.PAWN));
    expect(board[28]?.color, equals(Color.WHITE));
  });

  test('Test undoMove method', () {
    ChessBoardController controller =
        ChessBoardController.fromFEN('rnbqkbnr/pppp1ppp/8/4p3/4P3/8/PPPP1PPP/RNBQKBNR w KQkq - 0 2');

    // Make a move and check if it is applied
    controller.makeMove(from: 'e2', to: 'e4');
    expect(controller.getFen(), equals('rnbqkbnr/pppp1ppp/8/4p3/4P3/4P3/PPPP1PPP/RNBQKBNR b KQkq e3 0 2'));

    // Undo the last move and check if it is reverted
    controller.undoMove();
    expect(controller.getFen(), equals('rnbqkbnr/pppp1ppp/8/4p3/4P3/8/PPPP1PPP/RNBQKBNR w KQkq - 0 2'));
  });

    testWidgets('ChessBoard widget is rendered correctly', (WidgetTester tester) async {
      // Create a test ChessBoard with valid inputs
      final chessBoard = ChessBoard(
        size: 400,
        controller: ChessBoardController(),
        boardColor: BoardColor.brown,
        boardOrientation: PlayerColor.white,
      );
    
      // Render the widget onto the screen
      await tester.pumpWidget(MaterialApp(home: chessBoard));
    
      // Check that the ChessBoard has a fixed size and contains a grid of exactly 64 squares
      expect(find.byType(SizedBox), findsOneWidget);
      expect(find.byType(GridView), findsOneWidget);
      expect(find.byType(DragTarget), findsNWidgets(64));
    });

}
