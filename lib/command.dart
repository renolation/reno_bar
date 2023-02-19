
import 'package:flame/components.dart';

class Command<T extends Component>{

  Command({required this.action});

  void Function(T target) action;

  void run(Component c) {
    if (c is T) {
      action.call(c);
    }
  }
}