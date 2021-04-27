import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyButton extends StatefulWidget {
  Widget child;
  Function onTap;
  Color color;
  final double width, height, buttonHeight;
  MyButton({
    this.child,
    @required this.onTap,
    this.color = Colors.blueGrey,
    this.height = 40,
    this.width = 160,
    this.buttonHeight = 5
  });
  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  double y = 5;
  double elevation = 8;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (f) {
        setState(() {
          y = 10;
          elevation = 0;
        });
      },
      onTapUp: (s) {
        Future.delayed(Duration(milliseconds: 100), () {
          setState(() {
            y = 0;
            elevation = 17;
          });
        });
      },
      child: MouseRegion(
        onHover: (event) {
          setState(() {
            y = 0;
            elevation = 17;
          });
        },
        onExit: (event) {
          setState(() {
            y = 5;
            elevation = 8;
          });
        },
        child: Container(
          width: widget.width,
          height: widget.height + 20,
          child: Stack(
            children: [
              Positioned(
                  bottom: widget.buttonHeight,
                  child: Container(
                    width: widget.width,
                    height: widget.height,
                    decoration: BoxDecoration(
                      color: widget.color,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  )),
              AnimatedPositioned(
                top: y,
                duration: Duration(milliseconds: 400),
                curve: Curves.bounceOut,
                child: AnimatedContainer(
                    alignment: Alignment.center,
                    duration: Duration(milliseconds: 400),
                    curve: Curves.bounceOut,
                    width: widget.width,
                    height: widget.height + 5,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                        color: widget.color,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, elevation),
                          )
                        ]),
                    child: widget.child),
              )
            ],
          ),
        ),
      ),
    );
  }
}
