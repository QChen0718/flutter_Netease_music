import 'package:flutter/material.dart';
import 'package:netease_cloud_music/model/event.dart';
import 'package:netease_cloud_music/pages/video_detail/VideoGesture.dart';
import 'package:netease_cloud_music/utils/style.dart';

class NeteaseVideoView extends StatelessWidget{
  final Widget video;
  final double aspectRatio; //纵横比
  final String tag;
  final double bottomPadding;
  final Widget rightButtonColumn;
  final Widget userInfoWidget;
  final bool hidePauseIcon; // 是否隐藏暂停按钮
  final Function onAddFavorite;
  final Function onSingleTap;

  const NeteaseVideoView({
    Key key,
    this.video,
    this.aspectRatio,
    this.tag, this.bottomPadding,
    this.rightButtonColumn,
    this.userInfoWidget,
    this.hidePauseIcon,
    this.onAddFavorite,
    this.onSingleTap
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  //  右边按钮列表
    Widget rightButtons = rightButtonColumn ?? Container();
  //  用户信息
    Widget userInfo = userInfoWidget ?? VideoUserInfo(
        bottomPadding: bottomPadding
    );
  //  视频播放页
    Widget videoContainer = VideoGesture(
        onAddFavorite: onAddFavorite,
        onSingleTap: onSingleTap,
        child: Stack(
          children: [
          //  播放视图，
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black,
              alignment: Alignment.center,
              child: Container(
                child: AspectRatio(
                  aspectRatio: aspectRatio,
                  child: video,
                ),
              ),
            ),
          //  暂停按钮
          ],
        )
    );

    Widget body = Container(
      child: Stack(
        children: <Widget>[
        //  视频播放视图
          videoContainer,
        //  右边按钮视图
          Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.bottomRight,
            child: rightButtons,
          ),
        //  底部用户信息视图
          Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.bottomLeft,
            child: userInfo,
          )
        ],
      ),
    );
    return body;
  }
}

class VideoUserInfo extends StatelessWidget {
  final String desc;
  // final Function onGoodGift;
  const VideoUserInfo({
    Key key,
    @required this.bottomPadding,
    // @required this.onGoodGift,
    this.desc,
  }) : super(key: key);

  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 12,
        bottom: bottomPadding,
      ),
      margin: EdgeInsets.only(right: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '@朱二旦的枯燥生活',
            style: StandardTextStyle.big,
          ),
          Container(height: 6),
          Text(
            desc ?? '#原创 有钱人的生活就是这么朴实无华，且枯燥 #短视频',
            style: StandardTextStyle.normal,
          ),
          Container(height: 6),
          Row(
            children: <Widget>[
              Icon(Icons.music_note, size: 14),
              Expanded(
                child: Text(
                  '朱二旦的枯燥生活创作的原声',
                  maxLines: 9,
                  style: StandardTextStyle.normal,
                ),
              )
            ],
          )
        ],
      ),
      // color: Colors.red,
    );
  }
}