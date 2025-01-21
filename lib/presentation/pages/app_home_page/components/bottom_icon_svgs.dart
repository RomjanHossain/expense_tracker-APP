import 'package:expense_tracker/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

part 'ibottom_icon_svgs.dart';

/// {@template bottom_icon_svgs}
/// BottomIconSvgs description
/// {@endtemplate}
class BottomIconSvgs implements IBottomIconSvgs {
  const BottomIconSvgs._();

  /// {@macro bottom_icon_svgs}
  static const BottomIconSvgs instance = BottomIconSvgs._();

  /// icons for the page
  List<IconData> get icons => <IconData>[
        Icons.home_rounded,
        Icons.pie_chart_rounded,
        Icons.bar_chart_rounded,
        Icons.settings_rounded,
      ];

  /// Pre-cached SVG widgets
  List<Widget> get svgWidgets => <Widget>[
        SvgPicture.asset(
          Assets.icons.home.path,
        ),
        SvgPicture.asset(
          Assets.icons.transaction.path,
        ),
        SvgPicture.asset(
          Assets.icons.pieChart.path,
        ),
        SvgPicture.asset(
          Assets.icons.user.path,
        ),
      ];

  // svg icons bototm
  List<String> get svgIcons => <String>[
        Assets.icons.home.path,
        Assets.icons.transaction.path,
        Assets.icons.pieChart.path,
        Assets.icons.user.path,
      ];
}
