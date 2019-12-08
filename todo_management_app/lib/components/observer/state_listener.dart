abstract class StateListener {
  void onStateChanged(ObserverState state);
}

enum ObserverState { INIT, UPDATE_LIST }
