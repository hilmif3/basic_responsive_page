// part of 'globals.dart';

// /// Responsive Layout for Page without Form
// class ResponsivePage extends StatefulWidget {
//   /// On Pop Invoked
//   ///
//   /// Callback untuk custom OnPopInvoked.
//   final FutureOr<void> Function()? onPopInvoked;

//   /// App Bar untuk halaman
//   final PreferredSizeWidget? appBar;

//   /// Body
//   ///
//   /// Harus di-isi, child dari responsive page.
//   final Widget body;

//   /// Alignment untuk parent container.
//   ///
//   /// Default ke [Alignment.topCenter].
//   final AlignmentGeometry? alignment;

//   /// Padding
//   ///
//   /// Default ke `EdgeInsets.all(16)`
//   final EdgeInsetsGeometry? padding;

//   /// Parent background color
//   final Color? backgroundColor;

//   /// Color untuk body.
//   final Color? colorPage;

//   /// Max Width untuk body
//   ///
//   /// Default ke [double.maxFinite]
//   final double? maxWidth;

//   /// Floating action button
//   final Widget? fab;

//   /// Lokasi floating action button
//   final FloatingActionButtonLocation? fabLocation;

//   /// Animasi untuk perpindahan action button
//   final FloatingActionButtonAnimator? fabAnimator;

//   /// Persistent Footer Buttons
//   final List<Widget>? footerButtons;

//   /// Alignment untuk Footer Buttons
//   final AlignmentDirectional footerAlignment;

//   final bool useScrollView;

//   /// Controller untuk [SingleChildScrollView].
//   ///
//   /// Assign hanya jika diperlukan.
//   final ScrollController? controller;

//   /// Physics untuk [SingleChildScrollView]
//   ///
//   /// Default ke [ClampingScrollPhysics]
//   final ScrollPhysics? physics;

//   /// Callback untuk function On Refresh.
//   ///
//   /// Isi function On Refresh jika memerlukan Refresh Function.
//   final Future<void> Function()? onRefresh;

//   final Widget? bottomNav;
//   final EdgeInsetsGeometry? paddingBottomNav;
//   final Color? bottomNavColor;
//   final bool? overShowBottomNav;
//   final bool? bottomNavShadow;
//   final bool useSafeArea;
//   final Widget? appBarCustom;
//   final Widget? drawer;
//   final double? top;
//   final double? bottom;

//   const ResponsivePage({
//     Key? key,
//     this.onPopInvoked,
//     this.appBar,
//     this.backgroundColor,
//     this.colorPage,
//     this.maxWidth,
//     required this.body,
//     this.alignment,
//     this.padding,
//     this.footerButtons,
//     this.footerAlignment = AlignmentDirectional.center,
//     this.fab,
//     this.fabLocation,
//     this.fabAnimator,
//     this.physics,
//     this.onRefresh,
//     this.controller,
//     this.useScrollView = false,
//     this.bottomNav,
//     this.bottomNavColor,
//     this.overShowBottomNav,
//     this.bottomNavShadow,
//     this.useSafeArea = false,
//     this.appBarCustom,
//     this.drawer,
//     this.paddingBottomNav,
//     this.top,
//     this.bottom,
//   }) : super(key: key);

//   @override
//   State<ResponsivePage> createState() => _ResponsivePageState();
// }

// class _ResponsivePageState extends State<ResponsivePage> {
//   late final _useScrollView = widget.useScrollView;
//   late final _scrollController = widget.controller ?? ScrollController();

//   /// Posisi Scroll Home
//   double _posisiScroll = 0.0;

//   /// Show button on top
//   bool _showButtonOnTop = false;

//   @override
//   void initState() {
//     super.initState();

//     /// Change Theme for divider color.
//     final themeBloc = context.read<ThemeBloc>();
//     themeBloc.add(
//       ChangeTheme(
//         themeData: themeBloc.state.themeData.copyWith(
//           dividerColor: Colors.transparent,
//           colorScheme: ColorScheme.fromSwatch().copyWith(primary: primaryColor),
//         ),
//       ),
//     );

//     if (_useScrollView) {
//       _scrollController.addListener(_saveLatestPosition);
//     }
//   }

//   /// if (onRefresh != null)
//   // Widget _onRefresh =
//   Future<void> _handleOnRefresh() async {
//     if (widget.onRefresh != null) {
//       widget.onRefresh!();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PopScope(
//       canPop: widget.onPopInvoked == null,
//       onPopInvokedWithResult: (didPop, result) async {
//         if (didPop) {
//           return;
//         }

