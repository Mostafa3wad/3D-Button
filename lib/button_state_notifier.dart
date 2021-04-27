import 'package:flutter/foundation.dart';

class ButtonStateNotifier extends ChangeNotifier {
  double elevationY;

  ButtonStateNotifier(this.elevationY) {
    elevation = elevationY+elevationY*0.1;
  }

  double topPosition = 5;
  double elevation ;

  void triggerButtonDown(double position) {
    topPosition = position;
    elevation = 0;
    notifyListeners();
  }

  void triggerButtonUp() {
    Future.delayed(const Duration(milliseconds: 100), () {
      topPosition = 0;
      elevation =  elevationY+elevationY*0.1+10;
      notifyListeners();
    });
  }

  void triggerOnMouseHover() {
    topPosition = 0;
    elevation = elevationY+elevationY*0.1+10;
    notifyListeners();
  }

  void triggerOnMouseExit() {
    topPosition = 5;
    elevation = elevationY+elevationY*0.1;
    notifyListeners();
  }
}
