import 'dart:convert';

class RegionsModel {
  late final String Australia;
  late final String Canada;
  late final String China;
  late final String Finland;
  late final String SouthKorea;
  late final String Taiwan;
  late final String Thailand;
  late final String Vietnam;
  late final String UnitedState;
  late final String German;
  late final String Zimbabwe;
  late final String Italy;

  RegionsModel.fromJson(Map<String, dynamic> parsedJson) {
    Australia = parsedJson['Australia'];
    Canada = parsedJson['Canada'];
    China = parsedJson['China'];
    Finland = parsedJson['Finland'];
    SouthKorea = parsedJson['SouthKorea'];
    Taiwan = parsedJson['Taiwan'];
    Thailand = parsedJson['Thailand'];
    Vietnam = parsedJson['Vietnam'];
    UnitedState = parsedJson['UnitedState'];
    German = parsedJson['German'];
    Zimbabwe = parsedJson['Zimbabwe'];
    Italy = parsedJson['Italy'];
  }
}
