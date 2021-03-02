import 'package:flutter/material.dart';

class DrawerView extends StatefulWidget{
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
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView(
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  child: Image.network(
                    '',
                    width: 30,
                    height: 30,
                  ),
                ),
                Container(
                  child: new Text(
                    '张三2021',
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
          Container(
            height: 150,
            padding: EdgeInsets.all(20),
            child: Stack(
              children: [
                Row(
                  children: [
                    Column(
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
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.white,
                                  width: 1
                              )
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Positioned(
                    bottom: 0,
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
          )
        ],
      ),
    );
  }
}