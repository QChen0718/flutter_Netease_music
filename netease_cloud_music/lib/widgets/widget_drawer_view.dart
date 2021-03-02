
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/model/user.dart';
import 'package:netease_cloud_music/utils/navigator_util.dart';

class DrawerView extends StatefulWidget{
  final Account user;
  final Profile profile;
  const DrawerView({Key key, this.user,this.profile}) : super(key: key);
  @override
  _DrawerViewState createState() => _DrawerViewState();
}
class _DrawerViewState extends State<DrawerView> {
  Map<String,dynamic> userDataDict = {
    'section1':[
      {"icon":'','title':'我的消息','isShowRightView':true},
      {"icon":'','title':'云贝中心','isShowRightView':true},
      {"icon":'','title':'创作者中心','isShowRightView':false}
    ],
    'section2':[
      {"icon":'','title':'云村有票','isShowRightView':true},
      {"icon":'','title':'商城','isShowRightView':true},
      {"icon":'','title':'游戏专区','isShowRightView':false},
      {"icon":'','title':'口袋彩铃','isShowRightView':true}
    ],
    'section3':[
      {"icon":'','title':'设置','isShowRightView':true},
      {"icon":'','title':'夜间模式','isShowRightView':true},
      {"icon":'','title':'定时关闭','isShowRightView':false},
      {"icon":'','title':'个性装扮','isShowRightView':true},
      {"icon":'','title':'边听边存','isShowRightView':true},
      {"icon":'','title':'在线听歌免流量','isShowRightView':true},
      {"icon":'','title':'音乐黑名单','isShowRightView':false},
      {"icon":'','title':'青少年模式','isShowRightView':true},
      {"icon":'','title':'音乐闹钟','isShowRightView':true}
    ],
    'section4':[
      {"icon":'','title':'我的订单','isShowRightView':true},
      {"icon":'','title':'优惠券','isShowRightView':true},
      {"icon":'','title':'帮助与反馈','isShowRightView':false},
      {"icon":'','title':'分享网易云音乐','isShowRightView':true},
      {"icon":'','title':'关于','isShowRightView':true},
    ]
  };
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 320,
      color: Color(0xffF3F3F3),
      child: ListView(
        children: [
          InkWell(
            onTap: () => NavigatorUtil.goUserDetailPage(context, widget.user.id),
            child: Container(
              margin: EdgeInsets.only(left: 15,right: 15,top: 20),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        widget.profile.avatarUrl,
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ),
                  Container(
                    child: new Text(
                      widget.profile.nickname,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16
                      ),
                    ),
                  ),
                  Container(
                      child: Image.asset(
                        '',
                        width: 10,
                        height: 18,
                      )
                  ),
                  Expanded(
                      child: Image.asset(
                        '',
                        width: 25,
                        height: 25,
                      )
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 150,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(left: 15,right: 15,top: 20,bottom: 15),
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            '开通黑胶VIP',
                            style: TextStyle(
                                fontSize: 26,
                                color: Colors.white
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              child: Text(
                                '立享超17项专属特权',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white.withOpacity(0.6)
                                ),
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white.withOpacity(0.6),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){

                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 8,right: 8,top: 5,bottom: 5),

                          child: Text(
                            '会员中心',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12
                            ),
                            textAlign: TextAlign.center,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.white,
                                  width: 1
                              ),
                            borderRadius: BorderRadius.circular(15)
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Positioned(
                    bottom: 0,
                    height: 30,
                    width: 228,
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            '黑胶VIP仅5元！每天低至0.16元！',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 15
                            ),
                          ),
                        ),
                        Expanded(
                            child: Container(
                              child: Image.asset(
                                '',
                                width: 20,
                                height: 20,
                              ),
                            )
                        )
                      ],
                    )
                )
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10)
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15,right: 15,bottom: 15),
            padding: EdgeInsets.only(left: 15,right: 15),
            child: Column(
              children: List.generate(userDataDict['section1'].length, (index) {
                return cellItem(userDataDict['section1'][index]);
              })
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15,right: 15,bottom: 15),
            padding: EdgeInsets.only(left: 15,right: 15),
            child: Column(
                children: List.generate(userDataDict['section2'].length, (index) {
                  return cellItem(userDataDict['section2'][index]);
                })
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15,right: 15,bottom: 15),
            padding: EdgeInsets.only(left: 15,right: 15),
            child: Column(
                children: List.generate(userDataDict['section3'].length, (index) {
                  return cellItem(userDataDict['section3'][index]);
                })
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15,right: 15,bottom: 15),
            padding: EdgeInsets.only(left: 15,right: 15),
            child: Column(
                children: List.generate(userDataDict['section4'].length, (index) {
                  return cellItem(userDataDict['section4'][index]);
                })
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15,right: 15,bottom: 30),
            padding: EdgeInsets.only(top: 10,bottom: 10),
            child: Text(
              '退出登录/关闭',
              style: TextStyle(
                color: Colors.red,
                fontSize: 16
              ),
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
                borderRadius: BorderRadius.circular(10)
            ),
          )
        ],
      ),
    );
  }

  Widget cellItem(Map<String,dynamic> cellDict){
    return Container(
      padding: EdgeInsets.only(top: 10,bottom: 10),
      child: Row(
        children: [
          Container(
            child: Image.asset(
              cellDict['icon'],
              width: 25,
              height: 25,
            ),
          ),
          Expanded(
              child: Container(
                child: Text(
                  cellDict['title'],
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87
                  ),
                ),
              ),
          ),
          Container(
            child: Center(
              child: Text(
                '7',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12
                ),
              ),
            ),
          ),
          Container(
            child: Icon(
              Icons.arrow_forward_ios
            ),
          )
        ],
      ),
    );
  }
}