abstract class Enum<T> {

  final String _name;

  String get name => _name;

  const Enum(this._name);

  @override
  String toString() {
    return '${runtimeType}.${name}';
  }
}
