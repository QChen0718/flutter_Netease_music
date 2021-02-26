import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideoDetail extends StatefulWidget{
  @override
  _VideoDetailState createState() => _VideoDetailState();
}

class _VideoDetailState extends State<VideoDetail>{
  PageController _pageController = PageController();
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
      body: PageView.builder(
          itemBuilder: (context,index){
            return Container();
          }
      )
      // Column(
      //   crossAxisAlignment: CrossAxisAlignment.end,
      //   children: [
      //     Container(
      //       margin: EdgeInsets.only(top: 120),
      //       child: Stack(
      //         alignment: AlignmentDirectional.center,
      //         children: [
      //           Container(
      //             width: ScreenUtil.screenWidth,
      //             height: 200,
      //             color: Colors.red,
      //           ),
      //           Container(
      //             width: 40,
      //             height: 40,
      //             color: Colors.blue,
      //           ),
      //           Positioned(
      //               right: 15,
      //               child: Container(
      //                 child: Icon(
      //                   Icons.phone_android_rounded,
      //                   size: 25,
      //                 ),
      //                 decoration: BoxDecoration(
      //                   color: Colors.grey
      //                 ),
      //               )
      //           )
      //         ],
      //       ),
      //     ),
      //     Container(
      //       child: Column(
      //         children: [
      //           Container(
      //             child: Image.asset(
      //               'images/icon_event_video_b_play.png',
      //               width: 25,
      //               height: 30,
      //             ),
      //           ),
      //           Container(
      //             child: Text(
      //               '内容'
      //             ),
      //           )
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}