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
      'name': 'Meri11Ra1',
      'verified': false,
      'location': '東京',
    },
  ];

  final List<Map> postItems = [
    {
      'image':
          'https://static-00.iconduck.com/assets.00/instagram-icon-1024x1024-8qt57uwd.png',
      'likes': "704,899"
    },
    {
      'image':
          'https://img.freepik.com/free-vector/hand-painted-watercolor-pastel-sky-background_23-2148902771.jpg?size=626&ext=jpg&ga=GA1.1.632798143.1706054400&semt=sph',
      'likes': "5"
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
            PostProfileWidget(profiles: postProfiles[0]),
            PostItemWidget(postItem: postItems[0]),
            PostProfileWidget(profiles: postProfiles[1]),
            PostItemWidget(postItem: postItems[1])
          ],
        ),
      ),
    );
  }
}

class PostProfileWidget extends StatelessWidget {
  const PostProfileWidget({Key? key, required this.profiles}) : super(key: key);

  final Map<dynamic, dynamic> profiles;

  // name
  // location
  // verified
  @override
  Widget build(BuildContext context) {
    return (Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
            child: Image.network(
              profiles['image'],
              height: 35,
              width: 35,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(profiles['name'], style: Styles.mediumTextBold),
                    Padding(
                        padding: EdgeInsets.all(4.0),
                        child: ifVerified(profiles['verified']))
                  ],
                ),
                Text(profiles['location']),
              ],
            ),
          ),
          const Spacer(),
          IconButton(onPressed: () => {}, icon: const Icon(Icons.more_horiz))
        ],
      ),
    ));
  }

  Widget ifVerified(bool verified) {
    if (verified) {
      return const Icon(Icons.verified, color: Colors.blue, size: 16);
    } else {
      return const Text("");
    }
  }
}

class PostItemWidget extends StatelessWidget {
  const PostItemWidget({Key? key, required this.postItem}) : super(key: key);

  final Map postItem;

//  image
//  likes
//  name
//  description
//  tag
  @override
  Widget build(BuildContext context) {
    return (Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            postItem['image'],
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () => {}, icon: const Icon(Icons.favorite_border)),
              IconButton(
                  onPressed: () => {},
                  icon: const Icon(Icons.chat_bubble_outline)),
              IconButton(onPressed: () => {}, icon: const Icon(Icons.send)),
              const Spacer(),
              IconButton(
                  onPressed: () => {}, icon: const Icon(Icons.bookmark_border)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('「いいね！」${postItem['likes']}件',
                style: Styles.mediumTextBold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('${postItem['name']} ${postItem['description']}'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('#${postItem['tag']}'),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('続きを読む'),
          ),
        ],
      ),
    ));
  }
}
