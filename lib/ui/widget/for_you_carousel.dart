import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:projeto_estrutura/generated/i18n.dart';
import 'package:projeto_estrutura/model/other_videos_model.dart';
import 'package:projeto_estrutura/ui/page/tab/music_page.dart';
import 'package:provider/provider.dart';

class ForYouCarousel extends StatefulWidget {
  @override
  _ForYouCarouselState createState() => _ForYouCarouselState();
}

class _ForYouCarouselState extends State<ForYouCarousel> {
  final videos = [
    OtherVideos('sZZtoy9wyso', 'Lista', 'asset-1.png'),
    OtherVideos('jTR2z4-T02Q', 'Fila', 'asset-1.png'),
    OtherVideos('jwi55FknePI', 'Bubblesort', 'asset-1.png'),
    OtherVideos('gRxmMi1Kdn0', 'Árvore Binária', 'asset-1.png'),
    OtherVideos('OwTAc0s750U', 'Quick Sort', 'asset-1.png'),
    OtherVideos('MuuZxSWL1eY', 'Merge Sort', 'asset-1.png'),
  ];
  Widget _buildSongItem(OtherVideos data) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Container(
                width: 50,
                height: 50,
                child: Image.asset(
                  "assets/images/" + data.image,
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    data.title,
                    style: data.id == null
                        ? TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          )
                        : TextStyle(
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
                    style: data.id == null
                        ? TextStyle(
                            fontSize: 10.0,
                            color: Colors.grey,
                          )
                        : TextStyle(
                            fontSize: 10.0,
                            color: Colors.grey,
                          ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ]),
          ),
          // IconButton(
          //     onPressed: () => favoriteModel.collect(data),
          //     icon: data.id == null
          //         ? Icon(
          //             Icons.favorite_border,
          //             color: Colors.grey,
          //             size: 20.0,
          //           )
          //         : favoriteModel.isCollect(data)
          //             ? Icon(
          //                 Icons.favorite,
          //                 color: Theme.of(context).accentColor,
          //                 size: 20.0,
          //               )
          //             : Icon(
          //                 Icons.favorite_border,
          //                 size: 20.0,
          //               ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(S.of(context).forYou,
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2)),
            GestureDetector(
              onTap: () => {
                print('View All'),
              },
              child: Text(S.of(context).viewAll,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600,
                  )),
            ),
          ],
        ),
      ),
      ListView.builder(
        shrinkWrap: true,
        physics: new NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: videos.length,
        itemBuilder: (BuildContext context, int index) {
          OtherVideos data = videos[index];
          return GestureDetector(
            onTap: () {
              if (null != data.id) {
                // SongModel songModel = Provider.of(context);
                // songModel.setSongs(new List<Song>.from(videos));
                // songModel.setCurrentIndex(index);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PlayPage(),
                  ),
                );
              }
            },
            child: _buildSongItem(data),
          );
        },
      ),
    ]);
  }
}
