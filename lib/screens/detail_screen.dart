import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';

class DetailScreen extends StatelessWidget {
  final WebtoonModel webtoonModel;

  const DetailScreen({super.key, required this.webtoonModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Text(
          webtoonModel.title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        ),
      ),
      body: Column(children: [
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        offset: const Offset(5, 10),
                        color: Colors.black.withOpacity(0.5))
                  ]),
              child: Image.network(webtoonModel.thumb, headers: const {
                'Referer': 'https://comic.naver.com',
              }),
            ),
          ],
        )
      ]),
    );
  }
}
