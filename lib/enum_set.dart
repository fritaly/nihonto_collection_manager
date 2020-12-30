class EnumSet<T> {

  final _set = Set<T>();

  EnumSet([ Iterable<T> args ]) {
    if (args != null) {
      _set.addAll(args);
    }
  }

  EnumSet<T> operator +(T value) {
    assert (value != null);

    var set = Set<T>.from(_set);
    set.add(value);

    return EnumSet(set);
  }

  EnumSet<T> operator -(T value) {
    assert (value != null);

    var set = Set<T>.from(_set);
    set.remove(value);

    return EnumSet(set);
  }

  bool contains(T value) {
    assert (value != null);

    return _set.contains(value);
  }

  List<T> values() {
    return _set.toList();
  }

  @override
  String toString() {
    return '${runtimeType}[set: ${_set}]';
  }
}