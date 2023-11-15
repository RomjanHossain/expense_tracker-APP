// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:expense_tracker/presentation/pages/profile_page/bloc/bloc.dart';

void main() {
  group('ProfilePageBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          ProfilePageBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final profilePageBloc = ProfilePageBloc();
      expect(profilePageBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<ProfilePageBloc, ProfilePageState>(
      'CustomProfilePageEvent emits nothing',
      build: ProfilePageBloc.new,
      act: (bloc) => bloc.add(const CustomProfilePageEvent()),
      expect: () => <ProfilePageState>[],
    );
  });
}
