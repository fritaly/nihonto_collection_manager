import 'package:nihonto_collection_manager/extensions.dart';
import 'package:nihonto_collection_manager/model/boshi_info.dart';
import 'package:nihonto_collection_manager/model/hada_info.dart';
import 'package:nihonto_collection_manager/model/hamon_info.dart';
import 'package:nihonto_collection_manager/model/kissaki_type.dart';
import 'package:nihonto_collection_manager/model/mune_type.dart';
import 'package:nihonto_collection_manager/model/nakago_info.dart';
import 'package:nihonto_collection_manager/model/signature.dart';
import 'package:nihonto_collection_manager/model/sori_info.dart';
import 'package:nihonto_collection_manager/model/sori_type.dart';
import 'package:nihonto_collection_manager/model/yakiba_info.dart';
import 'package:nihonto_collection_manager/model/yasurime_info.dart';
import 'package:nihonto_collection_manager/utils.dart';
import 'package:nihonto_collection_manager/model/geometry.dart';
import 'package:nihonto_collection_manager/model/length.dart';
import 'package:nihonto_collection_manager/model/money.dart';
import 'package:nihonto_collection_manager/model/nihonto_type.dart';

class Nihonto {
  final NihontoType type;

  // The signature should never be null
  final Signature signature;

  final Geometry geometry;

  final Money price;

  final Length nagasa;

  final SoriType soriType;

  final HadaInfo hada;

  final SoriInfo sori;

  final KissakiType kissakiType;

  final MuneType muneType;

  final HamonInfo hamonInfo;

  final YakibaInfo yakibaInfo;

  final BoshiInfo boshiInfo;

  final NakagoInfo nakagoInfo;

  final YasurimeInfo yasurimeInfo;

  const Nihonto(
      {this.type,
      this.geometry,
      this.signature = Signature.EMPTY,
      this.price = Money.ZERO,
      this.nagasa,
      this.sori,
      this.soriType,
      this.hada = HadaInfo.DEFAULT,
      this.kissakiType,
      this.muneType,
      this.hamonInfo,
      this.yakibaInfo,
      this.boshiInfo,
      this.nakagoInfo,
      this.yasurimeInfo});

  static Nihonto random() {
    return Nihonto(
        type: Utils.randomNihontoType(),
        geometry: Utils.randomGeometry(),
        signature: Signature.random(),
        price: Money.random(),
        nagasa: Length.random(min: 25, max: 75),
        sori: SoriInfo.random(),
        soriType: Utils.randomSoriType(),
        hada: HadaInfo.random(),
        kissakiType: Utils.randomKissakiType(),
        muneType: Utils.randomMuneType(),
        hamonInfo: HamonInfo.random(),
        yakibaInfo: YakibaInfo.random(),
        boshiInfo: BoshiInfo.random(),
        nakagoInfo: NakagoInfo.random(),
        yasurimeInfo: YasurimeInfo.random()
    );
  }

  String get description {
    return "${type?.label} - ${geometry?.label} (${nagasa?.toText()})";
  }

  String toString() {
    return "Nihonto[type: ${type?.name}, signature: '${signature}', geometry: ${geometry}, price: ${price}, nagasa: ${nagasa}, sori: ${sori}, soriType: ${soriType?.name}, hada: ${hada}, kissakiType: ${kissakiType}]";
  }
}
