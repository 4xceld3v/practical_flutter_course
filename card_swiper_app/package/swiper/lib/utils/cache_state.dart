
class CacheState<T> {

  CacheState(this._value, {CacheState<T>? previousValue})
  : _previous = previousValue;

  T _value;

  CacheState<T>? _previous;

  T get state => _value;

  T? get previousState => _previous?.state;

  set state(T newValue) {
    _previous = CacheState(_value, previousValue: _previous);
    _value = newValue;
  }

  void undo() {
    if (_previous != null) {
      _value = _previous!.state;
      _previous = _previous!._previous;
    }
  }

  
}