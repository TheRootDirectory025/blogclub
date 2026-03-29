class StoryData {
  final int id;
  final String name;
  final String imageFileName;
  final String iconFileName;
  final bool isViewed;

  StoryData(
      {required this.id,
      required this.name,
      required this.imageFileName,
      required this.iconFileName,
      required this.isViewed});
}

class Category {
  final int id;
  final String title;
  final String imageFileName;

  Category(
      {required this.id, required this.title, required this.imageFileName});
}

class PostData {
  final int id;
  final String caption;
  final String title;
  final String likes;
  final String time;
  final bool isBookmarked;
  final String imageFileName;

  PostData(
      {required this.id,
      required this.caption,
      required this.title,
      required this.likes,
      required this.time,
      required this.isBookmarked,
      required this.imageFileName});
}

class AppDatabase {
  static List<StoryData> get stories {
    return [
      StoryData(
          id: 1001,
          name: 'Prof. Rahmani',
          imageFileName: 'story_10.jpg', // Changed from story_9 to story_10 (Richard - Male)
          iconFileName: 'category_1.png',
          isViewed: false),
      StoryData(
          id: 1002,
          name: 'Computer Eng.',
          imageFileName: 'story_3.jpg', // Lucas - Male
          iconFileName: 'category_2.png',
          isViewed: false),
      StoryData(
          id: 1003,
          name: 'Mohsen Bagheri',
          imageFileName: 'myimg.jpg',
          iconFileName: 'category_3.png',
          isViewed: true),
      StoryData(
          id: 1004,
          name: 'Arak University',
          imageFileName: 'story_8.jpg', // Changed for variety
          iconFileName: 'category_4.png',
          isViewed: false),
      StoryData(
          id: 1005,
          name: 'Faculty of Eng.',
          imageFileName: 'story_4.jpg',
          iconFileName: 'category_2.png',
          isViewed: false),
      StoryData(
          id: 1006,
          name: 'CE Dept.',
          imageFileName: 'story_6.jpg',
          iconFileName: 'category_1.png',
          isViewed: false),
    ];
  }

  static List<Category> get categories {
    return [
      Category(id: 101, title: 'Software Architecture', imageFileName: 'large_post_1.jpg'),
      Category(id: 102, title: 'Mobile Computing', imageFileName: 'large_post_2.jpg'),
      Category(id: 103, title: 'UI/UX Design', imageFileName: 'large_post_3.jpg'),
      Category(id: 104, title: 'Dart & Flutter', imageFileName: 'large_post_4.jpg'),
      Category(id: 105, title: 'Cloud Integration', imageFileName: 'large_post_5.jpg'),
      Category(id: 106, title: 'Data Structures', imageFileName: 'large_post_6.jpg'),
    ];
  }

  static List<PostData> get posts {
    return [
      PostData(
          id: 1,
          title: 'Analysis of Cross-Platform Performance in Flutter',
          caption: 'Bachelor Thesis',
          isBookmarked: false,
          likes: '4.5k',
          time: 'Final Version',
          imageFileName: 'small_post_1.jpg'),
      PostData(
          id: 0,
          title: 'Implementation of Modern Navigation Patterns',
          caption: 'UI Engineering',
          isBookmarked: false,
          likes: '2.1k',
          time: 'Project Doc',
          imageFileName: 'small_post_2.jpg'),
      PostData(
          id: 2,
          title: 'State Management and Lifecycle in Mobile Apps',
          caption: 'Advanced Dev',
          isBookmarked: true,
          likes: '3.8k',
          time: 'Research Paper',
          imageFileName: 'small_post_3.jpg'),
    ];
  }

  static List<OnBoardingItem> get onBoardingItems {
    return [
      OnBoardingItem('Final Year Project: Blog Club',
          'A comprehensive software engineering project submitted to Arak University Computer Dept.'),
      OnBoardingItem('Designed by Mohsen Bagheri',
          'Under supervision of Prof. Rahmani. 2023-2024 Academic Year.'),
      OnBoardingItem('Scalable Architecture',
          'Leveraging Flutter rendering engine for high-performance mobile application deployment.'),
      OnBoardingItem('Research & Development',
          'Focusing on user-centric design and efficient state preservation in modern mobile apps.'),
    ];
  }
}

class OnBoardingItem {
  final String title;
  final String description;

  OnBoardingItem(this.title, this.description);
}
