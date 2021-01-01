import 'dart:math';

import 'package:nihonto_collection_manager/Aggregate.dart';
import 'package:nihonto_collection_manager/enum_set.dart';
import 'package:nihonto_collection_manager/model/hamon_type.dart';

class HamonInfo extends EnumSet<HamonType> with Aggregate {

  HamonInfo([ Iterable<HamonType> args ]): super(args);

  static HamonInfo random() {
    final random = Random();

    return HamonInfo(HamonType.values.where((element) => random.nextBool()).toList());
  }

  @override
  bool isBlank() {
    return isEmpty();
  }
}