import 'dart:math';

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
import 'package:nihonto_collection_manager/model/school_info.dart';
import 'package:nihonto_collection_manager/model/signature_info.dart';
import 'package:nihonto_collection_manager/model/sori_info.dart';
import 'package:nihonto_collection_manager/model/sugata_info.dart';
import 'package:nihonto_collection_manager/model/weight.dart';
import 'package:nihonto_collection_manager/model/yakiba_info.dart';
import 'package:nihonto_collection_manager/model/yasurime_info.dart';

class Nihonto {
  final String referenceNumber;

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

  final SchoolInfo school;

  const Nihonto(
      {
      this.referenceNumber = '',
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
      this.period,
      this.school = SchoolInfo.DEFAULT
    });

  static Nihonto random() {
    return Nihonto(
        referenceNumber: '#${Random().nextInt(100)}',
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
        period: Period.random(),
        school: SchoolInfo.random()
    );
  }

  String get description {
    return "${type?.label} - ${sugata?.type?.label} (${measurements?.nagasa?.toText()})";
  }

  String toString() {
    return "Nihonto[type: ${type}, price: ${price}, hada: ${hada}]";
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Nihonto &&
          runtimeType == other.runtimeType &&
          referenceNumber == other.referenceNumber &&
          overallDescription == other.overallDescription &&
          type == other.type &&
          signature == other.signature &&
          sugata == other.sugata &&
          price == other.price &&
          measurements == other.measurements &&
          weight == other.weight &&
          hada == other.hada &&
          sori == other.sori &&
          kissaki == other.kissaki &&
          mune == other.mune &&
          hamon == other.hamon &&
          yakiba == other.yakiba &&
          boshi == other.boshi &&
          nakago == other.nakago &&
          yasurime == other.yasurime &&
          bohi == other.bohi &&
          polish == other.polish &&
          period == other.period &&
          school == other.school;

  @override
  int get hashCode =>
      referenceNumber.hashCode ^
      overallDescription.hashCode ^
      type.hashCode ^
      signature.hashCode ^
      sugata.hashCode ^
      price.hashCode ^
      measurements.hashCode ^
      weight.hashCode ^
      hada.hashCode ^
      sori.hashCode ^
      kissaki.hashCode ^
      mune.hashCode ^
      hamon.hashCode ^
      yakiba.hashCode ^
      boshi.hashCode ^
      nakago.hashCode ^
      yasurime.hashCode ^
      bohi.hashCode ^
      polish.hashCode ^
      period.hashCode ^
      school.hashCode;
}
