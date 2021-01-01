import 'dart:math';

import 'package:nihonto_collection_manager/Aggregate.dart';
import 'package:nihonto_collection_manager/enum_set.dart';
import 'package:nihonto_collection_manager/model/hada_type.dart';

class HadaInfo extends EnumSet<HadaType> with Aggregate {

  HadaInfo([ Iterable<HadaType> args ]): super(args);

  static HadaInfo random() {
    final random = Random();

    return HadaInfo(HadaType.values.where((element) => random.nextBool()).toList());
  }

  @override
  bool isBlank() {
    return isEmpty();
  }
}