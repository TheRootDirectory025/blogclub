import 'package:blogclub/gen/assets.gen.dart';
import 'package:blogclub/gen/fonts.gen.dart';
import 'package:blogclub/home.dart';
import 'package:blogclub/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: FontFamily.avenir,
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
                fontFamily: FontFamily.avenir,
                color: secondaryTextColor,
                fontWeight: FontWeight.w200,
                fontSize: 18),
            titleLarge: TextStyle(
                fontFamily: FontFamily.avenir,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: primaryTextColor),
            headlineMedium: TextStyle(
                fontFamily: FontFamily.avenir,
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: primaryTextColor),
            headlineSmall: TextStyle(
                fontFamily: FontFamily.avenir,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: primaryTextColor),
            bodySmall: TextStyle(
                fontFamily: FontFamily.avenir,
                fontWeight: FontWeight.w700,
                color: Color(0xff7B8BB2),
                fontSize: 10),
            titleSmall: TextStyle(
                fontFamily: FontFamily.avenir,
                color: primaryTextColor,
                fontWeight: FontWeight.w400,
                fontSize: 14),
            bodyMedium: TextStyle(
                fontFamily: FontFamily.avenir,
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
      body: Stack(
        children: [
          Positioned.fill(
            bottom: 65,
            child: IndexedStack(
              index: selectedTabIndex,
              children: const [
                HomeScreen(),
                _PlaceholderScreen(title: 'Scientific Articles'),
                _PlaceholderScreen(title: 'Search Database'),
                _ProjectInfoScreen(),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
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

/// Dedicated Project Information Screen for Academic Submission.
class _ProjectInfoScreen extends StatelessWidget {
  const _ProjectInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          Assets.img.icons.logo.svg(width: 80),
          const SizedBox(height: 24),
          Text('BACHELOR THESIS PROJECT', 
            style: themeData.textTheme.bodySmall!.copyWith(letterSpacing: 2)),
          const SizedBox(height: 8),
          Text('Blog Club: Mobile Edition', 
            style: themeData.textTheme.headlineMedium),
          const Divider(height: 64),
          _infoRow(context, 'Developer', 'Mohsen Bagheri'),
          _infoRow(context, 'Supervisors', 'Prof. Rahmani\nProf. Abbasnezhad'),
          _infoRow(context, 'Institution', 'Arak University'),
          _infoRow(context, 'Department', 'Computer Engineering'),
          _infoRow(context, 'Academic Year', '2023 - 2024'),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: themeData.colorScheme.primary.withOpacity(0.05),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              'This application explores high-performance rendering techniques and modern UI patterns in cross-platform mobile development using the Flutter framework.',
              textAlign: TextAlign.center,
              style: themeData.textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(label, style: Theme.of(context).textTheme.bodySmall),
          ),
          Expanded(
            flex: 3,
            child: Text(value, 
              style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}

class _PlaceholderScreen extends StatelessWidget {
  final String title;
  const _PlaceholderScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium,
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
    return SizedBox(
      height: 85,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 65,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: const Color(0xff9b8487).withOpacity(0.3),
                ),
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BottomNavigationItem(
                      iconFileName: 'Home.png',
                      activeIconFileName: 'Home.png',
                      title: 'Home',
                      isActive: selectedIndex == homeTabIndex,
                      onTap: () => onTap(homeTabIndex)),
                  BottomNavigationItem(
                      iconFileName: 'Articles.png',
                      activeIconFileName: 'Articles.png',
                      title: 'Article',
                      isActive: selectedIndex == articleTabIndex,
                      onTap: () => onTap(articleTabIndex)),
                  const SizedBox(
                    width: 8,
                  ),
                  BottomNavigationItem(
                      iconFileName: 'Search.png',
                      activeIconFileName: 'Search.png',
                      title: 'Search',
                      isActive: selectedIndex == searchTabIndex,
                      onTap: () => onTap(searchTabIndex)),
                  BottomNavigationItem(
                      iconFileName: 'Menu.png',
                      activeIconFileName: 'Menu.png',
                      title: 'Project',
                      isActive: selectedIndex == menuTabIndex,
                      onTap: () => onTap(menuTabIndex)),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              width: 65,
              height: 85,
              alignment: Alignment.topCenter,
              child: Container(
                height: 65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.5),
                    color: const Color(0xff376AED),
                    border: Border.all(color: Colors.white, width: 4)),
                child: Image.asset('assets/img/icons/plus.png'),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  final String iconFileName;
  final String activeIconFileName;
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const BottomNavigationItem(
      {Key? key,
      required this.iconFileName,
      required this.activeIconFileName,
      required this.title,
      required this.isActive,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/img/icons/$iconFileName',
            color: isActive
                ? themeData.colorScheme.primary
                : themeData.textTheme.bodySmall!.color,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            title,
            style: themeData.textTheme.bodySmall!.apply(
                color: isActive
                    ? themeData.colorScheme.primary
                    : themeData.textTheme.bodySmall!.color),
          )
        ],
      ),
    );
  }
}
