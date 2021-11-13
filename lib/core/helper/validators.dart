import 'package:garden/core/helper/consts.dart';
import 'package:garden/core/helper/extensions.dart';
import 'package:garden/generated/l10n.dart';

abstract class PlantNameValidator {
  static String? errorMessage(String? value) {
    if (value?.isEmpty ?? true) {
      return S.current.thisFieldIsNecessary.capitalize;
    }
    if (value!.length < Consts.minPlantNameLength) {
      return S.current.minLength(S.current.name, Consts.minPlantNameLength).capitalize;
    }
    if (Consts.maxPlantNameLength < value.length) {
      return S.current.minLength(S.current.name, Consts.maxPlantNameLength).capitalize;
    }
    return null;
  }
}
