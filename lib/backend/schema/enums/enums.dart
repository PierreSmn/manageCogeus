import 'package:collection/collection.dart';
import "package:shadcn_u_i_kit_v48jv9/backend/schema/enums/enums.dart"
    as shadcn_u_i_kit_v48jv9_enums hide FFEnumExtensions, FFEnumListExtensions;

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (shadcn_u_i_kit_v48jv9_enums.ButtonVariant):
      return shadcn_u_i_kit_v48jv9_enums.ButtonVariant.values.deserialize(value)
          as T?;
    case (shadcn_u_i_kit_v48jv9_enums.BadgeVariant):
      return shadcn_u_i_kit_v48jv9_enums.BadgeVariant.values.deserialize(value)
          as T?;
    default:
      return null;
  }
}
