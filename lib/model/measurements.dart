import 'package:nihonto_collection_manager/Aggregate.dart';
import 'package:nihonto_collection_manager/model/length.dart';

class Measurements with Aggregate {

  static const Measurements DEFAULT = Measurements();

  final Length nagasa,
      totalLength,
      kasane,
      motokasane,
      sakikasane,
      mihaba,
      motohaba,
      sakihaba;

  const Measurements(
      {this.nagasa,
      this.totalLength,
      this.kasane,
      this.motokasane,
      this.sakikasane,
      this.mihaba,
      this.motohaba,
      this.sakihaba});

  Measurements copyWith(
      {Length nagasa,
      Length totalLength,
      Length kasane,
      Length motokasane,
      Length sakikasane,
      Length mihaba,
      Length motohaba,
      Length sakihaba}) {
    return Measurements(
        nagasa: nagasa ?? this.nagasa,
        totalLength: totalLength ?? this.totalLength,
        kasane: kasane ?? this.kasane,
        motokasane: motokasane ?? this.motokasane,
        sakikasane: sakikasane ?? this.sakikasane,
        mihaba: mihaba ?? this.mihaba,
        motohaba: motohaba ?? this.motohaba,
        sakihaba: sakihaba ?? this.sakihaba);
  }

  static Measurements random() {
    final nagasa = Length.random(min: 25, max: 75);
    final nakagoLength = Length.random(min: 15, max: 30);
    final kasane = Length.random(min: 0.5, max: 0.9);
    final mihaba = Length.random(min: 2.7, max: 3.6);

    return new Measurements(
        nagasa: nagasa,
        totalLength: nagasa + nakagoLength,
        kasane: kasane,
        motokasane: kasane,
        sakikasane: kasane,
        mihaba: mihaba,
        motohaba: mihaba,
        sakihaba: mihaba);
  }

  @override
  bool isBlank() {
    return (nagasa == null) &&
        (totalLength == null) &&
        (kasane == null) &&
        (motokasane == null) &&
        (sakikasane == null) &&
        (mihaba == null) &&
        (motohaba == null) &&
        (sakihaba == null);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Measurements &&
          runtimeType == other.runtimeType &&
          nagasa == other.nagasa &&
          totalLength == other.totalLength &&
          kasane == other.kasane &&
          motokasane == other.motokasane &&
          sakikasane == other.sakikasane &&
          mihaba == other.mihaba &&
          motohaba == other.motohaba &&
          sakihaba == other.sakihaba;

  @override
  int get hashCode =>
      nagasa.hashCode ^
      totalLength.hashCode ^
      kasane.hashCode ^
      motokasane.hashCode ^
      sakikasane.hashCode ^
      mihaba.hashCode ^
      motohaba.hashCode ^
      sakihaba.hashCode;
}
