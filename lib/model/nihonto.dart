import 'package:nihonto_collection_manager/model/boshi_info.dart';
import 'package:nihonto_collection_manager/model/geometry.dart';
import 'package:nihonto_collection_manager/model/hada_info.dart';
import 'package:nihonto_collection_manager/model/hamon_info.dart';
import 'package:nihonto_collection_manager/model/kissaki_type.dart';
import 'package:nihonto_collection_manager/model/length.dart';
import 'package:nihonto_collection_manager/model/money.dart';
import 'package:nihonto_collection_manager/model/mune_type.dart';
import 'package:nihonto_collection_manager/model/nakago_info.dart';
import 'package:nihonto_collection_manager/model/nihonto_type.dart';
import 'package:nihonto_collection_manager/model/signature.dart';
import 'package:nihonto_collection_manager/model/sori_info.dart';
import 'package:nihonto_collection_manager/model/sori_type.dart';
import 'package:nihonto_collection_manager/model/yakiba_info.dart';
import 'package:nihonto_collection_manager/model/yasurime_info.dart';

class Nihonto {
  final NihontoType type;

  // The signature should never be null
  final Signature signature;

  final Geometry geometry;

  final Money price;

  final Length nagasa, totalLength, kasane, motokasane, sakikasane;

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
      this.totalLength,
      this.kasane,
      this.motokasane,
      this.sakikasane,
      this.sori,
      this.soriType,
      this.hada,
      this.kissakiType,
      this.muneType,
      this.hamonInfo,
      this.yakibaInfo,
      this.boshiInfo,
      this.nakagoInfo,
      this.yasurimeInfo});

  static Nihonto random() {
    final nagasa = Length.random(min: 25, max: 75);
    final nakagoLength = Length.random(min: 15, max: 30);

    final kasane = Length.random(min: 0.5, max: 0.9);

    return Nihonto(
        type: NihontoType.random(),
        geometry: Geometry.random(),
        signature: Signature.random(),
        price: Money.random(),
        nagasa: nagasa,
        totalLength: nagasa + nakagoLength,
        kasane: kasane,
        motokasane: kasane,
        sakikasane: kasane,
        sori: SoriInfo.random(),
        soriType: SoriType.random(),
        hada: HadaInfo.random(),
        kissakiType: KissakiType.random(),
        muneType: MuneType.random(),
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
    return "Nihonto[type: ${type}, signature: '${signature}', geometry: ${geometry}, price: ${price}, nagasa: ${nagasa}, sori: ${sori}, soriType: ${soriType}, hada: ${hada}, kissakiType: ${kissakiType}]";
  }
}
