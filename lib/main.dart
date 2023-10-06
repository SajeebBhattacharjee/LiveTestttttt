import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Size Selector')),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 0.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizeButton('S'),
                  SizeButton('M'),
                  SizeButton('L'),
                  SizeButton('XL'),
                ],
              ),
              SizedBox(height: 0.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizeButton('XXXL'),
                  SizeButton('XXL'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SizeButton extends StatefulWidget {
  final String size;

  SizeButton(this.size);

  @override
  _SizeButtonState createState() => _SizeButtonState();
}

class _SizeButtonState extends State<SizeButton> {
  Color buttonColor = Colors.grey;
  static _SizeButtonState? previousButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      margin: EdgeInsets.all(5.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            if (previousButton != null) {
              previousButton!.setState(() {
                previousButton!.buttonColor = Colors.grey;
              });
            }
            buttonColor = Colors.orange;
            previousButton = this;
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Button ${widget.size} is pressed'),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
        ),
        child: Text(widget.size),
      ),
    );
  }
}
