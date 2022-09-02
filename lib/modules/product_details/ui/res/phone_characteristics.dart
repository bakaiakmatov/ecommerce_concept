import '../../../../resources/app_icons.dart';

class PhoneCharacteristics {
  final String icon;
  PhoneCharacteristics({
    required this.icon,
  });
  static List<PhoneCharacteristics> phoneCharacteristicsList = [
    PhoneCharacteristics(
      icon: AppIconPaths.processor,
    ),
    PhoneCharacteristics(
      icon: AppIconPaths.camera,
    ),
    PhoneCharacteristics(
      icon: AppIconPaths.memory,
    ),
    PhoneCharacteristics(
      icon: AppIconPaths.phonememory,
    ),
  ];
}
