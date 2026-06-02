import 'package:blogclub/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      floatingActionButton: Container(
        width: 111,
        height: 48,
        decoration: BoxDecoration(
          color: themeData.colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: themeData.colorScheme.primary.withOpacity(0.5),
              offset: const Offset(0, 10),
            )
          ],
        ),
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              useRootNavigator: true,
              backgroundColor: Colors.transparent,
              builder: (context) => _ArticleShareModal(),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.img.icons.plus.image(width: 24, height: 24, color: Colors.white),
              const SizedBox(width: 8),
              Text(
                '2.1k',
                style: TextStyle(
                    color: themeData.colorScheme.onPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                title: const Text('Article'),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_horiz_rounded)),
                  const SizedBox(width: 16),
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                    child: Text(
                      'Four precations for mobile apps developers',
                      style: themeData.textTheme.headlineMedium,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 0, 16, 32),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Assets.img.stories.story9.image(
                              width: 48, height: 48, fit: BoxFit.cover),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mohsen Bagheri',
                                style: themeData.textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              const SizedBox(height: 4),
                              const Text('2 minutes ago'),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(CupertinoIcons.share,
                              color: themeData.colorScheme.primary),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(CupertinoIcons.bookmark,
                              color: themeData.colorScheme.primary),
                        ),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32)),
                    child: Assets.img.background.onboarding.image(),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
                    child: Text(
                      'Designing a Mobile Experience',
                      style: themeData.textTheme.headlineSmall,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 0, 32, 128),
                    child: Text(
                      'In software engineering, mobile computing is a significant domain. As a student at Arak University, I have focused on high-performance rendering techniques in cross-platform frameworks like Flutter.\n\nDeveloping mobile apps requires careful attention to state management, layout constraints, and user engagement. In this article, we explore how modern UI patterns can improve the perceived performance of an application.\n\nThe use of Glassmorphism and liquid glass effects, as seen in the navigation bar of this project, is a prime example of how we can push the boundaries of standard Material Design to achieve a more premium, Apple-like user experience.',
                      style: themeData.textTheme.bodyMedium!.copyWith(fontSize: 14),
                    ),
                  ),
                ]),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 116,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    themeData.colorScheme.surface,
                    themeData.colorScheme.surface.withOpacity(0),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _ArticleShareModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 32),
          const Text('Share this article with your friends'),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _ShareIcon(icon: Assets.img.icons.google.image(), label: 'Google'),
              _ShareIcon(icon: Assets.img.icons.facebook.image(), label: 'Facebook'),
              _ShareIcon(icon: Assets.img.icons.twitter.image(), label: 'Twitter'),
            ],
          ),
        ],
      ),
    );
  }
}

class _ShareIcon extends StatelessWidget {
  final Widget icon;
  final String label;

  const _ShareIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(width: 48, height: 48, child: icon),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}
