import '../session/session_entity.dart';

class Ac extends SessionEntity {
  Ac({
    String? id,
    required String phoneNumer,
  }) : super(
          id: id,
          phoneNumer: phoneNumer,
        );
}