//         if (widget.onPopInvoked != null) {
//           await widget.onPopInvoked!();
//         }
//       },
//       child: Scaffold(
//         backgroundColor: widget.backgroundColor ?? primaryColor,
//         appBar: widget.appBar,
//         body: bodyPage(context),
//         // floatingActionButton: widget.fab,
//         // floatingActionButtonLocation: widget.fabLocation,
//         // floatingActionButtonAnimator: widget.fabAnimator,
//         persistentFooterButtons: widget.footerButtons,
//         persistentFooterAlignment: widget.footerAlignment,
//         bottomNavigationBar: buttonBottomNav(),
//       ),
//     );
//   }

//   /// -- Body Page -- ///
//   Widget bodyPage(BuildContext context) {
//     final double _heightStatusBar = MediaQuery.viewPaddingOf(context).top;
//     final double _padTop = Responsive.isMobile(context)
//         ? heightAppBar + _heightStatusBar
//         : heightAppBar;

//     final double _padBot =
//         Responsive.isMobile(context) ? heightBottomNavBar : 8;

//     PrintHelper.printWhite("top: $_padTop - Bottom: $_padBot");

//     final _paddingPage = EdgeInsets.only(
//       top: widget.top ?? _padTop + 16,
//       bottom: widget.bottom ?? _padBot,
//       left: 0,
//       right: 0,
//     );

//     final bool _topSafeArea = (widget.useSafeArea == false &&
//             (widget.appBar == null || widget.appBarCustom == null))
//         ? false
//         : Responsive.isMobile(context);

//     final double _marginBottom =
//         (widget.useSafeArea == true && Responsive.isMobile(context)) ? 90 : 0;

//     Widget? _bodyPage;

//     if (!_useScrollView) {
//       _bodyPage = Container(
//         constraints: BoxConstraints(
//           maxWidth: Responsive.isPhoneLandscape(context)
//               ? double.maxFinite
//               : widget.maxWidth ?? double.maxFinite,
//         ),
//         padding: widget.appBarCustom != null ? _paddingPage : widget.padding,
//         margin: EdgeInsets.only(bottom: _marginBottom),
//         decoration: BoxDecoration(
//           color: widget.colorPage ?? Colors.transparent,
//           // borderRadius: Responsive.isMobile(context)
//           //     ? const BorderRadius.only(
//           //         topLeft: Radius.circular(20),
//           //         topRight: Radius.circular(20),
//           //       )
//           //     : null,
//         ),
//         child: widget.body,
//       );
//     } else {
//       // Provide the scroll controller to the scroll view.
//       _bodyPage = SingleChildScrollView(
//         physics: widget.onRefresh != null
//             ? const AlwaysScrollableScrollPhysics() // or BouncingScrollPhysics()
//             : widget.physics ?? const BouncingScrollPhysics(), // if prevent
//         controller: _scrollController,
//         padding: widget.appBarCustom != null ? _paddingPage : widget.padding,
//         child: Container(
//           color: widget.colorPage ?? Colors.transparent,
//           margin: EdgeInsets.only(bottom: _marginBottom),
//           child: widget.body,
//         ),
//       );
//     }

//     /// with OnRefresh
//     Widget _bodyPageRefresh = RefreshIndicator(
//       onRefresh: _handleOnRefresh,
//       child: _bodyPage,
//     );

//     return ResponsiveSafeArea(
//       top: _topSafeArea,
//       bottom: false,
//       child: GestureDetector(
//         onTap: () {
//           FocusManager.instance.primaryFocus?.unfocus();
//         },
//         child: Container(
//           clipBehavior: Clip.hardEdge,
//           alignment: widget.alignment ?? Alignment.topCenter,
//           decoration: BoxDecoration(
//             color: widget.backgroundColor ?? colorApp1,
//             // borderRadius: Responsive.isMobile(context)
//             //     ? const BorderRadius.only(
//             //         topLeft: Radius.circular(20),
//             //         topRight: Radius.circular(20),
//             //       )
//             //     : null,
//           ),

//           /// Body Page
//           child: Stack(
//             children: [
//               /// Body Page
//               widget.onRefresh != null ? _bodyPageRefresh : _bodyPage,

//               /// Header Custom Page
//               /// On - Top
//               Visibility(
//                 visible: widget.appBarCustom != null,
//                 child: ClipRRect(
//                   child: BackdropFilter(
//                     filter: ImageFilter.blur(sigmaX: 2, sigmaY: 3),
//                     child: widget.appBarCustom ?? const SizedBox.shrink(),
//                   ),
//                 ),
//               ),

