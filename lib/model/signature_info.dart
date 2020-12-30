import 'dart:math';

import 'package:nihonto_collection_manager/enum_set.dart';
import 'package:nihonto_collection_manager/model/signature_type.dart';

class SignatureInfo extends EnumSet<SignatureType> {

  SignatureInfo([ Iterable<SignatureType> args ]): super(args);

  static SignatureInfo random() {
    final random = Random();

    return SignatureInfo(SignatureType.values.where((element) => random.nextBool()).toList());
  }
}
