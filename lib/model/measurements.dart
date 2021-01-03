
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nihonto_collection_manager/aggregate.dart';
import 'package:nihonto_collection_manager/model/length.dart';
import 'package:nihonto_collection_manager/model/length_unit.dart';
import 'package:nihonto_collection_manager/model/weight.dart';

part 'measurements.g.dart';

abstract class Measurements with Aggregate implements Built<Measurements, MeasurementsBuilder> {

  static Serializer<Measurements> get serializer => _$measurementsSerializer;

  // See https://github.com/google/built_value.dart/issues/212#issuecomment-632702910
  static void _initializeBuilder(MeasurementsBuilder builder) => builder;

  Measurements._();

  factory Measurements([updates(MeasurementsBuilder b)]) = _$Measurements;

  @nullable
  Length get nagasa;

  @nullable
  Length get totalLength;

  @nullable
  Length get kasane;

  @nullable
  Length get motokasane;

  @nullable
  Length get sakikasane;

  @nullable
  Length get mihaba;

  @nullable
  Length get motohaba;

  @nullable
  Length get sakihaba;

  @nullable
  Weight get weight;

  static Measurements random() {
    final nagasa = Length.random(LengthUnit.CM, min: 25, max: 75);
    final nakagoLength = Length.random(LengthUnit.CM, min: 15, max: 30);
    final kasane = Length.random(LengthUnit.CM, min: 0.5, max: 0.9);
    final mihaba = Length.random(LengthUnit.CM, min: 2.7, max: 3.6);

    return new Measurements((builder) => builder
        ..nagasa = nagasa
        ..totalLength = nagasa + nakagoLength
        ..kasane = kasane
        ..motokasane = kasane
        ..sakikasane = kasane
        ..mihaba = mihaba
        ..motohaba = mihaba
        ..sakihaba = mihaba
        ..weight = Weight.random(700, 1200)
    );
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
        (sakihaba == null) &&
        (weight == null);
  }
}
