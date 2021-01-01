import 'package:nihonto_collection_manager/model/bohi_info.dart';
import 'package:nihonto_collection_manager/model/boshi_info.dart';
import 'package:nihonto_collection_manager/model/hada_info.dart';
import 'package:nihonto_collection_manager/model/hamon_info.dart';
import 'package:nihonto_collection_manager/model/kissaki_info.dart';
import 'package:nihonto_collection_manager/model/length.dart';
import 'package:nihonto_collection_manager/model/measurements.dart';
import 'package:nihonto_collection_manager/model/money.dart';
import 'package:nihonto_collection_manager/model/mune_type.dart';
import 'package:nihonto_collection_manager/model/nakago_info.dart';
import 'package:nihonto_collection_manager/model/nihonto_type.dart';
import 'package:nihonto_collection_manager/model/period.dart';
import 'package:nihonto_collection_manager/model/polish.dart';
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

  final String hadaOther;

  final SoriInfo soriInfo;

  final KissakiInfo kissakiInfo;

  final MuneType muneType;

  final String muneOther;

  final HamonInfo hamonInfo;

  final String hamonOther;

  final YakibaInfo yakibaInfo;

  final String yakibaOther;

  final BoshiInfo boshiInfo;

  final String boshiOther;

  final NakagoInfo nakagoInfo;

  final String nakagoOther;

  final YasurimeInfo yasurimeInfo;

  final String yasurimeOther;

  final BohiInfo bohiInfo;

  final String bohiOther;

  final Polish polish;

  final String polishOther;

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
      this.hada,
      this.hadaOther,
      this.kissakiInfo = KissakiInfo.DEFAULT,
      this.muneType,
      this.muneOther,
      this.hamonInfo,
      this.hamonOther,
      this.yakibaInfo,
      this.yakibaOther,
      this.boshiInfo,
      this.boshiOther,
      this.nakagoInfo,
      this.nakagoOther,
      this.yasurimeInfo,
      this.yasurimeOther,
      this.bohiInfo,
      this.bohiOther,
      this.polish,
      this.polishOther,
      this.period
    });

  static Nihonto random() {
    final nagasa = Length.random(min: 25, max: 75);
    final nakagoLength = Length.random(min: 15, max: 30);
    final kasane = Length.random(min: 0.5, max: 0.9);
    final motohaba = Length.random(min: 2.7, max: 3.6);

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
        hadaOther: '',
        kissakiInfo: KissakiInfo.random(),
        muneType: MuneType.random(),
        muneOther: '',
        hamonInfo: HamonInfo.random(),
        hamonOther: '',
        yakibaInfo: YakibaInfo.random(),
        yakibaOther: '',
        boshiInfo: BoshiInfo.random(),
        boshiOther: '',
        nakagoInfo: NakagoInfo.random(),
        nakagoOther: '',
        yasurimeInfo: YasurimeInfo.random(),
        yasurimeOther: '',
        bohiInfo: BohiInfo.random(),
        bohiOther: '',
        polish: Polish.random(),
        polishOther: '',
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
