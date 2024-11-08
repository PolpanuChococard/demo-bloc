import 'package:demo_bloc/core/enums/auth_status.dart';
import 'package:demo_bloc/core/enums/state_status.dart';
import 'package:demo_bloc/features/authentication/domain/entities/user_info_entity.dart';
import 'package:demo_bloc/features/authentication/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthenticationState', () {
    test('supports equality comparison', () {
      const state1 = AuthenticationState(
        stateStatus: StateStatus.loading,
        authStatus: AuthStatus.authorized,
        userInfo: UserInfoEntity(),
      );
      const state2 = AuthenticationState(
        stateStatus: StateStatus.loading,
        authStatus: AuthStatus.authorized,
        userInfo: UserInfoEntity(),
      );
      const state3 = AuthenticationState(
        stateStatus: StateStatus.done,
        authStatus: AuthStatus.unauthorized,
        userInfo: UserInfoEntity(),
      );

      expect(state1, equals(state2));
      expect(state1, isNot(equals(state3)));
    });

    test('copyWith updates properties correctly', () {
      const initialState = AuthenticationState(
        stateStatus: StateStatus.loading,
        authStatus: AuthStatus.unknown,
        userInfo: UserInfoEntity(),
      );

      final updatedState = initialState.copyWith(
        stateStatus: StateStatus.done,
        authStatus: AuthStatus.authorized,
      );

      expect(updatedState.stateStatus, StateStatus.done);
      expect(updatedState.authStatus, AuthStatus.authorized);
      expect(updatedState.userInfo, initialState.userInfo);
    });

    test('copyWith leaves unchanged properties if not passed', () {
      const initialState = AuthenticationState(
        stateStatus: StateStatus.loading,
        authStatus: AuthStatus.unknown,
        userInfo: UserInfoEntity(),
      );

      final updatedState = initialState.copyWith();

      expect(updatedState.stateStatus, initialState.stateStatus);
      expect(updatedState.authStatus, initialState.authStatus);
      expect(updatedState.userInfo, initialState.userInfo);
    });
  });
}
