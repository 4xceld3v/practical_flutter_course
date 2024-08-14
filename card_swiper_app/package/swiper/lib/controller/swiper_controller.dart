import 'dart:async';
import 'package:swiper/controller/controller_events.dart';
import 'package:swiper/utils/enums.dart';

class CardController {
  final _eventController = StreamController<ControllerEvent>.broadcast();

  Stream<ControllerEvent> get events => _eventController.stream;

  void swipe(CardSwipeDirection direction) {
    _eventController.add(ControllerSwipeEvent(direction));
  }

  void move(int index) {
    _eventController.add(ControllerMoveEvent(index));
  }

  void dispose() async {
    await _eventController.close();
  }
}