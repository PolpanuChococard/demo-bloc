import 'package:json_annotation/json_annotation.dart';

enum GenderType { none, male, female, noDefine }

extension GenderTypeExtension on GenderType {
  String get locale {
    switch (this) {
      case GenderType.none:
        return "";
      case GenderType.male:
        return "ชาย";
      case GenderType.female:
        return "หญิง";
      case GenderType.noDefine:
        return "ไม่ระบุ";
    }
  }
}

class GenderTypeConverter implements JsonConverter<GenderType, String> {
  const GenderTypeConverter();

  @override
  GenderType fromJson(String json) {
    switch (json) {
      case 'male':
        return GenderType.male;
      case 'female':
        return GenderType.female;
      default:
        return GenderType.noDefine;
    }
  }

  @override
  String toJson(GenderType genderType) {
    return genderType.locale;
  }
}
