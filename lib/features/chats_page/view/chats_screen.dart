import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mozz/features/chats_page/widgets/user_tile.dart';
import 'package:mozz/features/individual_chat_screen/view/individual_chat_screen.dart';
import 'package:mozz/services/auth/auth_service.dart';
import 'package:mozz/services/chat/chat_services.dart';

class ChatsScreen extends StatelessWidget {
  ChatsScreen({super.key});

  // chat auth service
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  void logout() {
    //get auth service
    final _auth = AuthService();
    _auth.signOut();
  }

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      IconButton(onPressed: logout, icon: Icon(Icons.logout))
                    ],
                  ),
                  CupertinoSearchTextField(
                    placeholder: 'Поиск',
                    itemSize: 24.sp,
                  )
                ],
              )),
          Expanded(child: _buildUserList())
        ],
      )),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
        stream: _chatService.getUsersStream(),
        builder: (context, snapshot) {
          // error
          if (snapshot.hasError) {
            return const Text('Error');
          }

          // loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading..');
          }

          // return list view
          return ListView(
            children: snapshot.data!
                .map<Widget>(
                    (userData) => _buildUserListItem(userData, context))
                .toList(),
          );
        });
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    // display all users except currentUser
    if (userData["email"] != _authService.getCurrentsUser()!.email) {
      return UserTile(
        text: userData["email"],
        onTap: () {
          // tapped on a user -> go to chat page
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => IndividualScreen(
                        receiverID: userData["uid"],
                        receiverEmail: userData["email"],
                      )));
        },
      );
    } else {
      return Container();
    }
  }
}
