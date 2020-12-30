import 'dart:math';

import 'package:nihonto_collection_manager/enum_set.dart';
import 'package:nihonto_collection_manager/model/hada.dart';

class HadaInfo extends EnumSet<Hada> {

  HadaInfo([ Iterable<Hada> args ]): super(args);

  static HadaInfo random() {
    final random = Random();

    return HadaInfo(Hada.values.where((element) => random.nextBool()).toList());
  }
}