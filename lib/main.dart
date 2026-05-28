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
  
  /// Enabling Edge-to-Edge mode for a modern full-screen experience.
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => MyAppState();

  static MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<MyAppState>()!;
}

class MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.dark;

  void toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xff376AED);

    return MaterialApp(
      title: 'Blog Club - Arak University Thesis',
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      
      theme: ThemeData(
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xff0D253C),
          elevation: 0,
        ),
        colorScheme: const ColorScheme.light(
          primary: primaryColor,
          onPrimary: Colors.white,
          surface: Colors.white,
          onSurface: Color(0xff0D253C),
        ),
        scaffoldBackgroundColor: const Color(0xffFBFCFF),
        textTheme: _buildTextTheme(Brightness.light),
      ),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff0D253C),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        colorScheme: const ColorScheme.dark(
          primary: primaryColor,
          onPrimary: Colors.white,
          surface: Color(0xff152033),
          onSurface: Colors.white,
        ),
        scaffoldBackgroundColor: const Color(0xff0D253C),
        textTheme: _buildTextTheme(Brightness.dark),
      ),
      home: const SplashScreen(),
    );
  }

  TextTheme _buildTextTheme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final color = isDark ? Colors.white : const Color(0xff0D253C);
    final secondaryColor = isDark ? const Color(0xffBDC3C7) : const Color(0xff2D4379);
    
    return TextTheme(
        titleMedium: TextStyle(
            fontFamily: 'Avenir',
            color: secondaryColor,
            fontWeight: FontWeight.w200,
            fontSize: 18),
        titleLarge: TextStyle(
            fontFamily: 'Avenir',
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: color),
        headlineMedium: TextStyle(
            fontFamily: 'Avenir',
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: color),
        headlineSmall: TextStyle(
            fontFamily: 'Avenir',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: color),
        bodySmall: TextStyle(
            fontFamily: 'Avenir',
            fontWeight: FontWeight.w700,
            color: isDark ? Colors.white60 : const Color(0xff7B8BB2),
            fontSize: 10),
        titleSmall: TextStyle(
            fontFamily: 'Avenir',
            color: color,
            fontWeight: FontWeight.w400,
            fontSize: 14),
        bodyMedium: TextStyle(
            fontFamily: 'Avenir',
            color: secondaryColor,
            fontSize: 12));
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
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      ),
      child: Scaffold(
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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GlassmorphicContainer(
      width: double.infinity,
      height: 70,
      borderRadius: 30,
      blur: 20,
      alignment: Alignment.center,
      border: 1.5,
      linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            (isDark ? const Color(0xFF152033) : Colors.white).withValues(alpha: 0.2),
            (isDark ? const Color(0xFF0D253C) : Colors.white).withValues(alpha: 0.1),
          ],
          stops: const [0.1, 1]),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          (isDark ? Colors.white30 : Colors.white).withValues(alpha: 0.5),
          (isDark ? Colors.white10 : Colors.white).withValues(alpha: 0.2),
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
    final isDark = themeData.brightness == Brightness.dark;
    
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? themeData.colorScheme.primary.withValues(alpha: 0.2) : Colors.transparent,
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
                  : (isDark ? Colors.white.withValues(alpha: 0.7) : themeData.textTheme.bodySmall!.color!.withValues(alpha: 0.6)),
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
