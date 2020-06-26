import 'package:flutter/material.dart';
import 'package:projeto_estrutura/model/other_videos_model.dart';
import 'package:projeto_estrutura/provider/view_state_list_model.dart';
import 'package:projeto_estrutura/model/song_model.dart';
import 'package:localstorage/localstorage.dart';

const String kLocalStorageSearch = 'kLocalStorageSearch';
const String kFavoriteList = 'kFavoriteList';

class FavoriteListModel extends ViewStateListModel<OtherVideos> {
  FavoriteModel favoriteModel;

  FavoriteListModel({this.favoriteModel});
  @override
  Future<List<OtherVideos>> loadData() async {
    LocalStorage localStorage = LocalStorage(kLocalStorageSearch);
    await localStorage.ready;
    List<OtherVideos> favoriteList =
        (localStorage.getItem(kFavoriteList) ?? []).map<OtherVideos>((item) {
      return OtherVideos.fromJsonMap(item);
    }).toList();
    favoriteModel.setFavorites(favoriteList);
    setIdle();
    return favoriteList;
  }
}

class FavoriteModel with ChangeNotifier {
  List<OtherVideos> _favoriteVideo;
  List<OtherVideos> get favoriteVideos => _favoriteVideo;

  setFavorites(List<OtherVideos> favoriteVideos) {
    _favoriteVideo = favoriteVideos;
    notifyListeners();
  }

  collect(OtherVideos video) {
    if (_favoriteVideo.contains(video)) {
      _favoriteVideo.remove(video);
    } else {
      _favoriteVideo.add(video);
    }
    saveData();
    notifyListeners();
  }

  saveData() async {
    LocalStorage localStorage = LocalStorage(kLocalStorageSearch);
    await localStorage.ready;
    localStorage.setItem(kFavoriteList, _favoriteVideo);
  }

  isCollect(OtherVideos newVideo) {
    bool isCollect = false;
    for (int i = 0; i < _favoriteVideo.length; i++) {
      if (_favoriteVideo[i].id == newVideo.id) {
        isCollect = true;
        break;
      }
    }
    return isCollect;
  }
}
