import 'package:todo_management_app/components/observer/state_listener.dart';

class StateProvider {
  List<StateListener> observers;
  static final StateProvider _instance = new StateProvider.internal();

  factory StateProvider() => _instance;

  StateProvider.internal() {
    observers = new List<StateListener>();
    initState();
  }
  void initState() async {
    notify(ObserverState.INIT);
  }

  void subscribe(StateListener listener) {
    observers.add(listener);
  }

  void notify(dynamic state) {
    observers.forEach((StateListener obj) => obj.onStateChanged(state));
  }

  void dispose(StateListener thisObserver) {
    for (var obj in observers) {
      if (obj == thisObserver) {
        observers.remove(obj);
      }
    }
  }
}
