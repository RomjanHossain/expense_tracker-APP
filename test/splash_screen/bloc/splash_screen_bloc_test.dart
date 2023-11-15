// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:expense_tracker/presentation/pages/splash_screen/bloc/bloc.dart';

void main() {
  group('SplashScreenBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          SplashScreenBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final splashScreenBloc = SplashScreenBloc();
      expect(splashScreenBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<SplashScreenBloc, SplashScreenState>(
      'CustomSplashScreenEvent emits nothing',
      build: SplashScreenBloc.new,
      act: (bloc) => bloc.add(const CustomSplashScreenEvent()),
      expect: () => <SplashScreenState>[],
    );
  });
}
