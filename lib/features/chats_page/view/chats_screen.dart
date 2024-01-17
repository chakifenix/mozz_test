import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Container(
              padding: EdgeInsets.only(
                  left: 20.w, right: 20.w, top: 14.h, bottom: 24.h),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Color(0xFFEDF2F6)))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Чаты',
                    style: TextStyle(
                      color: Color(0xFF2B333E),
                      fontSize: 32.sp,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  CupertinoSearchTextField(
                    placeholder: 'Поиск',
                    itemSize: 24.sp,
                  )
                ],
              )),
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    child: Container(
                      padding:
                          EdgeInsets.only(bottom: 10.h, top: 10.h, right: 12.w),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Color(0xFFEDF2F6)))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 25.r,
                                child: Text(
                                  'ВВ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
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
                                  Row(
                                    children: [
                                      Text(
                                        'Вы:',
                                        style: TextStyle(
                                          color: Color(0xFF2B333E),
                                          fontSize: 12.sp,
                                          fontFamily: 'Gilroy',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                      Text(
                                        'Уже сделал?',
                                        style: TextStyle(
                                          color: Color(0xFF5D7A90),
                                          fontSize: 12.sp,
                                          fontFamily: 'Gilroy',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          Text(
                            'Вчера',
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
                    ),
                  );
                }),
          )
        ],
      )),
    );
  }
}