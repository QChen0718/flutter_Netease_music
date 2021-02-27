import 'package:flutter/cupertino.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:netease_cloud_music/model/video.dart';
// 视频播放列表控制器
class VideoListController {
  ///  构造方法
  VideoListController();

  /// 捕捉滑动，实现翻页
  void setPageController(PageController pageController) {
    //监听pageViewController的滑动位置，然后做出播放对应的视频和暂停之前的视频
    pageController.addListener(() {
      var p = pageController.page;
      if(p%1==0){
        int target = p ~/ 1;
        if(index.value == target) return;
      //  播放当前的，暂停其他的
        var oldIndex = index.value;
        var newIndex = target;
        playerOfIndex(oldIndex).seekTo(0);
        playerOfIndex(oldIndex).pause();
        playerOfIndex(newIndex).start();
      //  完成
        index.value = target;
      }
    });
  }
  /// 目前视频序号
  ValueNotifier<int> index = ValueNotifier<int>(0);

  /// 获取指定index的player
  FijkPlayer playerOfIndex(int index) => playerList[index];

  /// 视频总数目
  int get videoCount => playerList.length;

  /// 在当前的list后面继续增加视频，并预加载封面
  addVideoInfo(List<UserVideo> list){
    for(var info in list){
      playerList.add(
          FijkPlayer()
              ..setDataSource(
                info.url,
                autoPlay: playerList.length == 0,
                showCover: true
              )
              ..setLoop(0), //循环播放
      );
    }
  }
  /// 初始化视频播放
  init(PageController pageController, List<UserVideo> initialList) {
    //添加视频播放列表资源
    addVideoInfo(initialList);
    setPageController(pageController);
  }
  /// 视频列表
  List<FijkPlayer> playerList = [];

  /// 当前播放的视频
  FijkPlayer get currentPlayer => playerList[index.value];

  /// 当前播放的状态
  bool get isPlaying => currentPlayer.state == FijkState.started;

  /// 销毁全部
  void dispose(){
    for (var player in playerList) {
      player.dispose();
    }
    playerList = [];
  }
}