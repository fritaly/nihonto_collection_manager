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
import 'package:nihonto_collection_manager/model/yakiba_info.dart';
import 'package:nihonto_collection_manager/model/yasurime_info.dart';
import 'package:nihonto_collection_manager/utils.dart';

import 'package:built_value/built_value.dart';

part 'nihonto.g.dart';

abstract class Nihonto implements Built<Nihonto, NihontoBuilder> {

  // See https://github.com/google/built_value.dart/issues/212#issuecomment-632702910
  static void _initializeBuilder(NihontoBuilder builder) => builder
    ..referenceNumber = ''
    ..overallDescription = ''
    ..attribution = ''
    ..other = ''
    ..signature.replace(SignatureInfo())
    ..sugata.replace(SugataInfo())
    ..measurements.replace(Measurements())
    ..hada.replace(HadaInfo())
    ..sori.replace(SoriInfo())
    ..kissaki.replace(KissakiInfo())
    ..mune.replace(MuneInfo())
    ..hamon.replace(HamonInfo())
    ..yakiba.replace(YakibaInfo())
    ..boshi.replace(BoshiInfo())
    ..nakago.replace(NakagoInfo())
    ..yasurime.replace(YasurimeInfo())
    ..polish.replace(PolishInfo())
    ..school.replace(SchoolInfo());

  Nihonto._();

  factory Nihonto([updates(NihontoBuilder b)]) = _$Nihonto;

  String get referenceNumber;

  @nullable
  Uri get imageUri;

  String get overallDescription;

  @nullable
  NihontoType get type;

  SignatureInfo get signature;

  SugataInfo get sugata;

  @nullable
  Money get price;

  Measurements get measurements;

  HadaInfo get hada;

  SoriInfo get sori;

  KissakiInfo get kissaki;

  MuneInfo get mune;

  HamonInfo get hamon;

  YakibaInfo get yakiba;

  BoshiInfo get boshi;

  NakagoInfo get nakago;

  YasurimeInfo get yasurime;

  BohiInfo get bohi;

  PolishInfo get polish;

  @nullable
  Period get period;

  SchoolInfo get school;

  String get attribution;

  String get other;

  static Nihonto random() {
    return Nihonto((builder) => builder
      ..imageUri = Utils.randomImageUri(500)
      ..referenceNumber = '#${Random().nextInt(100)}'
      ..overallDescription =
          'Description goes here...\nDescription goes here...\nDescription goes here...'
      ..type = NihontoType.random()
      ..sugata.replace(SugataInfo.random())
      ..signature.replace(SignatureInfo.random())
      ..price.replace(Money.random())
      ..measurements.replace(Measurements.random())
      ..sori.replace(SoriInfo.random())
      ..hada.replace(HadaInfo.random())
      ..kissaki.replace(KissakiInfo.random())
      ..mune.replace(MuneInfo.random())
      ..hamon.replace(HamonInfo.random())
      ..yakiba.replace(YakibaInfo.random())
      ..boshi.replace(BoshiInfo.random())
      ..nakago.replace(NakagoInfo.random())
      ..yasurime.replace(YasurimeInfo.random())
      ..bohi.replace(BohiInfo.random())
      ..polish.replace(PolishInfo.random())
      ..period = Period.random()
      ..school.replace(SchoolInfo.random())
      ..attribution = ''
      ..other = '');
  }
}
