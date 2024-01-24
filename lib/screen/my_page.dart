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

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('マイページ'), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network(
                    'https://static-00.iconduck.com/assets.00/instagram-icon-1024x1024-8qt57uwd.png',
                    height: 80,
                    width: 80,
                  ),
                  const Spacer(),
                  const Column(children: [
                    Text('7,041', style: Styles.mediumTextBold),
                    Text('投稿'),
                  ]),
                  const SizedBox(width: 16),
                  const Column(children: [
                    Text('4.6億', style: Styles.mediumTextBold),
                    Text('フォロワー'),
                  ]),
                  const SizedBox(width: 16),
                  const Column(children: [
                    Text('99', style: Styles.mediumTextBold),
                    Text('フォロー'),
                  ])
                ]),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Instagram',
                style: Styles.mediumTextBold,
              ),
              Text(
                '#YoursToMake',
                style: TextStyle(color: Colors.blue),
              ),
              Text(
                'help.instagram.com',
                style: TextStyle(color: Colors.blue),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                            onPressed: () => {},
                            style: Styles.setRadiusValue(8.0),
                            child: const Text(
                              'フォロー中',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            )),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: OutlinedButton(
                            onPressed: () => {},
                            style: Styles.setRadiusValue(8.0),
                            child: const Text(
                              'メッセージ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 4),
                OutlinedButton(
                    onPressed: () => {},
                    style: Styles.setRadiusValue(8.0),
                    child: const Icon(Icons.keyboard_arrow_down,
                        color: Colors.black))
              ],
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            primary: false,
            crossAxisCount: 3,
            children: <Widget>[
              Image.network(
                'https://static-00.iconduck.com/assets.00/instagram-icon-1024x1024-8qt57uwd.png',
              ),
            ],
          )
        ]),
      ),
    );
  }
}
