import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mozz/features/individual_chat_screen/widgets/own_message.dart';
import 'package:mozz/features/individual_chat_screen/widgets/reply_card.dart';

class IndividualScreen extends StatelessWidget {
  const IndividualScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 1,
          leading: Transform.scale(
            scale: 0.5,
            child: SvgPicture.asset(
              'images/left.svg',
            ),
          ),
          title: Row(
            children: [
              CircleAvatar(
                radius: 25,
              ),
              SizedBox(
                width: 12.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Виктор Власов',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.sp,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  Text(
                    'В сети',
                    style: TextStyle(
                      color: Color(0xFF5D7A90),
                      fontSize: 12.sp,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      body: Column(children: [
        Expanded(
          child: Container(
              child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: ListView(
              reverse: true,
              children: [
                BubbleSpecialThree(
                  text: 'Please try and give some feedback on it!',
                  color: Color(0xFF1B97F3),
                  tail: true,
                  isSender: false,
                  textStyle: TextStyle(color: Colors.white, fontSize: 16),
                ),
                BubbleSpecialThree(
                  text: 'Please try and give some feedback on it!',
                  color: Color(0xFF1B97F3),
                  tail: true,
                  textStyle: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(
                  height: 23,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 140,
                        height: 2,
                        color: Color(0xFFEDF2F6),
                      ),
                      Text(
                        '27.01.22',
                        style: TextStyle(
                          color: Color(0xFF9DB6CA),
                          fontSize: 13.sp,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      Container(
                        width: 140,
                        height: 2,
                        color: Color(0xFFEDF2F6),
                      ),
                    ]),
              ],
            ),
          )),
        ),
        Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 14, bottom: 44),
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border(top: BorderSide(color: Color(0xFFEDF2F6)))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 42,
                  height: 42,
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xFFEDF2F6)),
                  child: SvgPicture.asset('images/skrepka.svg')),
              Container(
                  width: 235,
                  height: 42,
                  decoration: BoxDecoration(
                      color: Color(0xFFEDF2F6),
                      borderRadius: BorderRadius.circular(12)),
                  child: TextField(
                    maxLines: 5,
                    minLines: 1,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        contentPadding: EdgeInsets.only(left: 12, right: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(color: Colors.black)),
                        hintText: 'Поиск',
                        prefixIconColor: Colors.grey),
                  )),
              Container(
                  width: 42,
                  height: 42,
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                  decoration: BoxDecoration(
                      color: Color(0xFFEDF2F6),
                      borderRadius: BorderRadius.circular(12)),
                  child: SvgPicture.asset('images/Audio.svg'))
            ],
          ),
        )
        // Container(
        //   padding: EdgeInsets.only(bottom: 23),
        //   decoration: BoxDecoration(
        //       color: Colors.green,
        //       border: Border(top: BorderSide(color: Colors.green))),
        //   child: Row(
        //     children: [
        //       Container(
        //         color: Colors.blue,
        //         padding: EdgeInsets.all(6.w),
        //         child: SvgPicture.asset('images/skrepka.svg'),
        //       ),
        //       // SizedBox(
        //       //   child: Container(
        //       //     width: 235.w,
        //       //     height: 42.h,
        //       //     decoration: BoxDecoration(
        //       //         color: Colors.red,
        //       //         borderRadius: BorderRadius.circular(12.r)),
        //       //     child: TextFormField(
        //       //       textAlignVertical: TextAlignVertical.center,
        //       //       keyboardType: TextInputType.multiline,
        //       //       maxLines: 5,
        //       //       minLines: 1,
        //       //       decoration: InputDecoration(
        //       //         contentPadding:
        //       //             EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        //       //         border: InputBorder.none,
        //       //         hintText: 'Сіздің хабарламаңыз...',
        //       //       ),
        //       //     ),
        //       //   ),
        //       // ),
        //     ],
        //   ),
        // )
      ]),
    );
  }
}
