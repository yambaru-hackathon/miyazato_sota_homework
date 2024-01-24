import 'package:flutter/material.dart';

class Styles {
  static ButtonStyle setRadiusValue(double value) {
    return (OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(value),
    )));
  }

  static const mediumTextBold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
}

class PostItem {
  final String? image;
  final String? title;
  final String? description;
  final String? date;
  final String? location;
  final String? likes;
  final String? comments;
  final String? shares;

  PostItem({
    this.image,
    this.title,
    this.description,
    this.date,
    this.location,
    this.likes,
    this.comments,
    this.shares,
  });
}

class FeedPage extends StatelessWidget {
  FeedPage({Key? key}) : super(key: key);

  final List<Map> postProfiles = [
    {
      'image':
          'https://static-00.iconduck.com/assets.00/instagram-icon-1024x1024-8qt57uwd.png',
      'name': 'Instagram',
      'verified': true,
      'location': 'サンディエゴ',
    },
    {
      'image':
          'https://static-00.iconduck.com/assets.00/instagram-icon-1024x1024-8qt57uwd.png',
      'name': 'Instagram',
      'verified': true,
      'location': 'サンディエゴ',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('フィード'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 0.5,
              width: double.infinity,
              color: const Color.fromARGB(255, 205, 205, 205),
            ),
            PostProfile(profiles: postProfiles[0]),
            Image.network(
              'https://static-00.iconduck.com/assets.00/instagram-icon-1024x1024-8qt57uwd.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}

class PostProfile extends StatelessWidget {
  const PostProfile({Key? key, required this.profiles }) : super(key: key);

  final Map<dynamic, dynamic> profiles;

  @override
  Widget build(BuildContext context) {
    return (
      Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              profiles['image'],
              height: 35,
              width: 35,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Instagram', style: Styles.mediumTextBold),
                    Padding(
                        padding: EdgeInsets.all(4.0),
                        child:
                            Icon(Icons.verified, color: Colors.blue, size: 16))
                  ],
                ),
                Text('サンディエゴ'),
              ],
            ),
          ),
          const Expanded(child: Spacer()),
          IconButton(onPressed: () => {}, icon: const Icon(Icons.more_horiz))
        ],
      ),
    ));
  }
}
