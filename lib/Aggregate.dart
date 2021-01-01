/// An object aggregating data
abstract class Aggregate {

  // This class is intended to be used as a mixin, and should not be extended
  // directly.
  factory Aggregate._() => null;

  /// Tells whether the data aggregate is blank (that is all the pieces of
  /// information are set to their default value)
  bool isBlank();
}