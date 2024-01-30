import 'package:flutter/material.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/about/widgets/about_body.dart';

/// {@template about_page}
/// A description for AboutPage
/// {@endtemplate}
class AboutPage extends StatelessWidget {
  /// {@macro about_page}
  const AboutPage({super.key});

  /// The static route for AboutPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const AboutPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: AboutView(),
    );
  }
}

/// {@template about_view}
/// Displays the Body of AboutView
/// {@endtemplate}
class AboutView extends StatelessWidget {
  /// {@macro about_view}
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AboutBody();
  }
}
