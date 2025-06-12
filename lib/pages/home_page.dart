import 'package:flutter/material.dart';
import 'package:minimal_chatapp/components/my_drawer.dart';
import 'package:minimal_chatapp/components/my_usertile.dart';
import 'package:minimal_chatapp/pages/chat_page.dart';
import 'package:minimal_chatapp/services/auth/service_auth.dart';
import 'package:minimal_chatapp/services/chats/chat_service.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final ChatService chatService = ChatService();
  final AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home"),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
      ),
      drawer: MyDrawer(),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
      stream: chatService.getUsersStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Error");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading..");
        }
        return ListView(
          children:
              snapshot.data!
                  .map<Widget>(
                    (userData) => _buildUserListItem(userData, context),
                  )
                  .toList(),
        );
      },
    );
  }

  Widget _buildUserListItem(
    Map<String, dynamic> userData,
    BuildContext context,
  ) {
    if (userData["email"] != authService.getCurrentUser()!.email) {
      return UserTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => ChatPage(
                    receivername: userData["username"],
                    receiverEmail: userData["email"],
                    receiverID: userData["uid"],
                  ),
            ),
          );
        },
        text: userData["username"],
      );
    } else {
      return Container();
    }
  }
}
