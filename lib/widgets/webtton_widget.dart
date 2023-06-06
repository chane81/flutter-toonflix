import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final WebtoonModel webtoonModel;

  const Webtoon({super.key, required this.webtoonModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(webtoonModel: webtoonModel),
                fullscreenDialog: true));
      },
      child: Column(
        children: [
          Hero(
            tag: webtoonModel.id,
            child: Container(
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
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            webtoonModel.title,
            style: const TextStyle(fontSize: 22),
          )
        ],
      ),
    );
  }
}
