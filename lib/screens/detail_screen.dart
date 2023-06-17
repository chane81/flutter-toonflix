import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_detail_model.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:toonflix/services/api_service.dart';

class DetailScreen extends StatefulWidget {
  //final WebtoonModel webtoonModel;
  final String id, thumb, title;

  const DetailScreen(
      {super.key, required this.id, required this.thumb, required this.title});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;

  @override
  void initState() {
    super.initState();

    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLatestEpisodesById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Text(
          widget.title,
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
            Hero(
              tag: widget.id,
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
                child: Image.network(widget.thumb, headers: const {
                  'Referer': 'https://comic.naver.com',
                }),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        FutureBuilder(
          future: webtoon,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(snapshot.data!.about,
                        style: const TextStyle(fontSize: 16)),
                    const SizedBox(
                      height: 15,
                    ),
                    Text('${snapshot.data!.genre} / ${snapshot.data!.age}',
                        style: const TextStyle(
                            fontSize: 16, color: Colors.black54)),
                  ],
                ),
              );
            }
            return const Text('...');
          },
        )
      ]),
    );
  }
}
