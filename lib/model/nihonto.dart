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
import 'package:nihonto_collection_manager/model/signature_info.dart';
import 'package:nihonto_collection_manager/model/sori_info.dart';
import 'package:nihonto_collection_manager/model/sugata_info.dart';
import 'package:nihonto_collection_manager/model/weight.dart';
import 'package:nihonto_collection_manager/model/yakiba_info.dart';
import 'package:nihonto_collection_manager/model/yasurime_info.dart';

class Nihonto {
  final String overallDescription;

  final NihontoType type;

  final SignatureInfo signature;

  final SugataInfo sugata;

  final Money price;

  final Measurements measurements;

  final Weight weight;

  final HadaInfo hada;

  final SoriInfo sori;

  final KissakiInfo kissaki;

  final MuneInfo mune;

  final HamonInfo hamon;

  final YakibaInfo yakiba;

  final BoshiInfo boshi;

  final NakagoInfo nakago;

  final YasurimeInfo yasurime;

  final BohiInfo bohi;

  final PolishInfo polish;

  final Period period;

  const Nihonto(
      {
      this.overallDescription = '',
      this.type,
      this.sugata = SugataInfo.DEFAULT,
      this.signature = SignatureInfo.DEFAULT,
      this.price = Money.ZERO,
      this.measurements = Measurements.DEFAULT,
      this.weight,
      this.sori = SoriInfo.DEFAULT,
      this.hada = HadaInfo.DEFAULT,
      this.kissaki = KissakiInfo.DEFAULT,
      this.mune = MuneInfo.DEFAULT,
      this.hamon = HamonInfo.DEFAULT,
      this.yakiba = YakibaInfo.DEFAULT,
      this.boshi = BoshiInfo.DEFAULT,
      this.nakago = NakagoInfo.DEFAULT,
      this.yasurime = YasurimeInfo.DEFAULT,
      this.bohi = BohiInfo.DEFAULT,
      this.polish = PolishInfo.DEFAULT,
      this.period
    });

  static Nihonto random() {
    return Nihonto(
        overallDescription: 'Description goes here...\nDescription goes here...\nDescription goes here...',
        type: NihontoType.random(),
        sugata: SugataInfo.random(),
        signature: SignatureInfo.random(),
        price: Money.random(),
        measurements: Measurements.random(),
        weight: Weight.random(650, 1200),
        sori: SoriInfo.random(),
        hada: HadaInfo.random(),
        kissaki: KissakiInfo.random(),
        mune: MuneInfo.random(),
        hamon: HamonInfo.random(),
        yakiba: YakibaInfo.random(),
        boshi: BoshiInfo.random(),
        nakago: NakagoInfo.random(),
        yasurime: YasurimeInfo.random(),
        bohi: BohiInfo.random(),
        polish: PolishInfo.random(),
        period: Period.random()
    );
  }

  String get description {
    return "${type?.label} - ${sugata?.type?.label} (${measurements?.nagasa?.toText()})";
  }

  String toString() {
    return "Nihonto[type: ${type}, price: ${price}, hada: ${hada}]";
  }
}
