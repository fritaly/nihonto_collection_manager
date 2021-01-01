import 'package:nihonto_collection_manager/model/bohi_info.dart';
import 'package:nihonto_collection_manager/model/boshi_info.dart';
import 'package:nihonto_collection_manager/model/hada_info.dart';
import 'package:nihonto_collection_manager/model/hamon_info.dart';
import 'package:nihonto_collection_manager/model/kissaki_info.dart';
import 'package:nihonto_collection_manager/model/measurements.dart';
import 'package:nihonto_collection_manager/model/money.dart';
import 'package:nihonto_collection_manager/model/mune_info.dart';
import 'package:nihonto_collection_manager/model/nakago_info.dart';
import 'package:nihonto_collection_manager/model/nihonto_type.dart';
import 'package:nihonto_collection_manager/model/period.dart';
import 'package:nihonto_collection_manager/model/polish_info.dart';
import 'package:nihonto_collection_manager/model/signature.dart';
import 'package:nihonto_collection_manager/model/signature_info.dart';
import 'package:nihonto_collection_manager/model/sori_info.dart';
import 'package:nihonto_collection_manager/model/sugata_info.dart';
import 'package:nihonto_collection_manager/model/weight.dart';
import 'package:nihonto_collection_manager/model/yakiba_info.dart';
import 'package:nihonto_collection_manager/model/yasurime_info.dart';

class Nihonto {
  final String overallDescription;

  final NihontoType type;

  // The signature should never be null
  final Signature signature;

  final SignatureInfo signatureInfo;

  final SugataInfo sugataInfo;

  final Money price;

  final Measurements measurements;

  final Weight weight;

  final HadaInfo hada;

  final SoriInfo soriInfo;

  final KissakiInfo kissakiInfo;

  final MuneInfo muneInfo;

  final HamonInfo hamonInfo;

  final YakibaInfo yakibaInfo;

  final BoshiInfo boshiInfo;

  final String boshiOther;

  final NakagoInfo nakagoInfo;

  final YasurimeInfo yasurimeInfo;

  final String yasurimeOther;

  final BohiInfo bohiInfo;

  final PolishInfo polishInfo;

  final Period period;

  const Nihonto(
      {
      this.overallDescription,
      this.type,
      this.sugataInfo = SugataInfo.DEFAULT,
      this.signature = Signature.EMPTY,
      this.signatureInfo,
      this.price = Money.ZERO,
      this.measurements = Measurements.DEFAULT,
      this.weight,
      this.soriInfo = SoriInfo.DEFAULT,
      this.hada = HadaInfo.DEFAULT,
      this.kissakiInfo = KissakiInfo.DEFAULT,
      this.muneInfo = MuneInfo.DEFAULT,
      this.hamonInfo = HamonInfo.DEFAULT,
      this.yakibaInfo = YakibaInfo.DEFAULT,
      this.boshiInfo = BoshiInfo.DEFAULT,
      this.boshiOther,
      this.nakagoInfo = NakagoInfo.DEFAULT,
      this.yasurimeInfo,
      this.yasurimeOther,
      this.bohiInfo = BohiInfo.DEFAULT,
      this.polishInfo = PolishInfo.DEFAULT,
      this.period
    });

  static Nihonto random() {
    return Nihonto(
        overallDescription: 'Description goes here...\nDescription goes here...\nDescription goes here...',
        type: NihontoType.random(),
        sugataInfo: SugataInfo.random(),
        signature: Signature.random(),
        signatureInfo: SignatureInfo.random(),
        price: Money.random(),
        measurements: Measurements.random(),
        weight: Weight.random(650, 1200),
        soriInfo: SoriInfo.random(),
        hada: HadaInfo.random(),
        kissakiInfo: KissakiInfo.random(),
        muneInfo: MuneInfo.random(),
        hamonInfo: HamonInfo.random(),
        yakibaInfo: YakibaInfo.random(),
        boshiInfo: BoshiInfo.random(),
        boshiOther: '',
        nakagoInfo: NakagoInfo.random(),
        yasurimeInfo: YasurimeInfo.random(),
        yasurimeOther: '',
        bohiInfo: BohiInfo.random(),
        polishInfo: PolishInfo.random(),
        period: Period.random()
    );
  }

  String get description {
    return "${type?.label} - ${sugataInfo?.type?.label} (${measurements?.nagasa?.toText()})";
  }

  String toString() {
    return "Nihonto[type: ${type}, signature: '${signature}', price: ${price}, hada: ${hada}]";
  }
}
