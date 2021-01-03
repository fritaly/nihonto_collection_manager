import 'package:nihonto_collection_manager/utils.dart';

class EnumSet<T> {

  final Set<T> _set;

  const EnumSet.empty(): _set = const {};

  EnumSet([ Iterable<T> args ]): _set = Set() {
    if (args != null) {
      _set.addAll(args);
    }
  }

  EnumSet.from(Iterable<T> args): this(args);

  /// Returns an EnumSet containing values randomly chosen from the given iterable
  EnumSet.random(Iterable<T> args): this(Utils.randomSublist(args.toList()));

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

  /// Returns the number of elements in the set
  int get length => _set.length;

  /// Tells whether the set is empty.
  bool isEmpty() => _set.isEmpty;

  List<T> values() {
    return _set.toList();
  }

  @override
  String toString() {
    return '${runtimeType}[set: ${_set}]';
  }
}