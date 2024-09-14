part of 'globals.dart';

/// A widget that provides a responsive layout for different screen sizes.
class ResponsiveLayout extends StatelessWidget {
  final Widget mobileLayout;
  final Widget tabletLayout;
  final Widget desktopLayout;

  const ResponsiveLayout({
    Key? key,
    required this.mobileLayout,
    required this.tabletLayout,
    required this.desktopLayout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1200) {
          return desktopLayout;
        } else if (constraints.maxWidth >= 600) {
          return tabletLayout;
        } else {
          return mobileLayout;
        }
      },
    );
  }
}

/// Utility class for getting screen size and device type.
class ResponsiveUtils {
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= 600 &&
        MediaQuery.of(context).size.width < 1200;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1200;
  }
}

/// A simple responsive text widget example.
class ResponsiveText extends StatelessWidget {
  final String text;

  const ResponsiveText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fontSize = ResponsiveUtils.isDesktop(context)
        ? 24
        : (ResponsiveUtils.isTablet(context) ? 20 : 16);
    return Text(
      text,
      style: TextStyle(fontSize: fontSize),
    );
  }
}
