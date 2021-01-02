import 'dart:math';

import 'package:flutter/foundation.dart';
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
import 'package:nihonto_collection_manager/model/yakiba_info.dart';
import 'package:nihonto_collection_manager/model/yasurime_info.dart';
import 'package:nihonto_collection_manager/utils.dart';

@immutable
class Nihonto {

  static const DEFAULT = Nihonto();

  final String referenceNumber;

  final Uri imageUri;

  final String overallDescription;

  final NihontoType type;

  final SignatureInfo signature;

  final SugataInfo sugata;

  final Money price;

  final Measurements measurements;

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
      this.imageUri,
      this.referenceNumber = '',
      this.overallDescription = '',
      this.type,
      this.sugata = SugataInfo.DEFAULT,
      this.signature = SignatureInfo.DEFAULT,
      this.price = Money.ZERO,
      this.measurements = Measurements.DEFAULT,
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
        imageUri: Utils.randomImageUri(),
        referenceNumber: '#${Random().nextInt(100)}',
        overallDescription: 'Description goes here...\nDescription goes here...\nDescription goes here...',
        type: NihontoType.random(),
        sugata: SugataInfo.random(),
        signature: SignatureInfo.random(),
        price: Money.random(),
        measurements: Measurements.random(),
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

  Nihonto copyWith({
    String referenceNumber,
    Uri imageUri,
    String overallDescription,
    NihontoType type,
    SignatureInfo signature,
    SugataInfo sugata,
    Money price,
    Measurements measurements,
    HadaInfo hada,
    SoriInfo sori,
    KissakiInfo kissaki,
    MuneInfo mune,
    HamonInfo hamon,
    YakibaInfo yakiba,
    BoshiInfo boshi,
    NakagoInfo nakago,
    YasurimeInfo yasurime,
    BohiInfo bohi,
    PolishInfo polish,
    Period period,
    SchoolInfo school,
  }) {
    if ((referenceNumber == null ||
            identical(referenceNumber, this.referenceNumber)) &&
        (imageUri == null || identical(imageUri, this.imageUri)) &&
        (overallDescription == null ||
            identical(overallDescription, this.overallDescription)) &&
        (type == null || identical(type, this.type)) &&
        (signature == null || identical(signature, this.signature)) &&
        (sugata == null || identical(sugata, this.sugata)) &&
        (price == null || identical(price, this.price)) &&
        (measurements == null || identical(measurements, this.measurements)) &&
        (hada == null || identical(hada, this.hada)) &&
        (sori == null || identical(sori, this.sori)) &&
        (kissaki == null || identical(kissaki, this.kissaki)) &&
        (mune == null || identical(mune, this.mune)) &&
        (hamon == null || identical(hamon, this.hamon)) &&
        (yakiba == null || identical(yakiba, this.yakiba)) &&
        (boshi == null || identical(boshi, this.boshi)) &&
        (nakago == null || identical(nakago, this.nakago)) &&
        (yasurime == null || identical(yasurime, this.yasurime)) &&
        (bohi == null || identical(bohi, this.bohi)) &&
        (polish == null || identical(polish, this.polish)) &&
        (period == null || identical(period, this.period)) &&
        (school == null || identical(school, this.school))) {
      return this;
    }

    return new Nihonto(
      referenceNumber: referenceNumber ?? this.referenceNumber,
      imageUri: imageUri ?? this.imageUri,
      overallDescription: overallDescription ?? this.overallDescription,
      type: type ?? this.type,
      signature: signature ?? this.signature,
      sugata: sugata ?? this.sugata,
      price: price ?? this.price,
      measurements: measurements ?? this.measurements,
      hada: hada ?? this.hada,
      sori: sori ?? this.sori,
      kissaki: kissaki ?? this.kissaki,
      mune: mune ?? this.mune,
      hamon: hamon ?? this.hamon,
      yakiba: yakiba ?? this.yakiba,
      boshi: boshi ?? this.boshi,
      nakago: nakago ?? this.nakago,
      yasurime: yasurime ?? this.yasurime,
      bohi: bohi ?? this.bohi,
      polish: polish ?? this.polish,
      period: period ?? this.period,
      school: school ?? this.school,
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
          imageUri == other.imageUri &&
          overallDescription == other.overallDescription &&
          type == other.type &&
          signature == other.signature &&
          sugata == other.sugata &&
          price == other.price &&
          measurements == other.measurements &&
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
      imageUri.hashCode ^
      overallDescription.hashCode ^
      type.hashCode ^
      signature.hashCode ^
      sugata.hashCode ^
      price.hashCode ^
      measurements.hashCode ^
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
