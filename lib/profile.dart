import 'package:blogclub/gen/assets.gen.dart';
import 'package:blogclub/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 64),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Profile', style: themeData.textTheme.headlineMedium),
                  CupertinoSwitch(
                    activeColor: themeData.colorScheme.primary,
                    value: themeData.brightness == Brightness.dark,
                    onChanged: (value) {
                      MyApp.of(context).toggleTheme(value);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(24),
              margin: const EdgeInsets.symmetric(horizontal: 32),
              decoration: BoxDecoration(
                color: themeData.colorScheme.surface,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  )
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset('assets/img/stories/myimg.jpg', width: 84, height: 84, fit: BoxFit.cover),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('@mohsen_bagheri', style: themeData.textTheme.bodySmall),
                            const SizedBox(height: 4),
                            Text('Mohsen Bagheri', style: themeData.textTheme.titleLarge),
                            const SizedBox(height: 8),
                            Text('Computer Engineering Student', style: TextStyle(color: themeData.colorScheme.primary, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _ProfileStat(count: '52', label: 'Posts'),
                      _ProfileStat(count: '2.1k', label: 'Followers'),
                      _ProfileStat(count: '158', label: 'Following'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: themeData.colorScheme.surface,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('My Posts', style: themeData.textTheme.titleLarge),
                        IconButton(onPressed: () {}, icon: const Icon(Icons.grid_view_rounded, color: Colors.blue)),
                      ],
                    ),
                  ),
                  _MyPostItem(image: Assets.img.background.onboarding.image(), title: 'Mobile Dev at Arak Uni'),
                  _MyPostItem(image: Assets.img.background.splash.image(), title: 'Flutter Performance Tips'),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileStat extends StatelessWidget {
  final String count;
  final String label;
  const _ProfileStat({required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(count, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 4),
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}

class _MyPostItem extends StatelessWidget {
  final Widget image;
  final String title;
  const _MyPostItem({required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(width: 100, height: 80, child: image),
          ),
          const SizedBox(width: 16),
          Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }
}