//               /// Button on Top
//               /// To used just useScrollView is true
//               showFabButton()
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget showFabButton() {
//     return Visibility(
//       visible: _useScrollView,
//       child: ValueListenableBuilder(
//         valueListenable: SharedGlobalValue.marginBottomNavbar,
//         builder: (context, value, child) {
//           _posisiScroll = _scrollController.hasClients
//               ? _scrollController.offset
//               : _posisiScroll;

//           /// set bottom margin
//           final _location = GoRouterSingleton.shared.getCurrentLocation();
//           final double _value;

//           final _fab = Responsive.isDesktop(context) ? value + 60 : value;
//           final _isMain =
//               (Responsive.isDesktop(context) || _location != "/main");

//           if (widget.fab != null) {
//             _value = _fab;
//           } else if (_isMain) {
//             _value = 16;
//           } else {
//             _value = value - (SyncUI.isAndroid ? 10 : 0);
//           }

//           return Visibility(
//             visible: _posisiScroll != 0.0,
//             child: Positioned(
//               bottom: _value,
//               right: 8,
//               child: buttonBackToTop(),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   /// Bottom Navigation
//   Widget? buttonBottomNav() {
//     /// Mobile
//     /// Tablet Portrait
//     bool _isMobile = Responsive.isMobile(context);
//     bool _isTablet =
//         Responsive.isTablet(context) && Responsive.isPotrait(context);

//     bool _isShow = widget.overShowBottomNav ?? (_isTablet || _isMobile);

//     ///
//     if (widget.bottomNav != null && _isShow) {
//       return ButtonBottomNav(
//         constraints: const BoxConstraints(maxHeight: 74),
//         bottomNav: widget.bottomNav,
//         bottomNavColor: widget.bottomNavColor ?? Colors.transparent,
//         bottomNavShadow: widget.bottomNavShadow ?? false,
//         padding:
//             widget.paddingBottomNav ?? const EdgeInsets.symmetric(vertical: 8),
//         isShow: _isShow,
//       );
//     } else {
//       return null;
//     }
//   }

//   /// Button BackToTop
//   IgnorePointer buttonBackToTop() {
//     return IgnorePointer(
//       ignoring: _showButtonOnTop ? false : true,
//       child: AnimatedOpacity(
//         duration: const Duration(milliseconds: 250),
//         opacity: _showButtonOnTop ? 1.0 : 0.0,
//         child: Visibility(
//           visible: _showButtonOnTop,
//           child: FloatingActionButton(
//             heroTag: const Key('responsive_page'),
//             mini: true,
//             onPressed: () => _backToTop(),
//             backgroundColor: primaryColor.withOpacity(.65),
//             child: const Icon(Icons.arrow_upward),
//           ),
//         ),
//       ),
//     );
//   }

//   /// Save latest position during scroll
//   void _saveLatestPosition() {
//     /// Set posisi home
//     _posisiScroll =
//         _scrollController.hasClients ? _scrollController.offset : _posisiScroll;

//     /// Toggle To Top Button Visibility
//     _toggleToTopButton();
//   }

//   /// Toggle To Top Button
//   void _toggleToTopButton() {
//     /// Make this `if else` to prevent `setState` being called all the time when scrolling.
//     if (_posisiScroll > 10.0 && !_showButtonOnTop) {
//       PrintHelper.printState("ResponsivePage-up: $_posisiScroll");
//       setState(() {
//         _showButtonOnTop = true;
//       });
//     } else if (_posisiScroll < 10 && _showButtonOnTop) {
//       PrintHelper.printState("ResponsivePage-down: $_posisiScroll");
//       setState(() {
//         _showButtonOnTop = false;
//       });
//     }
//   }

//   /// Back to Top
//   void _backToTop() {
//     PrintHelper.printWhite("_backToTop --> [ResponsivePage]");

//     /// Scroll on Top
//     _scrollController.animateTo(
//       0,
//       duration: const Duration(milliseconds: 500),
//       curve: Curves.fastOutSlowIn,
//     );
//     // .then(
//     //   (value) => context.read<ScrollHiderCubit>().showHomeNearestBranch(),
//     // );
//   }

//   @override
//   void dispose() {
//     if (_useScrollView) {
//       _scrollController.removeListener(_saveLatestPosition);

//       PrintHelper.printError(
//           "ResponsivePage - Controller Dispose [removeListener]");
//     }

//     super.dispose();
//   }
// }
