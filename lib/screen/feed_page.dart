import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

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
    {
      'image':
          'https://cdn-icons-png.flaticon.com/512/1077/1077114.png',
      'name': 'undefined',
      'verified': true,
      'location': '',
    }
  ];

  final List<Map> postItems = [
    {
      'image':
          'https://static-00.iconduck.com/assets.00/instagram-icon-1024x1024-8qt57uwd.png',
      'likes': "704,899",
      'description':
          'Exciting Updates Alert! 🚀 Swipe left to dive into the latest features and enhancements designed just for you. From sleek designs to powerful functionalities, your Instagram experience is getting a boost! 🌟✨'
    },
    {
      'image':
          'https://img.freepik.com/free-vector/hand-painted-watercolor-pastel-sky-background_23-2148902771.jpg?size=626&ext=jpg&ga=GA1.1.632798143.1706054400&semt=sph',
      'likes': "5",
      'description': 'きれいな画像'
    },
    {
      'image':
          'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
      'likes': '102',
      'description': 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
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
            PostItemWidget(postItem: postItems[1]),
            PostProfileWidget(profiles: postProfiles[2]),
            PostItemWidget(postItem: postItems[2]),
            const SizedBox(height: 100)
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
  final bool isReadMore = false;

//  image
//  likes
//  description

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
              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
              child: Text('「いいね！」${postItem['likes']}件',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14))),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ReadMoreText(
                postItem['description'],
                trimLines: 2,
                colorClickableText: Colors.pink,
                trimMode: TrimMode.Line,
                trimCollapsedText: '続きを読む',
                trimExpandedText: '閉じる',
                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold,),
                moreStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.grey),
                lessStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.grey),
              )),
        ],
      ),
    ));
  }
}
