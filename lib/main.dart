import 'package:chessgame/view/chess_board.dart';
import 'package:chessgame/widgets/constants.dart';
import 'package:flutter/material.dart';

import 'controller/chess_board_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chess Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
        
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ChessBoardController controller = ChessBoardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chess App'),
        centerTitle: true,
      ),
      body: Center(
        child: ChessBoard(
          controller: controller,
          boardColor: BoardColor.green,
          boardOrientation: PlayerColor.white,
        ),
      ),
    );
  }
}