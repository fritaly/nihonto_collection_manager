import 'package:nihonto_collection_manager/model/bohi_info.dart';
import 'package:nihonto_collection_manager/model/boshi_info.dart';
import 'package:nihonto_collection_manager/model/hada_info.dart';
import 'package:nihonto_collection_manager/model/hamon_info.dart';
import 'package:nihonto_collection_manager/model/kissaki_type.dart';
import 'package:nihonto_collection_manager/model/length.dart';
import 'package:nihonto_collection_manager/model/money.dart';
import 'package:nihonto_collection_manager/model/mune_type.dart';
import 'package:nihonto_collection_manager/model/nakago_info.dart';
import 'package:nihonto_collection_manager/model/nihonto_type.dart';
import 'package:nihonto_collection_manager/model/polish.dart';
import 'package:nihonto_collection_manager/model/signature.dart';
import 'package:nihonto_collection_manager/model/signature_info.dart';
import 'package:nihonto_collection_manager/model/sori_info.dart';
import 'package:nihonto_collection_manager/model/sori_type.dart';
import 'package:nihonto_collection_manager/model/sugata.dart';
import 'package:nihonto_collection_manager/model/weight.dart';
import 'package:nihonto_collection_manager/model/yakiba_info.dart';
import 'package:nihonto_collection_manager/model/yasurime_info.dart';

class Nihonto {
  final String overallDescription;

  final NihontoType type;

  // The signature should never be null
  final Signature signature;

  final SignatureInfo signatureInfo;

  final Sugata sugata;

  final String sugataOther;

  final Money price;

  final Length nagasa, totalLength, kasane, motokasane, sakikasane, mihaba, motohaba, sakihaba;

  final Weight weight;

  final SoriType soriType;

  final String soriOther;

  final HadaInfo hada;

  final String hadaOther;

  final SoriInfo sori;

  final KissakiType kissakiType;

  final String kissakiOther;

  final MuneType muneType;

  final HamonInfo hamonInfo;

  final YakibaInfo yakibaInfo;

  final BoshiInfo boshiInfo;

  final NakagoInfo nakagoInfo;

  final YasurimeInfo yasurimeInfo;

  final BohiInfo bohiInfo;

  final Polish polish;

  const Nihonto(
      {
      this.overallDescription,
      this.type,
      this.sugata,
      this.sugataOther = '',
      this.signature = Signature.EMPTY,
      this.signatureInfo,
      this.price = Money.ZERO,
      this.nagasa,
      this.totalLength,
      this.kasane,
      this.motokasane,
      this.sakikasane,
      this.mihaba,
      this.motohaba,
      this.sakihaba,
      this.weight,
      this.sori,
      this.soriType,
      this.soriOther,
      this.hada,
      this.hadaOther,
      this.kissakiType,
      this.kissakiOther,
      this.muneType,
      this.hamonInfo,
      this.yakibaInfo,
      this.boshiInfo,
      this.nakagoInfo,
      this.yasurimeInfo,
      this.bohiInfo,
      this.polish});

  static Nihonto random() {
    final nagasa = Length.random(min: 25, max: 75);
    final nakagoLength = Length.random(min: 15, max: 30);
    final kasane = Length.random(min: 0.5, max: 0.9);
    final motohaba = Length.random(min: 2.7, max: 3.6);

    return Nihonto(
        overallDescription: 'Description goes here...\nDescription goes here...\nDescription goes here...',
        type: NihontoType.random(),
        sugata: Sugata.random(),
        sugataOther: '',
        signature: Signature.random(),
        signatureInfo: SignatureInfo.random(),
        price: Money.random(),
        nagasa: nagasa,
        totalLength: nagasa + nakagoLength,
        kasane: kasane,
        motokasane: kasane,
        sakikasane: kasane,
        mihaba: motohaba,
        motohaba: motohaba,
        sakihaba: motohaba,
        weight: Weight.random(650, 1200),
        sori: SoriInfo.random(),
        soriType: SoriType.random(),
        soriOther: '',
        hada: HadaInfo.random(),
        hadaOther: '',
        kissakiType: KissakiType.random(),
        kissakiOther: '',
        muneType: MuneType.random(),
        hamonInfo: HamonInfo.random(),
        yakibaInfo: YakibaInfo.random(),
        boshiInfo: BoshiInfo.random(),
        nakagoInfo: NakagoInfo.random(),
        yasurimeInfo: YasurimeInfo.random(),
        bohiInfo: BohiInfo.random(),
        polish: Polish.random()
    );
  }

  String get description {
    return "${type?.label} - ${sugata?.label} (${nagasa?.toText()})";
  }

  String toString() {
    return "Nihonto[type: ${type}, signature: '${signature}', sugata: ${sugata}, price: ${price}, nagasa: ${nagasa}, sori: ${sori}, soriType: ${soriType}, hada: ${hada}, kissakiType: ${kissakiType}]";
  }
}
