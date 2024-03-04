// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:expense_tracker/presentation/pages/homepage/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomepageBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          HomepageBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final homepageBloc = HomepageBloc();
      expect(homepageBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<HomepageBloc, HomepageState>(
      'CustomHomepageEvent emits nothing',
      build: HomepageBloc.new,
      act: (bloc) => bloc.add(const CustomHomepageEvent()),
      expect: () => <HomepageState>[],
    );
  });
}
