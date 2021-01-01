import 'dart:math';

import 'package:nihonto_collection_manager/Aggregate.dart';
import 'package:nihonto_collection_manager/enum_set.dart';
import 'package:nihonto_collection_manager/model/yakiba.dart';

class YakibaInfo extends EnumSet<Yakiba> with Aggregate {

  YakibaInfo([ Iterable<Yakiba> args ]): super(args);

  static YakibaInfo random() {
    final random = Random();

    return YakibaInfo(Yakiba.values.where((element) => random.nextBool()).toList());
  }

  @override
  bool isBlank() {
    return isEmpty();
  }
}