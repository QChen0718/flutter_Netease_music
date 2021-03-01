import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/model/video.dart';
import 'package:netease_cloud_music/pages/video_detail/VideoPlayer.dart';
import 'package:netease_cloud_music/utils/net_utils.dart';
import 'package:netease_cloud_music/widgets/widget_video_button.dart';
import 'package:netease_cloud_music/widgets/widget_video_content_view.dart';

class VideoDetail extends StatefulWidget{
  final String mvid;

  const VideoDetail({Key key, this.mvid}) : super(key: key);
  @override
  _VideoDetailState createState() => _VideoDetailState();
}
//WidgetsBindingObserver wigets 绑定的观察者，通过遵循这个类可以很好的监听 VideoDetail 的生命周期变化
class _VideoDetailState extends State<VideoDetail> with WidgetsBindingObserver{
  PageController _pageController = PageController();
  // 视频列表控制器
  VideoListController _videoListController = VideoListController();
  // 视频列表数组
  List<UserVideo> videoDataList = [];
  // 记录是否点赞
  Map<int,bool> favoriteMap = {};
  /// 当系统将应用程序放到后台或返回时调用
  /// 应用程序到前台。
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if(state != AppLifecycleState.resumed) {
      //暂停播放
      _videoListController.currentPlayer.pause();
    }
  }
  //
  @override
  void dispose() {
    // TODO: implement dispose
    // 移除绑定的观察者
    WidgetsBinding.instance.removeObserver(this);
    // 暂停播放
    _videoListController.currentPlayer.pause();
    super.dispose();
  }
  // 初始化方法
  @override
  void initState() {
    // TODO: implement initState
    videoDataList = UserVideo.fetchVideo();
    WidgetsBinding.instance.addObserver(this);

    Future.delayed(Duration.zero,(){
      NetUtils.getMvData(context,mvid: widget.mvid).then((response){
        setState(() {
          videoDataList.insert(0, UserVideo(url:response.data.brs.s720,image: '',desc: response.data.desc));
          _videoListController.init(_pageController, videoDataList);
          // 默认播放
          _videoListController.currentPlayer.start();
        });
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: new Text(
          '视频详情'
        ),
      ),
      body: _videoListController.videoCount > 0 ?
      PageView.builder(
          controller: _pageController,
          pageSnapping: true, //设置滑动时显示一页
          scrollDirection: Axis.vertical, //设置滑动方向
          itemCount: _videoListController.videoCount,
          itemBuilder: (context,index){
            var data = videoDataList[index];
            bool isF = favoriteMap[index] ?? false;
            var player = _videoListController.playerOfIndex(index);
            // 右侧按钮
            Widget buttons = VideoButtonColumn(
              isFavorite: isF,
              onFavorite: (){
              //   点赞
                setState(() {
                  favoriteMap[index] = !isF;
                });
              },
              onComment: () {
                // 评论
              },
              onShare: () {
                // 分享
              },
            );
            // 视频视图 居中
            Widget currentVideo = Center(
              child: FijkView(
                fit: FijkFit.fitHeight,
                player: player,
                color: Colors.black,
                panelBuilder: (player,data,context,viewSize,texturePos) => Container(

                ),
              ),
            );
            Widget contentWidget = NeteaseVideoView(
              hidePauseIcon: player.state != FijkState.paused,
              aspectRatio: 9/16.0,
              key: Key(data.url + '$index'),
              tag: data.url,
              bottomPadding: 16.0,
              userInfoWidget: VideoUserInfo(
                  bottomPadding: 16,
                desc: data.desc,
              ),
              onSingleTap: () async{
                if(player.state == FijkState.started) {
                  await player.pause();
                }else {
                  await player.start();
                }
                setState(() {

                });
              },
              onAddFavorite: (){
                setState(() {
                  favoriteMap[index] = true;
                });
              },
              rightButtonColumn: buttons,
              video: currentVideo,
            );
            return contentWidget;
          }
      ):Container()
    );
  }
}