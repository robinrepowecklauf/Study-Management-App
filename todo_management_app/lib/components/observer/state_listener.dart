abstract class StateListener {
  void onStateChanged(ObserverState state);
}

enum ObserverState { INIT, SUBJECT_CREATED, FILL_COLOR }
