import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class PlayPage extends StatefulWidget {
  @override
  _PlayPageState createState() => new _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  TextEditingController textEditingControllerUrl = new TextEditingController();
  TextEditingController textEditingControllerId = new TextEditingController();

  void playYoutubeVideo() {
    FlutterYoutube.playYoutubeVideoByUrl(
      apiKey: "<API_KEY>",
      videoUrl: "https://www.youtube.com/watch?v=wgTBLj7rMPM",
    );
  }

  void playYoutubeVideoEdit() {
    FlutterYoutube.onVideoEnded.listen((onData) {
      //perform your action when video playing is done
    });

    FlutterYoutube.playYoutubeVideoByUrl(
      apiKey: "AIzaSyB8_zVtbI_1yBtQ018xHtb6zRQu6cuotu4",
      videoUrl: textEditingControllerUrl.text,
    );
  }

  void playYoutubeVideoIdEdit() {
    FlutterYoutube.onVideoEnded.listen((onData) {
      //perform your action when video playing is done
    });

    FlutterYoutube.playYoutubeVideoById(
      apiKey: "AIzaSyB8_zVtbI_1yBtQ018xHtb6zRQu6cuotu4",
      videoId: textEditingControllerId.text,
    );
  }

  void playYoutubeVideoIdEditAuto() {
    FlutterYoutube.onVideoEnded.listen((onData) {
      //perform your action when video playing is done
    });

    FlutterYoutube.playYoutubeVideoById(
        apiKey: "AIzaSyB8_zVtbI_1yBtQ018xHtb6zRQu6cuotu4",
        videoId: textEditingControllerId.text,
        autoPlay: true);
  }

  List<String> titles = [
    "Lista",
    "Fila",
    "Bubblesort",
    "Árvore Binária",
    "Quick Sort",
    "Pilha",
    "Merge Sort"
  ];

  List<String> videos = [
    'sZZtoy9wyso',
    'jTR2z4-T02Q',
    'pPu5ztVGtUs',
    'jwi55FknePI',
    'gRxmMi1Kdn0',
    'OwTAc0s750U',
    'MuuZxSWL1eY',
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            Container(
              height: 100,
              child: ListView.builder(
                  itemCount: videos.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(titles[index].toString()),
                      onTap: () {
                        setState(() {
                          textEditingControllerId.text =
                              videos[index].toString();
                        });
                        playYoutubeVideoIdEdit();
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
