import 'package:flutter/material.dart';

class Styles {
  static ButtonStyle setRadiusValue(double value) {
    return (   
      OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(value),
        )
      )
    );
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
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('マイページ'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.network(
                  'https://i1.wp.com/www.globemart.co.jp/newwp/wp-content/uploads/2020/07/png-transparent-instagram-application-logo-logo-computer-icons-instagram-miscellaneous-text-trademark.png',
                  width: 70,
                  height: 70,
                ),
                const Spacer(),
                const SizedBox(width: 16),
                const Column(
                  children: [
                    Text(
                      '7,041',
                      style: Styles.mediumTextBold
                    ),
                    Text('投稿'),
                  ]
                ),
                const SizedBox(width: 16),
                const Column(
                  children: [
                    Text(
                      '4.6億',
                      style: Styles.mediumTextBold
                    ),
                    Text('フォロワー'),
                  ]
                ),
                const SizedBox(width: 16),
                const Column(
                  children: [
                    Text(
                      '99',
                      style: Styles.mediumTextBold
                    ),
                    Text('フォロー'),
                  ]
                )
              ]
            ),
            const SizedBox(height: 16),
            const Text(
              'Instagram',
              style: Styles.mediumTextBold,
            ),
            const Text(
              '#YoursToMake',
              style: TextStyle(color: Colors.blue),
            ),
            const Text(
              'help.instagram.com',
              style: TextStyle(color: Colors.blue),
            ),
            Row(
              children: [
                OutlinedButton(
                  onPressed: () => {},
                  child: Text('フォロー中'),
                  style: Styles.setRadiusValue(8.0)
                ),
                OutlinedButton(
                  onPressed: () => {},
                  child: Text('メッセージ'),
                  style: Styles.setRadiusValue(8.0)
                ),
                OutlinedButton(
                  onPressed: () => {},
                  child: Icon(Icons.keyboard_arrow_down),
                  style: Styles.setRadiusValue(8.0)
                )
              ],
            )
          ]
        ),
      ),
    );
  }
}