import 'package:flutter/material.dart';
import 'package:kouider_app/core/helpers/assets.dart';
import 'package:kouider_app/core/theming/colors_manager.dart';
import 'package:kouider_app/features/home/presentation/widgets/custom_bottom_nav_bar_icon.dart';
import 'package:kouider_app/features/home/presentation/home_view.dart';
import 'package:kouider_app/features/home/presentation/widgets/disabled_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Widget> _buildScreens() {
    return [
      const HomeView(),
      DisabledView(
        title: 'المفضلة',
      ),
      DisabledView(
        title: 'عربة التسوق',
      ),
      DisabledView(
        title: 'حسابي',
      ),
      DisabledView(
        title: 'المزيد',
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const CustomBottomNavBarIcon(
          icon: SvgAssets.bottomNavHome,
          text: 'الرئيسية',
          isActiveIcon: true,
        ),
        inactiveIcon: const CustomBottomNavBarIcon(
          icon: SvgAssets.bottomNavHome,
          text: 'الرئيسية',
          isActiveIcon: false,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const CustomBottomNavBarIcon(
          icon: SvgAssets.bottomNavFav,
          text: 'المفضلة',
          isActiveIcon: true,
        ),
        inactiveIcon: const CustomBottomNavBarIcon(
          icon: SvgAssets.bottomNavFav,
          text: 'المفضلة',
          isActiveIcon: false,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const CustomBottomNavBarIcon(
          icon: SvgAssets.bottomNavCart,
          text: 'عربة التسوق',
          isActiveIcon: true,
        ),
        inactiveIcon: const CustomBottomNavBarIcon(
          icon: SvgAssets.bottomNavCart,
          text: 'عربة التسوق',
          isActiveIcon: false,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const CustomBottomNavBarIcon(
          icon: SvgAssets.bottomNavProfile,
          text: 'حسابي',
          isActiveIcon: true,
        ),
        inactiveIcon: const CustomBottomNavBarIcon(
          icon: SvgAssets.bottomNavProfile,
          text: 'حسابي',
          isActiveIcon: false,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const CustomBottomNavBarIcon(
          icon: SvgAssets.bottomNavMore,
          text: 'المزيد',
          isActiveIcon: true,
        ),
        inactiveIcon: const CustomBottomNavBarIcon(
          icon: SvgAssets.bottomNavMore,
          text: 'المزيد',
          isActiveIcon: false,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.scaffoldBackgroundColor,
      key: _scaffoldKey,
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        navBarStyle: NavBarStyle.style2,
        decoration: const NavBarDecoration(
          colorBehindNavBar: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x0A000000),
              blurRadius: 6,
              offset: Offset(0, -2),
              spreadRadius: 0,
            )
          ],
        ),
        resizeToAvoidBottomInset: true,
        confineToSafeArea: true,
        // navBarHeight: 50,
        animationSettings: const NavBarAnimationSettings(
          navBarItemAnimation: ItemAnimationSettings(
            duration: Duration(milliseconds: 400),
            curve: Curves.fastEaseInToSlowEaseOut,
          ),
          screenTransitionAnimation: ScreenTransitionAnimationSettings(
            duration: Duration(milliseconds: 400),
            curve: Curves.linearToEaseOut,
            animateTabTransition: false,
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
