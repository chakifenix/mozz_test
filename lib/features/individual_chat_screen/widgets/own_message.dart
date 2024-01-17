import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OwnMessageCard extends StatelessWidget {
  const OwnMessageCard({
    super.key,
    required this.message,
  });
  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(right: 20.w),
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 45),
          child: Card(
            elevation: 1,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Color(0xFFF2F2F2),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 10.h, left: 10.w, right: 60.w, bottom: 30.h),
                  child: Text(message),
                ),
                Positioned(
                  bottom: 4.h,
                  right: 10.w,
                  child: Row(
                    children: [
                      Text('time'),
                      SizedBox(
                        width: 5.w,
                      ),
                      const Icon(Icons.done_all)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
