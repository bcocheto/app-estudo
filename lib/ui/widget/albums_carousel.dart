// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:projeto_estrutura/generated/i18n.dart';
// import 'package:projeto_estrutura/model/song_model.dart';
// import 'package:projeto_estrutura/ui/page/albums_page.dart';
import 'package:projeto_estrutura/model/video_model.dart';

class AlbumsCarousel extends StatefulWidget {
  @override
  _AlbumsCarouselState createState() => _AlbumsCarouselState();
}

class _AlbumsCarouselState extends State<AlbumsCarousel> {
  TextEditingController textEditingControllerUrl = new TextEditingController();
  TextEditingController textEditingControllerId = new TextEditingController();
  final videos = [
    Video('sZZtoy9wyso', 'Lista', 'asset-1.png'),
    Video('jTR2z4-T02Q', 'Fila', 'asset-1.png'),
    Video('jwi55FknePI', 'Bubblesort', 'asset-1.png'),
    Video('gRxmMi1Kdn0', 'Árvore Binária', 'asset-1.png'),
    Video('OwTAc0s750U', 'Quick Sort', 'asset-1.png'),
    Video('MuuZxSWL1eY', 'Merge Sort', 'asset-1.png'),
  ];

  void playYoutubeVideoIdEdit() {
    FlutterYoutube.onVideoEnded.listen((onData) {
      //perform your action when video playing is done
    });
    FlutterYoutube.playYoutubeVideoById(
      apiKey: "AIzaSyDbkOUcWRUVv2Fy1-6IDunMXrYLNchcTeY",
      videoId: textEditingControllerId.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(S.of(context).videos,
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2)),
          ],
        ),
      ),
      Column(
        children: <Widget>[
          Container(
            height: 200,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: videos.length,
              itemBuilder: (BuildContext context, int index) {
                Video data = videos[index];
                return GestureDetector(
                  onTap: () => {},
                  child: Container(
                    width: 140,
                    margin: index == videos.length - 1
                        ? EdgeInsets.only(right: 20.0)
                        : EdgeInsets.only(right: 0.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: GestureDetector(
                                child: Image.asset(
                                  "assets/images/" + data.image,
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                                onTap: () {
                                  print(videos[index].title);
                                  setState(() {
                                    textEditingControllerId.text =
                                        videos[index].toString();
                                  });
                                  playYoutubeVideoIdEdit();
                                }),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            data.title,
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            data.category,
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.grey,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      )
    ]);
  }
}
