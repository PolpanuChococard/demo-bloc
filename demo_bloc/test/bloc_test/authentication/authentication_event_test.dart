import 'package:demo_bloc/features/authentication/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthenticationEvent Equality', () {
    test('GetCurrentAuthUserEvent equality test', () {
      final event1 = GetCurrentAuthUserEvent();
      final event2 = GetCurrentAuthUserEvent();
      final event3 = LoginAttemptedEvent();

      expect(event1, equals(event2));
      expect(event1, isNot(equals(event3)));
    });

    test('LoginAttemptedEvent equality test', () {
      final event1 = LoginAttemptedEvent();
      final event2 = LoginAttemptedEvent();
      final event3 = LogOutEvent();

      expect(event1, equals(event2));
      expect(event1, isNot(equals(event3)));
    });

    test('LogOutEvent equality test', () {
      final event1 = LogOutEvent();
      final event2 = LogOutEvent();
      final event3 = GetCurrentAuthUserEvent();

      expect(event1, equals(event2));
      expect(event1, isNot(equals(event3)));
    });
  });
}
