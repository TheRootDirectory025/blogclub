import 'package:blogclub/article_list.dart';
import 'package:blogclub/home.dart';
import 'package:blogclub/profile.dart';
import 'package:blogclub/search.dart';
import 'package:blogclub/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glassmorphism/glassmorphism.dart';

void main() {
  /// Entry point for the Bachelor Thesis Project - Arak University.
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primaryTextColor = Color(0xff0D253C);
    const secondaryTextColor = Color(0xff2D4379);
    const primaryColor = Color(0xff376AED);

    return MaterialApp(
      title: 'Blog Club - Arak University Thesis',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        snackBarTheme: const SnackBarThemeData(backgroundColor: primaryColor),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: primaryTextColor,
          elevation: 0,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: 'Avenir',
            ),
          ),
        ),
        colorScheme: const ColorScheme.light(
          primary: primaryColor,
          onPrimary: Colors.white,
          surface: Colors.white,
          onSurface: primaryTextColor,
        ),
        scaffoldBackgroundColor: const Color(0xffFBFCFF),
        textTheme: const TextTheme(
            titleMedium: TextStyle(
                fontFamily: 'Avenir',
                color: secondaryTextColor,
                fontWeight: FontWeight.w200,
                fontSize: 18),
            titleLarge: TextStyle(
                fontFamily: 'Avenir',
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: primaryTextColor),
            headlineMedium: TextStyle(
                fontFamily: 'Avenir',
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: primaryTextColor),
            headlineSmall: TextStyle(
                fontFamily: 'Avenir',
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: primaryTextColor),
            bodySmall: TextStyle(
                fontFamily: 'Avenir',
                fontWeight: FontWeight.w700,
                color: Color(0xff7B8BB2),
                fontSize: 10),
            titleSmall: TextStyle(
                fontFamily: 'Avenir',
                color: primaryTextColor,
                fontWeight: FontWeight.w400,
                fontSize: 14),
            bodyMedium: TextStyle(
                fontFamily: 'Avenir',
                color: secondaryTextColor,
                fontSize: 12)),
      ),
      home: const SplashScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

const int homeTabIndex = 0;
const int articleTabIndex = 1;
const int searchTabIndex = 2;
const int menuTabIndex = 3;

class _MainScreenState extends State<MainScreen> {
  int selectedTabIndex = homeTabIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: IndexedStack(
              index: selectedTabIndex,
              children: const [
                HomeScreen(),
                ArticleListScreen(),
                SearchScreen(),
                ProfileScreen(),
              ],
            ),
          ),
          Positioned(
            bottom: 25,
            right: 25,
            left: 25,
            child: _BottomNavigation(
              selectedIndex: selectedTabIndex,
              onTap: (index) {
                setState(() {
                  selectedTabIndex = index;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onTap;

  const _BottomNavigation(
      {Key? key, required this.selectedIndex, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: double.infinity,
      height: 70,
      borderRadius: 30,
      blur: 20,
      alignment: Alignment.center,
      border: 2,
      linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFffffff).withOpacity(0.1),
            const Color(0xFFFFFFFF).withOpacity(0.05),
          ],
          stops: const [0.1, 1]),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFFffffff).withOpacity(0.5),
          const Color((0xFFFFFFFF)).withOpacity(0.2),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _LiquidNavItem(
              iconFileName: 'Home.png',
              title: 'Home',
              isActive: selectedIndex == homeTabIndex,
              onTap: () => onTap(homeTabIndex)),
          _LiquidNavItem(
              iconFileName: 'Articles.png',
              title: 'Article',
              isActive: selectedIndex == articleTabIndex,
              onTap: () => onTap(articleTabIndex)),
          _LiquidNavItem(
              iconFileName: 'Search.png',
              title: 'Search',
              isActive: selectedIndex == searchTabIndex,
              onTap: () => onTap(searchTabIndex)),
          _LiquidNavItem(
              iconFileName: 'Menu.png',
              title: 'Profile',
              isActive: selectedIndex == menuTabIndex,
              onTap: () => onTap(menuTabIndex)),
        ],
      ),
    );
  }
}

class _LiquidNavItem extends StatelessWidget {
  final String iconFileName;
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const _LiquidNavItem(
      {Key? key,
      required this.iconFileName,
      required this.title,
      required this.isActive,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? themeData.colorScheme.primary.withOpacity(0.2) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/img/icons/$iconFileName',
              width: 24,
              height: 24,
              color: isActive
                  ? themeData.colorScheme.primary
                  : themeData.textTheme.bodySmall!.color!.withOpacity(0.6),
            ),
            if (isActive) ...[
              const SizedBox(height: 4),
              Text(
                title,
                style: themeData.textTheme.bodySmall!.copyWith(
                  color: themeData.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
