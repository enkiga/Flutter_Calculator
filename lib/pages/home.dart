import 'package:flutter/material.dart';
import 'package:calculator/resources/calcButton.dart';
import 'package:math_expressions/math_expressions.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);

    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      _history = _expression;
      _expression = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        elevation: 0,
        title: const Text(
          'Calculator',
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.only(right: 12),
            child: Text(
              _history,
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 24.0,
                color: Colors.grey[500],
              ),
            ),
            alignment: const Alignment(1, 1),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            child: Text(
              _expression,
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 48.0,
                color: Colors.grey[200],
              ),
            ),
            alignment: const Alignment(1, 1),
          ),
          const SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalcButton(
                text: 'AC',
                fillColor: const Color(0xFFFF8F00),
                textColor: Colors.black,
                textSize: 20.0,
                callback: allClear,
              ),
              CalcButton(
                text: 'C',
                fillColor: const Color(0xFFFF8F00),
                textColor: Colors.black,
                textSize: 28.0,
                callback: clear,
              ),
              CalcButton(
                text: '%',
                fillColor: const Color(0xFFE0E0E0),
                textColor: Colors.black,
                textSize: 28.0,
                callback: numClick,
              ),
              CalcButton(
                text: '/',
                fillColor: const Color(0xFFE0E0E0),
                textColor: Colors.black,
                textSize: 28.0,
                callback: numClick,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalcButton(
                text: '7',
                fillColor: const Color(0xFF424242),
                textColor: Colors.white,
                textSize: 28.0,
                callback: numClick,
              ),
              CalcButton(
                text: '8',
                fillColor: const Color(0xFF424242),
                textColor: Colors.white,
                textSize: 28.0,
                callback: numClick,
              ),
              CalcButton(
                text: '9',
                fillColor: const Color(0xFF424242),
                textColor: Colors.white,
                textSize: 28.0,
                callback: numClick,
              ),
              CalcButton(
                text: '*',
                fillColor: const Color(0xFFE0E0E0),
                textColor: Colors.black,
                textSize: 28.0,
                callback: numClick,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalcButton(
                text: '4',
                fillColor: const Color(0xFF424242),
                textColor: Colors.white,
                textSize: 28.0,
                callback: numClick,
              ),
              CalcButton(
                text: '5',
                fillColor: const Color(0xFF424242),
                textColor: Colors.white,
                textSize: 28.0,
                callback: numClick,
              ),
              CalcButton(
                text: '6',
                fillColor: const Color(0xFF424242),
                textColor: Colors.white,
                textSize: 28.0,
                callback: numClick,
              ),
              CalcButton(
                text: '-',
                fillColor: const Color(0xFFE0E0E0),
                textColor: Colors.black,
                textSize: 28.0,
                callback: numClick,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalcButton(
                text: '1',
                fillColor: const Color(0xFF424242),
                textColor: Colors.white,
                textSize: 28.0,
                callback: numClick,
              ),
              CalcButton(
                text: '2',
                fillColor: const Color(0xFF424242),
                textColor: Colors.white,
                textSize: 28.0,
                callback: numClick,
              ),
              CalcButton(
                text: '3',
                fillColor: const Color(0xFF424242),
                textColor: Colors.white,
                textSize: 28.0,
                callback: numClick,
              ),
              CalcButton(
                text: '+',
                fillColor: const Color(0xFFE0E0E0),
                textColor: Colors.black,
                textSize: 28.0,
                callback: numClick,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalcButton(
                text: '.',
                fillColor: const Color(0xFFE0E0E0),
                textColor: Colors.black,
                textSize: 28.0,
                callback: numClick,
              ),
              CalcButton(
                text: '0',
                fillColor: const Color(0xFF424242),
                textColor: Colors.white,
                textSize: 28.0,
                callback: numClick,
              ),
              CalcButton(
                text: '00',
                fillColor: const Color(0xFF424242),
                textColor: Colors.white,
                textSize: 28.0,
                callback: numClick,
              ),
              CalcButton(
                text: '=',
                fillColor: const Color(0xFFE0E0E0),
                textColor: Colors.black,
                textSize: 28.0,
                callback: evaluate,
              )
            ],
          ),
        ],
      ),
    );
  }
}
